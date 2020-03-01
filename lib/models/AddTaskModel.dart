
class AddTaskModel{
/*  final String tableTask = 'addtask';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnDescription = 'description';
  final String columnDate = 'date';*/



   String columnId;
   String columnTitle ;
   String columnDescription;
   String columnDate ;
   AddTaskModel(this.columnTitle,this.columnDescription,this.columnDate);
   Map<String, dynamic> toMap() {
     return {
       'title': columnTitle,
       'description': columnDescription,
       'date': columnDate,
     };
   }



}