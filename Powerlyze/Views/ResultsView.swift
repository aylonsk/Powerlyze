//
//  ResultsView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/27/24.
//

import SwiftUI

struct ResultsView: View {
    var user: User?
    @EnvironmentObject var usermodel: UserModel
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                if let unwrappedUser = user {
                        
                    let unwrappedUser = user!
                    if unwrappedUser.total >= 0 {
                        Text("Your Total Is...")
                        VariableTextView(variableText: String(unwrappedUser.total) + "lbs")
                            .font(.title)
                        Text("and your Strength Level Is...")
                        VariableTextView(variableText: (unwrappedUser.strengthLevel()))
                            .font(.title)
                        switch unwrappedUser.strengthLevel() {
                        case "Beginner":
                            Text("Everyone's gotta start somewhere! If you're at this strength level, its entirely possible that you're still very fit. Genetics, low bodyweight, or a different training style could all contribute to you being a great athlete, but not the best powerlifter. The good news though, is that almost anyone can rise out of this level with the right changes. Try bulking up, or switching your routine to a more power-centric one! Or, if you're actually new to lifting, just keep working hard and learning, then get back to us in a few months.")
                                .padding()
                                .multilineTextAlignment(.center)
                        case "Novice":
                            Text("Although it doesn't sound all that impressive, you're probably getting to some pretty respectable numbers at this point. Perhaps you've trained in powerlifting for a bit, or you've just been in the gym a while. Either way, you should feel proud of your strength and your progress. But don't worry, you've still got plenty of room to grow!")
                                .padding()
                                .multilineTextAlignment(.center)
                        case "Intermediate":
                            Text("If you made it to this level, congrats! Very few people make it this far by accident. By now, powerlifting/lifting is probably important to you, maybe even a part of who you are. However, this is also a big crossroads for many people, as progress may get slower without some big changes. If you're content with the way your current strength turns heads, that's great! If not, it might be helpful to get a coach to get you a custom program, or try an existing one online.")
                                .padding()
                                .multilineTextAlignment(.center)
                        case "Advanced":
                            Text("Ok, you're strong. While genetics, bodyweight, and training style all make a difference, only you know how hard you worked to get here. At this point, its too late to turn back. Don't you want to find out how strong you can get? Go for it! Get on that bulk, try that program, and squeeze out every last drop of progress you can. You'll thank youself in the future, when your kids start arguing about who's dad would win in a fight.")
                                .padding()
                                .multilineTextAlignment(.center)
                        case "Elite":
                            Text("Now we're getting into the territory of freakish strength. You likely outlift influencers you used to look up to. Maybe you're a competitor in state and global competitions, maybe you've even won a few. Genetics definitely play a part in getting this far, but it was only possible through years of hard work and sacrifice. Your devotion is admirable.")
                                .padding()
                                .multilineTextAlignment(.center)
                        case "Professional":
                            Text("Well, it's in the name. You have a level of strength that you can use to compete at a global level, and make a name for yourself both as an influencer and a powerlifter. If you look at USA Powerlifting World Rankings, you're within the top 1000 total strength of powerlifters worldwide. Insane.")
                                .padding()
                                .multilineTextAlignment(.center)
                        case "#1":
                            Text("Currently, the all-time highest recorded total in competition is from Daniel Bell, at 2606.9lbs...wait. Do my eyes decieve me? I think we have a new champion in town! Well go ahead! Sign up for your nearest competition today, and claim your throne as the new strongest powerlifter - oh what's that? You don't want to? Yeah, that's what I thought.")
                                .padding()
                                .multilineTextAlignment(.center)
                        default:
                            Text("Error, Please Try Again")
                        }
                        Spacer()
                        NavigationLink(destination: SaveView(user: unwrappedUser, navigationPath: $navigationPath)
                            .environmentObject(usermodel)
                        ) {
                            Text("Next")
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.red)
                                .cornerRadius(10)
                                .navigationBarTitle("Back", displayMode: .inline)
                        }
                    }
                        
                                    }
                else {
                    Text("Error, Please Try Again")
                        .font(.title)
                    Spacer()
                }
                
            }
            .padding()
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ResultsView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserModel())
}
