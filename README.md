# ott_subscription_plsql_project
It is a small database project for ott subscription.

There are some steps while running the sql file
1.ott tables ottid is primary key ,which is a foreign key in ottsubs.
2.subs tables sid is primary key ,which is a foreign key in ottsubs.
3.ott and subs table

  ![1](https://github.com/subratdalai59/ott_subscription_plsql_project/assets/84226852/95021e6b-ea1a-4241-9aac-f23c6662ac57)

4.ottsubs table

  ![2](https://github.com/subratdalai59/ott_subscription_plsql_project/assets/84226852/c9c0f9bd-8f18-46c3-9809-cd0ec26aefa4)

5.if a sid is already taken a ottid then he cant take it again.
  example :- if one subscriber has already taken amazon prime then again he cant take amazon prime subscription.same follows for other subscriptions also;

 ![3](https://github.com/subratdalai59/ott_subscription_plsql_project/assets/84226852/0f1d4c23-3bf1-44f8-9163-3de24b9ed8b4)

6.while purchasing the subscription if any of these(sid,ottid) is wrong then it will through an error.which is mentioned in the sql file.

  ![4](https://github.com/subratdalai59/ott_subscription_plsql_project/assets/84226852/1cb3c951-1ee2-4721-b5cc-883aa45467bf)

7.if both sid and ottid is wrong it will also through an exception .at the last if amazon prime subscription has taken by already 4 subscriber ,so the fifth subscriber cant 
  take amazon prime ,because each subscription subscriber limit is 4 only .

  ![5](https://github.com/subratdalai59/ott_subscription_plsql_project/assets/84226852/65615e71-4bde-4fa6-aa2f-c8eead7d9d37)


