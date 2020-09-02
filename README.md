# iglossary
This will be my portfolio on NC3 at Apple Developer Academy @IBL where I learn SwiftUI for the first time

## App Journey/Background
Challenge + Research + UI + UX + Iteration
https://www.icloud.com/pages/0lRsPoGR1U1RgSZga1wWzQlAA#iGlossary_



For the first starter, I created a new root file called **TermList.swift**.  Since it will be our main screen and display all of our terms, then I deleted ContentView and changed the SceneDelegate to our new root file. 

Second, I prepared our JSON file that contain all of the terms we need to display, then I put in a folder/group called Resources. 

```json
    {
        "id": 1,
        "name": "Algorithm",
        "definition": "A programming algorithm is a computer procedure that is a lot like a recipe (called a procedure) and tells your computer precisely what steps to take to solve a problem or reach a goal",
        "link": "https://www.khanacademy.org/computing/computer-science/algorithms/intro-to-algorithms/v/what-are-algorithms",
    },

```

Third, I created term structure on **Term.swift** that will store all the data we need to build this App. This struct will confirm to Codable, Hashable, and also Identifiable so that our list can iterate over the term list.

```swift
struct Term: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var definition: String
    var link: String
}

```

### loading the data

To load our data, we can decode with generic decode function that will returns an array of the corresponding struct that we want to decode. So I created an extension on Data.swift and load our JSON  file into the struct. 

```swift
let termList: [Term] = load("termList.json")

```


Now, after we get the data in, then we display it on the table list. 

```swift
List(termList) { term in
    Text(term.name)
 }

```

### Showing the detail
Each term have its own definition we will display, so I created **TermDefinition.swift** to represent it, and we also had to  navigate our term on main screen, so I modified the List again.

```swift
 List(termList) { term in
    NavigationLink(destination: TermDefinition(term: term)) {
      Text(term.name)
    }
}
```








