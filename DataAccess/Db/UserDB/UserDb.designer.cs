﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess.Db.UserDB
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="wdmfglrf_SOCIAL_NETWORK")]
	public partial class UserDbDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InserttbDevice(tbDevice instance);
    partial void UpdatetbDevice(tbDevice instance);
    partial void DeletetbDevice(tbDevice instance);
    partial void InserttbUser(tbUser instance);
    partial void UpdatetbUser(tbUser instance);
    partial void DeletetbUser(tbUser instance);
    #endregion
		
		public UserDbDataContext() : 
				base(global::DataAccess.Properties.Settings.Default.wdmfglrf_SOCIAL_NETWORKConnectionString1, mappingSource)
		{
			OnCreated();
		}
		
		public UserDbDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public UserDbDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public UserDbDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public UserDbDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<tbDevice> tbDevices
		{
			get
			{
				return this.GetTable<tbDevice>();
			}
		}
		
		public System.Data.Linq.Table<tbUser> tbUsers
		{
			get
			{
				return this.GetTable<tbUser>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tbDevice")]
	public partial class tbDevice : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _DeviceId;
		
		private string _Token;
		
		private string _UserName;
		
		private EntityRef<tbUser> _tbUser;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnDeviceIdChanging(string value);
    partial void OnDeviceIdChanged();
    partial void OnTokenChanging(string value);
    partial void OnTokenChanged();
    partial void OnUserNameChanging(string value);
    partial void OnUserNameChanged();
    #endregion
		
		public tbDevice()
		{
			this._tbUser = default(EntityRef<tbUser>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DeviceId", DbType="NVarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string DeviceId
		{
			get
			{
				return this._DeviceId;
			}
			set
			{
				if ((this._DeviceId != value))
				{
					this.OnDeviceIdChanging(value);
					this.SendPropertyChanging();
					this._DeviceId = value;
					this.SendPropertyChanged("DeviceId");
					this.OnDeviceIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Token", DbType="NVarChar(100) NOT NULL", CanBeNull=false)]
		public string Token
		{
			get
			{
				return this._Token;
			}
			set
			{
				if ((this._Token != value))
				{
					this.OnTokenChanging(value);
					this.SendPropertyChanging();
					this._Token = value;
					this.SendPropertyChanged("Token");
					this.OnTokenChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string UserName
		{
			get
			{
				return this._UserName;
			}
			set
			{
				if ((this._UserName != value))
				{
					if (this._tbUser.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnUserNameChanging(value);
					this.SendPropertyChanging();
					this._UserName = value;
					this.SendPropertyChanged("UserName");
					this.OnUserNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tbUser_tbDevice", Storage="_tbUser", ThisKey="UserName", OtherKey="UserName", IsForeignKey=true, DeleteOnNull=true, DeleteRule="CASCADE")]
		public tbUser tbUser
		{
			get
			{
				return this._tbUser.Entity;
			}
			set
			{
				tbUser previousValue = this._tbUser.Entity;
				if (((previousValue != value) 
							|| (this._tbUser.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._tbUser.Entity = null;
						previousValue.tbDevices.Remove(this);
					}
					this._tbUser.Entity = value;
					if ((value != null))
					{
						value.tbDevices.Add(this);
						this._UserName = value.UserName;
					}
					else
					{
						this._UserName = default(string);
					}
					this.SendPropertyChanged("tbUser");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tbUser")]
	public partial class tbUser : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _UserName;
		
		private string _FullName;
		
		private string _Password;
		
		private string _Email;
		
		private System.DateTime _LastLogin;
		
		private string _ImageUrl;
		
		private EntitySet<tbDevice> _tbDevices;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnUserNameChanging(string value);
    partial void OnUserNameChanged();
    partial void OnFullNameChanging(string value);
    partial void OnFullNameChanged();
    partial void OnPasswordChanging(string value);
    partial void OnPasswordChanged();
    partial void OnEmailChanging(string value);
    partial void OnEmailChanged();
    partial void OnLastLoginChanging(System.DateTime value);
    partial void OnLastLoginChanged();
    partial void OnImageUrlChanging(string value);
    partial void OnImageUrlChanged();
    #endregion
		
		public tbUser()
		{
			this._tbDevices = new EntitySet<tbDevice>(new Action<tbDevice>(this.attach_tbDevices), new Action<tbDevice>(this.detach_tbDevices));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserName", DbType="NVarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string UserName
		{
			get
			{
				return this._UserName;
			}
			set
			{
				if ((this._UserName != value))
				{
					this.OnUserNameChanging(value);
					this.SendPropertyChanging();
					this._UserName = value;
					this.SendPropertyChanged("UserName");
					this.OnUserNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FullName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string FullName
		{
			get
			{
				return this._FullName;
			}
			set
			{
				if ((this._FullName != value))
				{
					this.OnFullNameChanging(value);
					this.SendPropertyChanging();
					this._FullName = value;
					this.SendPropertyChanged("FullName");
					this.OnFullNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Password", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string Password
		{
			get
			{
				return this._Password;
			}
			set
			{
				if ((this._Password != value))
				{
					this.OnPasswordChanging(value);
					this.SendPropertyChanging();
					this._Password = value;
					this.SendPropertyChanged("Password");
					this.OnPasswordChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Email", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string Email
		{
			get
			{
				return this._Email;
			}
			set
			{
				if ((this._Email != value))
				{
					this.OnEmailChanging(value);
					this.SendPropertyChanging();
					this._Email = value;
					this.SendPropertyChanged("Email");
					this.OnEmailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastLogin", DbType="DateTime NOT NULL")]
		public System.DateTime LastLogin
		{
			get
			{
				return this._LastLogin;
			}
			set
			{
				if ((this._LastLogin != value))
				{
					this.OnLastLoginChanging(value);
					this.SendPropertyChanging();
					this._LastLogin = value;
					this.SendPropertyChanged("LastLogin");
					this.OnLastLoginChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ImageUrl", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string ImageUrl
		{
			get
			{
				return this._ImageUrl;
			}
			set
			{
				if ((this._ImageUrl != value))
				{
					this.OnImageUrlChanging(value);
					this.SendPropertyChanging();
					this._ImageUrl = value;
					this.SendPropertyChanged("ImageUrl");
					this.OnImageUrlChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tbUser_tbDevice", Storage="_tbDevices", ThisKey="UserName", OtherKey="UserName")]
		public EntitySet<tbDevice> tbDevices
		{
			get
			{
				return this._tbDevices;
			}
			set
			{
				this._tbDevices.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_tbDevices(tbDevice entity)
		{
			this.SendPropertyChanging();
			entity.tbUser = this;
		}
		
		private void detach_tbDevices(tbDevice entity)
		{
			this.SendPropertyChanging();
			entity.tbUser = null;
		}
	}
}
#pragma warning restore 1591
