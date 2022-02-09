--//Written by @MemAddress
--//Visit me on GitHub, https://github.com/LuauProgrammer

--//Services
local HTTP = game:GetService("HttpService")

--//Tables
local API = {}

--//Variables
local APIKey = nil
local APIEndpoint = nil
local StaticCollection = nil
local StaticDatabase = nil
local StaticDataSource = nil

--//Modules

API.SetAPIKey = function(Key)
	APIKey = Key
end

API.SetEndpoint = function(Endpoint)
	APIEndpoint = Endpoint
end

API.SetStaticCollection = function(Collection)
	StaticCollection = Collection
end

API.SetStaticDataSource = function(Source)
	StaticCollection = Source
end

API.SetStaticDatabase = function(Database)
	StaticDatabase = Database
end

API.FindOne = function(Filter,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		filter = Filter
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/findOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end     

API.Find = function(Filter,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		filter = Filter
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/find", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end     


API.InsertOne = function(DocumentData,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		document = DocumentData
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/insertOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end

API.InsertMany = function(DocumentsData,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		documents = DocumentsData
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/insertMany", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end

API.UpdateOne = function(Filter,UpdatedDocumentData,Upsert,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		upsert = Upsert or false,
		filter = Filter,
		update = UpdatedDocumentData
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/updateOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end

API.UpdateMany = function(Filter,UpdatedDocumentsData,Upsert,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		upsert = Upsert or false,
		filter = Filter,
		update = UpdatedDocumentsData
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/updateMany", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end

API.DeleteOne = function(Filter,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		filter = Filter,
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/deleteOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end

API.DeleteMany = function(Filters,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		filter = Filters,
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/deleteMany", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end

API.ReplaceOne = function(Filter,ReplacedDocumentData,Upsert,Source,Database,Collection)
	if APIKey == nil or APIEndpoint == nil then return error("Endpoint or key is nil") end
	local Body = HTTP:JSONEncode({
		collection = Collection or StaticCollection,
		database = Database or StaticDatabase,
		dataSource = Source or StaticDataSource,
		upsert = Upsert or false,
		filter = Filter,
		replacement = ReplacedDocumentData
	});
	local Request = HTTP:PostAsync(APIEndpoint.."/action/replaceOne", Body, Enum.HttpContentType.ApplicationJson, false, {["api-key"] = APIKey})
	return HTTP:JSONDecode(Request)
end


return API
