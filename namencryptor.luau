--[[

  First part of the name will be Base64 encrypted name of a fruit, second part will be
  a symbol ($#@!^), third part will be another Base64 encrypted name instead of a fruit
  it is a random country in America. This will encrypt all of the descendants in an item
  you choose (Line 62).

]]--

local fruits = {
    "Apple", "Apricot", "Avocado", "Banana", "Blackberry", "Blackcurrant", "Blueberry", "Boysenberry",
    "Cantaloupe", "Cherry", "Clementine", "Coconut", "Cranberry", "Date", "Dragonfruit", "Durian",
    "Elderberry", "Feijoa", "Fig", "Gooseberry", "Grape", "Grapefruit", "Guava", "Honeydew", "Jackfruit",
    "Kiwi", "Kumquat", "Lemon", "Lime", "Lychee", "Mango", "Mulberry", "Nectarine", "Orange", "Papaya",
    "Passionfruit", "Peach", "Pear", "Pineapple", "Plum", "Pomegranate", "Raspberry", "Strawberry",
    "Tangerine", "Watermelon"
}

local counties = {
    "Los Angeles", "Cook", "Harris", "Maricopa", "San Diego", "Orange", "Miami-Dade", "Dallas", 
    "Kings", "Riverside", "Queens", "San Bernardino", "Clark", "Tarrant", "Santa Clara", "Broward",
    "Wayne", "Bexar", "New York", "Philadelphia", "Alameda", "Middlesex lol", "Sacramento", "Bronx", 
    "Nassau", "Palm Beach", "Cuyahoga", "Hillsborough", "Allegheny", "Oakland", "Franklin", "Hennepin",
    "Orange", "Fairfax", "Contra Costa", "Salt Lake", "Travis", "Pima", "St. Louis", "Montgomery",
    "Milwaukee", "Fresno", "Shelby", "Fulton", "Mecklenburg", "Wake", "Erie", "Pinellas", "Honolulu",
    "Collin", "Fairfield", "Westchester", "Duval", "Monroe", "Ventura", "Fort Bend", "Hidalgo", 
    "Kern", "Chester", "Bergen", "Plymouth", "Denton", "Stanislaus", "Gwinnett", "Montgomery", 
    "Summit", "El Paso", "Tulsa", "Polk", "Cobb", "Lake", "Will", "Monmouth", "DeKalb", "Norfolk",
    "Bucks", "San Joaquin", "Baltimore", "Jefferson", "Providence", "Suffolk", "Hampshire"
}

local symbols = {"$", "#", "!", "@", "^"}

function base64_encode(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r, b = '', x:byte()
        for i = 8, 1, -1 do r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0') end
        return r
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0) end
        return b:sub(c + 1, c + 1)
    end) .. ({ '', '==', '=' })[#data % 3 + 1])
end

function getRandomElement(list)
    return list[math.random(#list)]
end

function getRandomSymbols(count)
    local result = ""
    for i = 1, count do
        result = result .. getRandomElement(symbols)
    end
    return result
end

function encryptItemName(itemName)
    local encodedName = base64_encode(itemName)
    local splitIndex = math.floor(#encodedName / 2)
    local partOne = encodedName:sub(1, splitIndex)
    local partTwo = encodedName:sub(splitIndex + 1)
    local fruit = getRandomElement(fruits)
    local county = getRandomElement(counties)
    local randomSymbols = getRandomSymbols(math.random(4, 8))
    local encryptedName = partOne .. fruit .. randomSymbols .. partTwo .. county
    return encryptedName
end

function encryptAllDescendants(parent)
    for _, descendant in pairs(parent:GetDescendants()) do
        if descendant:IsA("BasePart") then
            local originalName = descendant.Name
            local encryptedName = encryptItemName(originalName)
            print("Original Name: " .. originalName .. " -> Encrypted Name: " .. encryptedName)
        end
    end
end

encryptAllDescendants(ReplaceME!!!) -- Put thing here
