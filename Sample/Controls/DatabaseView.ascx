<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DatabaseView.ascx.cs" Inherits="ASC.Web.Sample.Controls.DatabaseView" %>

<div>
    <h1>How to use ONLYOFFICE DataBase</h1>
    <ol>
        <li>
            Create sample table in DataBase
<pre>
<code>
CREATE TABLE IF NOT EXISTS `sample_table` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `value` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
</code>
</pre>
            or add this code to ..build\sql\onlyoffice.sql script and run them
        </li>
        <li>
            Create data class
<pre>
<code>
public class SampleClass
{
    public int Id { get; set; }
    public string Value { get; set; }
}
</code>
</pre>  
        </li>
        <li>
            Create dao class with CRUD methods
<pre>
<code>
public static class SampleDao
{
    private const string DbId = "core";
    private const string Table = "sample_table";

    private static DbManager GetDb()
    {
        return new DbManager(DbId);
    }

    public static SampleClass Create(string value)
    {
        var result = new SampleClass
            {
                Value = value
            };

        using (var db = GetDb())
        {
            var query = new SqlInsert(Table, true)
                .InColumnValue("id", 0)
                .InColumnValue("value", value)
                .Identity(0, 0, true);
                    
            result.Id = db.ExecuteScalar&lt;int&gt;(query);
        }

        return result;
    }

    public static SampleClass Read(int id)
    {
        using (var db = GetDb())
        {
            var query = new SqlQuery(Table)
                .Select("id", "value")
                .Where(Exp.Eq("id", id));

            var result = db.ExecuteList(query).ConvertAll(x => new SampleClass
                {
                    Id = Convert.ToInt32(x[0]),
                    Value = Convert.ToString(x[1])
                });

            return result.Count > 0 ? result[0] : null;
        }
    }

    public static List&lt;SampleClass&gt; Read()
    {
        using (var db = GetDb())
        {
            var query = new SqlQuery(Table)
                .Select("id", "value");

            return db.ExecuteList(query).ConvertAll(x => new SampleClass
            {
                Id = Convert.ToInt32(x[0]),
                Value = Convert.ToString(x[1])
            });
        }
    }

    public static void Update(int id, string value)
    {
        using (var db = GetDb())
        {
            var existQuery = new SqlQuery(Table).SelectCount().Where(Exp.Eq("id", id));

            if (db.ExecuteScalar&lt;int&gt;(existQuery) == 0)
                throw new Exception("item not found");

            var updateQuery = new SqlUpdate(Table)
                .Set("value", value)
                .Where(Exp.Eq("id", id));

            db.ExecuteNonQuery(updateQuery);
        }
    }

    public static void Delete(int id)
    {
        using (var db = GetDb())
        {
            var query = new SqlDelete(Table).Where("id", id);

            db.ExecuteNonQuery(query);
        }
    }
}
</code>
</pre>
        </li>
        <li>
            build project
        </li>
    </ol>

</div>
