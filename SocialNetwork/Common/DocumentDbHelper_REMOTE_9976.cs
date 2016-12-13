using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using ContactList.Models;
using ContactList.Models.Social;
using Microsoft.Azure.Documents;
using Microsoft.Azure.Documents.Client;

namespace ContactList.Common
{
    public class DocumentDbHelper
    {
        /// <summary>
        /// The Azure DocumentDB endpoint for running this GetStarted sample.
        /// </summary>
        private static readonly string EndpointUri = ConfigurationManager.AppSettings["EndPointUri"];

        /// <summary>
        /// The primary key for the Azure DocumentDB account.
        /// </summary>
        private static readonly string PrimaryKey = ConfigurationManager.AppSettings["PrimaryKey"];


        /// <summary>
        /// Create a database with the specified name if it doesn't exist. 
        /// </summary>
        /// <param name="databaseName">The name/ID of the database.</param>
        /// <returns>The Task for asynchronous execution.</returns>
        public static async Task CreateDatabaseIfNotExists(string databaseName)
        {
            DocumentClient client;

            // Create a new instance of the DocumentClient
            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            // Check to verify a database with the id=FamilyDB does not exist
            try
            {
                await client.ReadDatabaseAsync(UriFactory.CreateDatabaseUri(databaseName));
            }
            catch (DocumentClientException de)
            {
                // If the database does not exist, create a new database
                if (de.StatusCode == HttpStatusCode.NotFound)
                {
                    await client.CreateDatabaseAsync(new Database {Id = databaseName});
                }
                else
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Create a collection with the specified name if it doesn't exist.
        /// </summary>
        /// <param name="databaseName">The name/ID of the database.</param>
        /// <param name="collectionName">The name/ID of the collection.</param>
        /// <returns>The Task for asynchronous execution.</returns>
        public static async Task CreateDocumentCollectionIfNotExists(string databaseName, string collectionName)
        {
            DocumentClient client;

            // Create a new instance of the DocumentClient
            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            try
            {
                await
                    client.ReadDocumentCollectionAsync(UriFactory.CreateDocumentCollectionUri(databaseName,
                        collectionName));
                //this.WriteToConsoleAndPromptToContinue("Found {0}", collectionName);
            }
            catch (DocumentClientException de)
            {
                // If the document collection does not exist, create a new collection
                if (de.StatusCode == HttpStatusCode.NotFound)
                {
                    DocumentCollection collectionInfo = new DocumentCollection();
                    collectionInfo.Id = collectionName;

                    // Optionally, you can configure the indexing policy of a collection. Here we configure collections for maximum query flexibility 
                    // including string range queries. 
                    collectionInfo.IndexingPolicy = new IndexingPolicy(new RangeIndex(DataType.String) {Precision = -1});

                    // DocumentDB collections can be reserved with throughput specified in request units/second. 1 RU is a normalized request equivalent to the read
                    // of a 1KB document.  Here we create a collection with 400 RU/s. 
                    await client.CreateDocumentCollectionAsync(
                        UriFactory.CreateDatabaseUri(databaseName),
                        new DocumentCollection {Id = collectionName},
                        new RequestOptions {OfferThroughput = 400});

                    //this.WriteToConsoleAndPromptToContinue("Created {0}", collectionName);
                }
                else
                {
                    throw;
                }
            }
        }

        public static async Task CreateDocumentIfNotExists(string databaseName, string collectionName,
            DocumentDbEntity entity)
        {
            DocumentClient client;

            // Create a new instance of the DocumentClient
            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            try
            {
                await
                    client.ReadDocumentAsync(UriFactory.CreateDocumentUri(databaseName, collectionName, entity.Id));
                //this.WriteToConsoleAndPromptToContinue("Found {0}", family.Id);
            }
            catch (DocumentClientException de)
            {
                if (de.StatusCode == HttpStatusCode.NotFound)
                {
                    await
                        client.CreateDocumentAsync(
                            UriFactory.CreateDocumentCollectionUri(databaseName, collectionName), entity);
                    //this.WriteToConsoleAndPromptToContinue("Created Family {0}", family.Id);
                }
                else
                {
                    throw;
                }
            }
        }

//        public static T QueryDocumentsById<T>(string databaseName, string collectionName, string id)
//        {
//            //******************************************************************************************************************
//            // 1.4 - Query for documents by a property other than Id
//            //
//            // NOTE: Operations like AsEnumerable(), ToList(), ToArray() will make as many trips to the database
//            //       as required to fetch the entire result-set. Even if you set MaxItemCount to a smaller number. 
//            //       MaxItemCount just controls how many results to fetch each trip. 
//            //       If you don't want to fetch the full set of results, then use CreateDocumentQuery().AsDocumentQuery()
//            //       For more on this please refer to the Queries project.
//            //
//            // NOTE: If you want to get the RU charge for a query you also need to use CreateDocumentQuery().AsDocumentQuery()
//            //       and check the RequestCharge property of this IQueryable response
//            //       Once again, refer to the Queries project for more information and examples of this
//            //******************************************************************************************************************
//            Console.WriteLine("\n1.4 - Querying for a document using its AccountNumber property");
//
////            DocumentClient client;
////
////            // Create a new instance of the DocumentClient
////            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);
////
////            DocumentDbEntity entity = client.CreateDocumentQuery<DocumentDbEntity>(
////                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName))
////                .Where(x =>x.Id  == id)
////                .AsEnumerable()
////                .First();
////
////            var document = (DocumentDbEntity) entity;
////
////            return entity;
//        }
//
//        public static PostEntity QueryDocuments<T>(string databaseName, string collectionName, string id)
//        {
//            //******************************************************************************************************************
//            // 1.4 - Query for documents by a property other than Id
//            //
//            // NOTE: Operations like AsEnumerable(), ToList(), ToArray() will make as many trips to the database
//            //       as required to fetch the entire result-set. Even if you set MaxItemCount to a smaller number. 
//            //       MaxItemCount just controls how many results to fetch each trip. 
//            //       If you don't want to fetch the full set of results, then use CreateDocumentQuery().AsDocumentQuery()
//            //       For more on this please refer to the Queries project.
//            //
//            // NOTE: If you want to get the RU charge for a query you also need to use CreateDocumentQuery().AsDocumentQuery()
//            //       and check the RequestCharge property of this IQueryable response
//            //       Once again, refer to the Queries project for more information and examples of this
//            //******************************************************************************************************************
//            Console.WriteLine("\n1.4 - Querying for a document using its AccountNumber property");
//
//            DocumentClient client;
//
//            // Create a new instance of the DocumentClient
//            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);
//
//            T entity = client.CreateDocumentQuery<T>(
//                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName))
//                .Where(so => so.Id == id)
//                .AsEnumerable()
//                .First();
//
//            return entity;
//        }
        public static async Task<bool> DeleteDocument(string databaseName, string collectionName,
            string entityId)
        {
            DocumentClient client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            try
            {
                await client.DeleteDocumentAsync(UriFactory.CreateDocumentUri(databaseName, collectionName, entityId));
            }
            catch (DocumentClientException de)
            {
                //throw de;
                return false;
            }

            return true;
        }

        /// <summary>
        /// Function get post data
        /// </summary>
        /// <param name="databaseName">databaseName</param>
        /// <param name="collectionName">collectionName</param>
        /// <param name="userId">userId</param>
        /// <param name="page">page</param>
        /// <param name="pageSize">pageSize</param>
        /// <returns>List post data comment</returns>
        public static List<PostCommentEntity> QueryDocumentsPost(string databaseName, string collectionName,
            string userId,
            int page,
            int pageSize)
        {
            DocumentClient client;

            // Create a new instance of the DocumentClient
            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            List<PostCommentEntity> entity = client.CreateDocumentQuery<PostCommentEntity>(
                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName))
                .Where(x => x.Author.Id == userId)
                .AsEnumerable()
                .Skip((page - 1)*pageSize)
                .Take(pageSize).Select(i => new PostCommentEntity()
                {
                    Id = i.Id,
                    Author = i.Author,
                    BaseAuthor = i.BaseAuthor,
                    Content = i.Content,
                    Type = i.Type,
                    Likes = i.Likes,
                    IsDeleted = i.IsDeleted,
                    ImageUrls = string.IsNullOrEmpty(i.ImageUrls) == true
                        ? i.ImageUrls
                        : FileHelper.BaseUrlService() + i.ImageUrls,
                    CreatedDate = i.CreatedDate,
                    UpdatedDate = i.UpdatedDate
                })
                .ToList();

            return entity;
        }

        /// <summary>
        /// Function get data post by user id and post id
        /// </summary>
        /// <param name="databaseName">databaseName</param>
        /// <param name="collectionName">collectionName</param>
        /// <param name="userId">userId</param>
        /// <param name="postId">postId</param>
        /// <returns>List post data comment</returns>
        public static PostCommentEntity QueryDocumentsGetPostByUserIdPostId(string databaseName, string collectionName,
            string userId, string postId)
        {
            DocumentClient client;

            // Create a new instance of the DocumentClient
            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            PostCommentEntity entity = client.CreateDocumentQuery<PostCommentEntity>(
                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName))
                .Where(x => x.Author.Id == userId && x.Id == postId).AsEnumerable().Select(i => new PostCommentEntity()
                {
                    Id = i.Id,
                    Author = i.Author,
                    BaseAuthor = i.BaseAuthor,
                    Content = i.Content,
                    Type = i.Type,
                    Likes = i.Likes,
                    IsDeleted = i.IsDeleted,
                    ImageUrls = string.IsNullOrEmpty(i.ImageUrls) == true
                        ? i.ImageUrls
                        : FileHelper.BaseUrlService() + i.ImageUrls,
                    CreatedDate = i.CreatedDate,
                    UpdatedDate = i.UpdatedDate
                }).FirstOrDefault();

            return entity;
        }

        /// <summary>
        /// Function get data comment
        /// </summary>
        /// <param name="databaseName">databaseName</param>
        /// <param name="collectionName">collectionName</param>
        /// <param name="postId">postId</param>
        /// <param name="page">page</param>
        /// <param name="pageSize">pageSize</param>
        /// <returns>Return list comment data</returns>
        public static List<CommentEntity> QueryDocumentsComment(string databaseName, string collectionName,
            string postId, int page,
            int pageSize)
        {
            DocumentClient client;

            // Create a new instance of the DocumentClient
            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            List<CommentEntity> entity = client.CreateDocumentQuery<CommentEntity>(
                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName))
                .Where(x => x.PostId == postId)
                .AsEnumerable()
                .Skip((page - 1)*pageSize)
                .Take(pageSize).Select(i => new CommentEntity()
                {
                    Id = i.Id,
                    PostId = i.PostId,
                    ImageUrls = string.IsNullOrEmpty(i.ImageUrls) == true
                        ? i.ImageUrls
                        : FileHelper.BaseUrlService() + i.ImageUrls,
                    Author = i.Author,
                    Content = i.Content,
                    CreatedDate = i.CreatedDate,
                    UpdatedDate = i.UpdatedDate,
                })
                .ToList();

            return entity;
        }

        /// <summary>
        /// Function get data comment
        /// </summary>
        /// <param name="databaseName">databaseName</param>
        /// <param name="collectionName">collectionName</param>
        /// <param name="postId">postId</param>
        /// <returns>Return list comment data</returns>
        public static List<CommentEntity> QueryDocumentsComment(string databaseName, string collectionName,
            string postId)
        {
            DocumentClient client;

            // Create a new instance of the DocumentClient
            client = new DocumentClient(new Uri(EndpointUri), PrimaryKey);

            List<CommentEntity> entity = client.CreateDocumentQuery<CommentEntity>(
                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName))
                .Where(x => x.PostId == postId)
                .AsEnumerable().Select(i => new CommentEntity()
                {
                    Id = i.Id,
                    PostId = i.PostId,
                    ImageUrls = string.IsNullOrEmpty(i.ImageUrls) == true
                        ? i.ImageUrls
                        : FileHelper.BaseUrlService() + i.ImageUrls,
                    Author = i.Author,
                    Content = i.Content,
                    CreatedDate = i.CreatedDate,
                    UpdatedDate = i.UpdatedDate,
                })
                .ToList();

            return entity;
        }
    }
}