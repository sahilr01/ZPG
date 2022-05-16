//
//  main.swift
//  Zero Player Game
//
//  Created by admin on 11/19/19.
//  Copyright © 2019 admin. All rights reserved.
//
import Foundation

print("Your adventurer enters the Dungeon!")
//Person class, all other classes inherit from this
class Person {
    
    var name : String
    var hitPoints : Int
    var damage : Int
    var hitChance :Int
    var armor : Int
  var type : String
    
    //intilizes all the properties
    init() {
        self.name = ""
        self.hitPoints = 100
        self.damage = 0
        self.hitChance = 0
        self.armor = 0
      self.type = ""
    }
  //Used for attacking throughout fights
    func Chance() -> Bool{
      //  if self.hitChance/10 >= Int.random(in: 1...10){
        if self.hitChance/10 >= Int.random(in: 1...1){
            return true
        }
        return false
    }
}// end adventurer

// define adenturer subclasses
//Warrior Subclass
// 13 9 7 25 15 12
class Warrior : Person {
    
    override init() {
        super.init()
        self.damage = 30
          self.armor = 75
        self.hitChance = 70
      self.type = "Warrior"
      self.name = "Sidd"
    }

}
//Mage Subclass
// 17 9 8 7 8 17
class Mage : Person {
 
    override init() {
        super.init()
        self.damage = 75
          self.armor = 45
        self.hitChance = 55
      self.type = "Mage"
      self.name = "Dev"
        
    }
}
//Rogue Subclass
// 17 11 10 17 19
class Rogue : Person {
    
    override init() {
        super.init()
        self.damage = 50
        self.armor = 55
        self.hitChance = 65
      self.type = "Rogue"
      self.name = "Vikram"
    }
}
//Monster structure
struct Monster{
   
    var hitPoints : Int
    var damage : Int
    var hitChance :Int
    var armor : Int
    var name : String
  //function used for monster attacks
    func ChanceMonster() -> Bool{
      //   if self.hitChance/10 >= Int.random(in: 1...1){
        if self.hitChance/10 >= Int.random(in: 1...10){
            return true
        }
        return false
    }
    
}
//Defining all the Monsters with their stats
var Goblin = Monster(hitPoints: 100, damage: 10, hitChance: 50, armor: 10, name: "Goblin")
var Orc = Monster(hitPoints: 100, damage: 10, hitChance: 30, armor: 30, name: "Orc")
var GreenSlime = Monster(hitPoints: 100, damage: 10, hitChance: 50, armor: 10, name: "Green Slime")
var LargeBat = Monster(hitPoints: 100, damage: 10, hitChance: 30, armor: 30, name: "Large Bat")
var Ogre = Monster(hitPoints: 100, damage: 20, hitChance: 30, armor: 30, name: "Ogre")
var Troll = Monster(hitPoints: 100, damage: 30, hitChance: 10, armor: 50, name: "Troll")
//Creating an array with the monsters
var monsters: [Monster] = [Goblin, Orc, GreenSlime, LargeBat, Ogre, Troll]


//creating player objects
let warrior = Warrior()
let rogue = Rogue()
let mage = Mage()
//creating player array
let players: [Person] = [warrior, rogue, mage]
//Randomly Selectly a player

//let currentPlayer = players[Int.random(in: 2...2)]
let currentPlayer = players[Int.random(in: 0...2)]
//creating global variables
var dead = false
var monsterDead = false
var count = 1
//creating potion list to randomly draw from
let potions:[String] = ["Health", "Strength", "Accuracy"]
//Displaying player and play information to user
print("Your name is \(currentPlayer.name), a \(currentPlayer.type)")
if currentPlayer.type == "Warrior"{
  print("You have Low Damage, High Armor and High Hit Chance")
}
else if currentPlayer.type == "Mage"{
  print("You have High Damage, Low Armor and Low Hit Chance")
}
else{
  print("You have Medium Damage, Medium Armor and Medium Hit Chance")
}
//Random Chance function for other interactions
func RandChance(hitChance:Int) -> Bool{
  //if hitChance/10 >= Int.random(in:1...1){
    if hitChance/10 >= Int.random(in:1...10){
        return true
    }
    return false
}
//Start of game loop
while dead == false{
    monsterDead = false
  //displays what room you are entering
    print("ENTERING ROOM \(count)")
  //randomly seleccting a mosnter
  // let monsterChance: Int = Int.random(in: 0...0)
    let monsterChance: Int = Int.random(in: 0...5)
    var currentMonster = monsters[monsterChance]

//10% chance to get a potion 
    if RandChance(hitChance: 10) {
      // let potionChance: Int = Int.random(in: 0...0)
        let potionChance: Int = Int.random(in: 0...2)
    let currentPotion = potions[potionChance]
        print("You got a potion of \(currentPotion)")
      //randomly selects one of the three potions
        if currentPotion == "Health"{
            print("+25 Health")
            currentPlayer.hitPoints += 25
    }
        else if currentPotion == "Strength"{
            print("+10 Damage")
            currentPlayer.damage += 10
    }
        else if currentPotion == "Accuracy" {
            print("+5 Hit Chance")
            currentPlayer.hitChance += 5
     }
    }
  //chance to uprade both sword an armor
   // else if RandChance(hitChance: 100) {
    else if RandChance(hitChance: 10) {
      //  if RandChance(hitChance: 100){
        if RandChance(hitChance: 50){
            print("You have recieved an upgraded Sword")
            print("+10 damage")
          //making sure to use the += operater in case this upgrade is goten multiple times
            currentPlayer.damage += 10
        }
        else{
            print("You have recieved additional Armor")
            print("+15 armor")
            currentPlayer.armor += 15
        }
    }
  //20% chance to get a treasure drop
     // else if RandChance(hitChance: 100){
    else if RandChance(hitChance: 20){
        print("You found a treasure drop")
      //chance to get a totem or a helmet
         //  if RandChance(hitChance: 100){
        if RandChance(hitChance: 50) {
            print("You recieved a totem that increase your hit chance")
            print("+5 Hit Chance")
            currentPlayer.hitChance += 5
        }
        else {
            print("You found a spare helmet that protects your head")
            print("+10 Armor")
            currentPlayer.armor += 10
        }
    }
  //tiernary operator to ensure that the proper article is used before the monster's name
    print("Hero encounters \(currentMonster.name == "Orc" || currentMonster.name == "Ogre" ? "an" : "a") \(currentMonster.name)")
  //loop for each stage
    while dead == false && monsterDead == false{
  //displays armor and health
        print("You have \(currentPlayer.hitPoints) health and \(currentPlayer.armor) armor")
//displays monster's heath and armor
          print("The \(currentMonster.name) has \(currentMonster.hitPoints) health and \(currentMonster.armor) armor")
      //this function sees if the player will miss or hit
        if currentPlayer.Chance(){
             print("You hit the monster for \(currentPlayer.damage) damage")
          //breaks the armor if needed
            if currentMonster.armor > 0 {
                currentMonster.armor -= currentPlayer.damage
                if currentMonster.armor <= 0{
                    print("The \(currentMonster.name)'s Armor Broke")
                    currentMonster.armor = 0
                }
            }
          //if there is no armor deal damage to the healht
            else{
                currentMonster.hitPoints -= currentPlayer.damage
                
            }
          //killing the monster
            if currentMonster.hitPoints <= 0{
                print("You have killed a \(currentMonster.name) on dungeon \(count)")
                 
                currentMonster.hitPoints = 0
              monsterDead = true
              
            }
            else{
             
              
                print("The \(currentMonster.name) has \(currentMonster.hitPoints) health and \(currentMonster.armor) armor")
            }
            
        }
        else{
            print("You missed your attack")
        }
        //Monster Attacks
      //if the monster is dead do not do these
   if monsterDead == false{
     //sees if attack lands
    if currentMonster.ChanceMonster(){
        print("The monster hit you for \(currentMonster.damage)")
      //sees if the player has armor and breaks it if needed
        if currentPlayer.armor > 0 {
            currentPlayer.armor -= currentMonster.damage
            if currentPlayer.armor <= 0{
                print("Your Armor Broke")
                currentPlayer.armor = 0
            }
        }
      //If there is no armor if takes away the health
        else{
            currentPlayer.hitPoints -= currentMonster.damage
        }
    //Shows when you died
        if currentPlayer.hitPoints <= 0{
            print("You have died to a \(currentMonster.name) on dungeon \(count)")
            dead = true
        }
       
    }
     //If the function returns false is shows a miss
    else{
        print("The \(currentMonster.name) missed")
    }
   }
    }
  //increases the count for the rounds
    count += 1

}
//shows that the game is over
print("The game is over")

