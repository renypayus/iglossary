# Rebuild iglossary with SwiftUI
 
This will be my portfolio on NC3 at Apple Developer Academy @IBL where I learn SwiftUI for the first time

## SwiftUI

> SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.
> - Apple 

So, SwiftUI is a declarative framework like React and Vue ✅. Now let’s back to the basic programming knowledge:

**What is Declarative Programming?**

Declarative programming paradigm is a style of programming that expresses the logic of a computation without describing its control flow. It was like you ask your friend to draw a landscape. You don’t care how they draw it, it’s up to them.
In other words, the approach is to focus on what needs to be achieved instead of instructing how to achieve it.

### The Basic

```swift
struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Text("list")
                    Text("list")
                    Text("list")
                    Text("list")
                }
            }
        }
    }
}
```

#### Struct
When coding in UIKit we always use `class`  for views rather than `struct`, but in SwiftUI we use `struct` by default to represent common kinds of data.

#### View
In SwiftUI, Most of every component is called View. Body is a View. Text is a View,  List is another View and a NavigationView is obviously a View.

## Implementation

In this Challenge I have to rebuild an app I had build in [NC1] (https://www.icloud.com/pages/0lRsPoGR1U1RgSZga1wWzQlAA#iGlossary_) with UIKit into SwiftUI.

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

To load our data, we can decode with generic decode function that will returns an array of the corresponding struct that we want to decode. So I created an extension on **Data.swift** and load our JSON  file into the struct. 

```swift
let termList: [Term] = load("termList.json")

```


Now, after we get the data in, then we display it on the table list. 

```swift
List(termList) { term in
    Text(term.name)
 }

```

![Main Screen](https://raw.githubusercontent.com/renypayus/iglossary/master/main%20screen.png)

### Showing the detail
Each term have its own definition we will display, so I created **TermDefinition.swift** to represent it.

![Definition Screen](https://raw.githubusercontent.com/renypayus/iglossary/master/definition%20screen.png)

And we also had to  navigate our term on main screen, so I modified the List again.

```swift
 List(termList) { term in
    NavigationLink(destination: TermDefinition(term: term)) {
      Text(term.name)
    }
}
```

![Definition Screen](https://raw.githubusercontent.com/renypayus/iglossary/master/navigation%20link.png)



### Search Bar *(On-Going)*



# Conclusion
**Good point I learnt from SwiftUI**

* Faster: SwiftUI help us develop our UI faster, even faster than Storyboards. Me and my former teammate are not a big fan of Interface Builder, so we decided to developing our App without Storyboards back then, but I did not really enjoy developing the UI because it was really takes time.
* Easy to learn: Since I am more familiar with declarative syntax, it’s easier for me to learn it and I love it.
* It has live preview feature and it’s really help.
* It can be mixed with UIKit.
* It produces a valid layout, so there’s no auto layout related problem. Instead, you can use syntax like VStack, HStack, ZStack, List, Group and more.

**The disadvantage of SwiftUI**

It will only work on devices with IOS 13 and higher so it’s not production ready. If you just want to create a super simple app or challenge project, SwiftUI is fun to learn. 




# Further Reading
- [Programming Paradigm] (https://www.geeksforgeeks.org/introduction-of-programming-paradigms/)
- [SwiftUI] (https://developer.apple.com/xcode/swiftui/)
- [SwiftUI Documentation] (https://developer.apple.com/documentation/swiftui)
- [100 days of SwiftUI] (https://www.hackingwithswift.com/100/swiftui/1)
- [SwiftUI Tutorial] (https://developer.apple.com/tutorials/swiftui)
- [Structures and Classes] (https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
