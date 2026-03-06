import Array "mo:core/Array";
import Text "mo:core/Text";
import Map "mo:core/Map";
import Iter "mo:core/Iter";
import Runtime "mo:core/Runtime";

actor {
  // =========================
  // ===== Data Types ========
  // =========================

  type ContactSubmission = {
    name : Text;
    email : Text;
    message : Text;
  };

  module ContactSubmission {
    public func compareByEmail(submission1 : ContactSubmission, submission2 : ContactSubmission) : { #less; #equal; #greater } {
      Text.compare(submission1.email, submission2.email);
    };
  };

  type Signup = {
    name : Text;
    email : Text;
  };

  module Signup {
    public func compareByEmail(signup1 : Signup, signup2 : Signup) : { #less; #equal; #greater } {
      Text.compare(signup1.email, signup2.email);
    };
  };

  // =========================
  // == Persistent Storage ===
  // =========================

  let signups = Map.empty<Text, Signup>();
  let contactSubmissions = Map.empty<Text, ContactSubmission>();

  // =========================
  // ======= Features ========
  // =========================

  // Signup
  public shared ({ caller }) func submitSignup(name : Text, email : Text) : async () {
    if (signups.containsKey(email)) {
      Runtime.trap("This email is already signed up.");
    };
    signups.add(email, { name; email });
  };

  // Contact Form
  public shared ({ caller }) func submitContactForm(name : Text, email : Text, message : Text) : async () {
    contactSubmissions.add(email, { name; email; message });
  };

  // Stats
  public query ({ caller }) func getSignupCount() : async Nat {
    signups.size();
  };

  // Get all signups sorted by email (for example purposes)
  public query ({ caller }) func getAllSignups() : async [Signup] {
    signups.values().toArray().sort(Signup.compareByEmail);
  };
};
