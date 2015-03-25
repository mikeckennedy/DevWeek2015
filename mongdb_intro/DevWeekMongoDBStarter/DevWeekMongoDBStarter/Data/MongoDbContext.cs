using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace DevWeekMongoDBStarter.Data
{
	public class MongoDbContext : MongoDB.Kennedy.MongoDbDataContext
	{
		public MongoDbContext() : base("DevWeekDemo_2015")
		{
		}

		public IQueryable<Book> Books
		{
			get { return base.GetCollection<Book>(); }
		}
	}

	//[BsonIgnoreExtraElements]
	public class Book
	{
		public ObjectId Id { get; set; }
		public string Title { get; set; }
		//public List<Author> Authors { get; set; }
		//public List<Author> PrimaryAuthors
		//{
		//	get; set; }
		public int PageCount { get; set; }
		public DateTime PublishedDate { get; set; }

		[BsonExtraElements]
		public BsonDocument AdditionalData { get; set; }

		public Book()
		{
			//this.PrimaryAuthors = new List<Author>();
		}
	}

	public class Author
	{
		public string Name { get; set; }
		public byte[] Photo { get; set; }
	}
}
