--//Written by @MemAddress
--//Visit me on GitHub, https://github.com/LuauProgrammer

--//Services

local HTTP = game:GetService("HttpService")

--//Variables

local Post = HTTP.PostAsync
local Decode = HTTP.JSONDecode
local Encode = HTTP.JSONEncode

--//Tables

local API = {}

--//Local Functions

local HTTPPost = function(...)
	local Request = Post(HTTP, ...)
	return Decode(HTTP,Request)
end

--//Functions

function API:New(Key, Endpoint)
	if not Endpoint:find('^http[s]?://') then
		error('Endpoint must include http:// or https:// at the beginning')
	end
	self.APIKey = Key or nil
	self.APIEndpoint = Endpoint or nil
	return self
end


function API:Change(StaticCollection,StaticSource,StaticDatabase)
	self.StaticCollection = StaticCollection or self.StaticCollection
	self.StaticDatabase = StaticDatabase or self.StaticDatabase
	self.StaticDataSource = StaticSource or self.StaticDataSource 
	return self
end

function API:FindOne(Filter,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		filter = Filter
	});
	return HTTPPost(self.APIEndpoint.."/action/findOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end

function API:Find(Filter,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		filter = Filter
	});
	return HTTPPost(self.APIEndpoint.."/action/find", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end


function API:InsertOne(DocumentData,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		document = DocumentData
	});
	return HTTPPost(self.APIEndpoint.."/action/insertOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end

function API:InsertMany(DocumentsData,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		documents = DocumentsData
	});
	return HTTPPost(self.APIEndpoint.."/action/insertMany", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end

function API:UpdateOne(Filter,UpdatedDocumentData,Upsert,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		upsert = Upsert or false,
		filter = Filter,
		update = UpdatedDocumentData
	});
	return HTTPPost(self.APIEndpoint.."/action/updateOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end

function API:UpdateMany(Filter,UpdatedDocumentsData,Upsert,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		upsert = Upsert or false,
		filter = Filter,
		update = UpdatedDocumentsData
	});
	return HTTPPost(self.APIEndpoint.."/action/updateMany", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end

function API:DeleteOne(Filter,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		filter = Filter,
	});
	return HTTPPost(self.APIEndpoint.."/action/deleteOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end
function API:DeleteMany(Filters,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		filter = Filters,
	});
	return HTTPPost(self.APIEndpoint.."/action/deleteMany", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end

function API:ReplaceOne(Filter,ReplacedDocumentData,Upsert,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		upsert = Upsert or false,
		filter = Filter,
		replacement = ReplacedDocumentData
	});
	return HTTPPost(self.APIEndpoint.."/action/replaceOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end

function API:Aggregate(Pipeline,Source,Database,Collection)
	local Body = Encode(HTTP,{
		collection = Collection or self.StaticCollection,
		database = Database or self.StaticDatabase,
		dataSource = Source or self.StaticDataSource,
		pipeline = Pipeline,
	});
	return HTTPPost(self.APIEndpoint.."/action/aggregate", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = self.APIKey})
end



return API
