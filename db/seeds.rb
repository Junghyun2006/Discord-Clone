require 'open-uri'

User.delete_all
Server.delete_all
Subscription.delete_all
Channel.delete_all
Message.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('servers')
ActiveRecord::Base.connection.reset_pk_sequence!('subscriptions')
ActiveRecord::Base.connection.reset_pk_sequence!('channels')
ActiveRecord::Base.connection.reset_pk_sequence!('messages')

demo = User.create!(
    username: 'Demouser',
    password: 'password',
    email: 'demo@gmail.com',
    tag: '0000',
    dob: '2009-09-16'
)

file = open('https://app-amica-seeds.s3.amazonaws.com/demouser_avatar.jpg')
demo.avatar.attach(io: file, filename: 'demouser_avatar.jpg')

user_2 = User.create!(
    username: 'testuser1',
    password: 'password',
    email: 'testuser1@gmail.com',
    tag: '0001',
    dob: '2003-09-15'
)

user_3 = User.create!(
    username: 'testuser2',
    password: 'password',
    email: 'testuser2@gmail.com',
    tag: '0002',
    dob: '1994-04-03'
)

server_1 = Server.create!(
    name: 'Red Car Fans',
    host_id: 1
)

file1 = open('https://app-amica-seeds.s3.amazonaws.com/red_car.jpg')
server_1.photo.attach(io: file1, filename: 'red_car.jpg')

server_2 = Server.create!(
    name: 'White Car Fans',
    host_id: 2
)

file2 = open('https://app-amica-seeds.s3.amazonaws.com/white_car.jpeg')
server_2.photo.attach(io: file2, filename: 'white_car.jpeg')

server_3 = Server.create!(
    name: 'Yellow Car Fans',
    host_id: 3
)

file3 = open('https://app-amica-seeds.s3.amazonaws.com/yellow_car.jpg')
server_3.photo.attach(io: file3, filename: 'yellow_car.jpg')

server_4 = Server.create!(
    name: 'Epic Seven',
    host_id: 1
)

file4 = open('https://app-amica-seeds.s3.amazonaws.com/cdomimg.png')
server_4.photo.attach(io: file4, filename: 'cdomimg.png')

server_5 = Server.create!(
    name: 'App Academy',
    host_id: 1
)

file5 = open('https://app-amica-seeds.s3.amazonaws.com/AAcademyimg.png')
server_5.photo.attach(io: file5, filename: 'AAcademyimg.png')

server_6 = Server.create!(
    name: 'Lost in Potato',
    host_id: 1
)

file6 = open('https://app-amica-seeds.s3.amazonaws.com/potatoimg.png')
server_6.photo.attach(io: file6, filename: 'potatoimg.png')

subscription_1 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '1',
    user_id: 1
)

subscription_2 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '2',
    user_id: 1
)

subscription_3 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '3',
    user_id: 1
)

subscription_4 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '4',
    user_id: 1
)

subscription_5 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '4',
    user_id: 2
)

subscription_6 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '1',
    user_id: 3
)

subscription_7 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '5',
    user_id: 1
)

subscription_8 = Subscription.create!(
    subscribeable_type: 'Server',
    subscribeable_id: '6',
    user_id: 1
)

channel_1 = Channel.create!(
    name: 'general-chat',
    server_id: 1
)

channel_2 = Channel.create!(
    name: 'vacation-planning',
    server_id: 1
)
channel_3 = Channel.create!(
    name: 'study-help',
    server_id: 1
)
channel_4 = Channel.create!(
    name: 'game-chat',
    server_id: 1
)
channel_5 = Channel.create!(
    name: '-random',
    server_id: 1
)

channel_6 = Channel.create!(
    name: 'vacation-planning',
    server_id: 2
)
channel_7 = Channel.create!(
    name: 'study-help',
    server_id: 2
)
channel_8 = Channel.create!(
    name: 'game-chat',
    server_id: 2
)
channel_9 = Channel.create!(
    name: '-random',
    server_id: 3
)

channel_10 = Channel.create!(
    name: 'general-chat',
    server_id: 2
)

channel_11 = Channel.create!(
    name: 'general-chat',
    server_id: 3
)

channel_12 = Channel.create!(
    name: 'general-chat',
    server_id: 4
)

channel_13 = Channel.create!(
    name: 'general-chat',
    server_id: 5
)

channel_14 = Channel.create!(
    name: 'general-chat',
    server_id: 6
)

channel_15 = Channel.create!(
    name: 'guidance-grounds',
    server_id: 4
)

channel_16 = Channel.create!(
    name: 'grade-my-hero',
    server_id: 4
)

channel_17 = Channel.create!(
    name: 'fan-art-board',
    server_id: 4
)

channel_18 = Channel.create!(
    name: 'off-topic',
    server_id: 4
)

channel_19 = Channel.create!(
    name: 'coding',
    server_id: 5
)

channel_20 = Channel.create!(
    name: 'homework-spoilers',
    server_id: 5
)

channel_21 = Channel.create!(
    name: 'learning-resources',
    server_id: 5
)

channel_21 = Channel.create!(
    name: 'chit-chat',
    server_id: 6
)

channel_22 = Channel.create!(
    name: 'rules',
    server_id: 6
)

channel_23 = Channel.create!(
    name: 'emoji-list',
    server_id: 6
)

message_1 = Message.create!(
    messageable_type: 'Channel',
    messageable_id: '12',
    sender_id: '1',
    message_body: 'Epic Seven is so much fun!'
)

message_2 = Message.create!(
    messageable_type: 'Channel',
    messageable_id: '12',
    sender_id: '2',
    message_body: 'I know right, I shouldve downloaded it earlier.'
)

message_3 = Message.create!(
    messageable_type: 'Channel',
    messageable_id: '12',
    sender_id: '1',
    message_body: 'better now than later'
)

message_4 = Message.create!(
    messageable_type: 'Channel',
    messageable_id: '12',
    sender_id: '1',
    message_body: 'updates coming soon'
)

