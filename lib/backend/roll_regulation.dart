
class Roll{
  bool? superUser;

  Roll(bool isSuperUser){
    this.superUser = isSuperUser;
  }

  isSuperUser(){
    return superUser;
  }
}

class User{
  Roll? roll;

  User(Roll roll){
    this.roll = roll;
  }

  getRoll(){
    return roll;
  }
}

class RollManager{
  bool? hasSuperUserPermissions;

  RollManager(){
    // hier soll es geprüft werden, welche Rechte hat der Benutzer.
    Roll superUserRoll = new Roll(true);
    User user = new User(superUserRoll);

    hasSuperUserPermissions = user.getRoll().isSuperUser();
  }

  getPermissionToSuperUser(){
    return hasSuperUserPermissions;
  }


}