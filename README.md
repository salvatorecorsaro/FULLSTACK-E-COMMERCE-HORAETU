![](https://i.ibb.co/dLcJkcX/Artboard-1-4x.png)
# FULLSTACK-E-COMMERCE-HORAETU

![image](https://user-images.githubusercontent.com/55556636/111149851-b0eae880-858d-11eb-97fa-14f072a1d263.png)

In this project I aimed to develop an ecommerce webapp.
Horaetu is a brand I created for this project it comes from the greek concept of HORAE (seasons) and tu (you), the brand offer products to help you along the different stages of everyone life.
The idea of HORAETU the logo and all the products you will see are originally created for this project.

![](https://i.ibb.co/jZFCNYF/horaetu2.png)

All services deployed on heroku, sql are dockerized on a linode server as well as the chatbot microservice dockerized on linode, you can enjoy the result by visiting the angular front hosted at http://horaetu.herokuapp.com/

The services are hosted on heroku and with the plan Iḿ currently using they may go sleep if not being requested for 30+ minutes. so the first call may be slow to respond but after that it will go up and react as designed.

Being hosted with a free plan in the future you may experience some problem in using the app. 
For this reason I will give you instruction to deploy the app locally and test it.

Final Project IRONHACK - HORAETU shop online


https://github.com/salvatorecorsaro/eureka-HORAE

https://github.com/salvatorecorsaro/catalogue-HORAE

https://github.com/salvatorecorsaro/geo-HORAE

https://github.com/salvatorecorsaro/shop-HORAE

https://github.com/salvatorecorsaro/chatbot-HORAE

https://github.com/salvatorecorsaro/front_HORAETU

https://github.com/salvatorecorsaro/gateway-HORAE

There are a total of 11 services used by the app.

(![image](https://user-images.githubusercontent.com/55556636/111147577-ee01ab80-858a-11eb-94d5-c18c6df430ca.png)

A few images of the webapp deployed

![](https://i.ibb.co/VWqwXF0/checkoouthoraes.png)

![](https://i.ibb.co/1MLx9XJ/checkouthorae.png)


I thought about developing a microservice structure dockerized in order to ensure encapsulation and agile development.


![](https://i.ibb.co/JHRnmLS/aihoraetu.png)

A chatbot was developed using python, tensorflow and flask trained using Machine Learning (Deeplearning) and a custom dataset collected by me.
I containerized custom dockers for the mySQL databases.

![](https://i.ibb.co/bQXjWmM/loginhorae.png)

Security is managed by OKTA service to assure a solid system. (I custom crafted security in my previous projects).


##Instructions for local deploy:

For a fast test local it's possible to just mount the front service by downloading the angular project and make it run locally on port 4200. ( command: ng serve)
this way it will automatically connect to the database and the other services on the cloud.








