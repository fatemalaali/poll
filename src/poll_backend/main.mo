import Text "mo:base/Text";
import RBTree "mo:base/RBTree";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Option "mo:base/Option";


actor {
  var question : Text = "What is your favorite programming language?";
  var votes : RBTree.RBTree<Text, Nat> = RBTree.RBTree(Text.compare);

  public query func getQuestion() : async Text {
    question;
  };

// Ret Value: Array holds tuple elements (an arry of tuples)
  public query func getVotes() : async [(Text, Nat)] {
    Iter.toArray(votes.entries());
  };

  public func vote(vote: Text) : async [(Text, Nat)] {
    let voteCount : Nat = Option.get(votes.get(vote), 0);
    votes.put(vote, voteCount + 1);
    Iter.toArray(votes.entries());
  };

  public func resetVotes() : async [(Text, Nat)] {

      votes.put("Motoko", 0);
      votes.put("Rust", 0);
      votes.put("TypeScript", 0);
      votes.put("Python", 0);
      Iter.toArray(votes.entries())

    };
};
