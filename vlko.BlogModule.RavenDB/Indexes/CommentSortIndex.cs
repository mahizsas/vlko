﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Lucene.Net.Analysis.Standard;
using Raven.Abstractions.Indexing;
using Raven.Client.Indexes;
using vlko.BlogModule.Roots;

namespace vlko.BlogModule.RavenDB.Indexes
{
	public class CommentSortIndex : AbstractIndexCreationTask<Comment>
	{
		public CommentSortIndex()
		{
			Map = comments => from item in comments
			               select new { Content_Id = item.Content.Id, item.CreatedDate, item.Level };
            Analyzers.Add(comment => comment.Id, typeof(StandardAnalyzer).FullName);
            Index(item => item.Content.Id, FieldIndexing.Analyzed);
		}
	}
}
