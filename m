From: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Subject: isp like shaping with tc
Date: Tue, 18 Nov 2008 16:29:45 +0200
Message-ID: <4922D159.10608@krediidiinfo.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

First of all. The lartc list seams to be dead, so I'm writing here. If
this is not the list for queue disciplines' discussion, please point me
in the right direction.


I run a campus network with a bit less than thousand users (more to come 
shortly). It's
subdivided into 19 /24 networks at the moment. Trying to provide
Internet access using a 100Mbit/100Mbit connection and a Core2 Duo
server running Fedora 9 (Fedora, 'cause it always has new kernels).

Right now, I have a parent for all tcp traffic and one parent for all
other traffic.

Each parent has 19 children (one for each subnet), which each have sfq
attached. sqf is hashing based on the subnets IP addresses.

I'm doing this for upload and download on egress.

Sample:

tc class add dev eth2 parent 2:1 classid 2:10 htb rate 41Mbit ceil
75Mbit prio 4 burst 1000kbit cburst 2000kbit quantum 1500

   tc class add dev eth2 parent 2:10 classid 2:100 htb rate 2Mbit ceil
8Mbit prio 4 burst 100kbit cburst 200kbit
   tc qdisc add dev eth2 parent 2:100 handle 100: sfq perturb 10
   tc filter add dev eth2 parent 100: protocol ip handle 1 prio 12 flow
hash keys nfct-dst divisor 256

   tc class add dev eth2 parent 2:10 classid 2:101 htb rate 2Mbit ceil
8Mbit prio 4 burst 100kbit cburst 200kbit
   tc qdisc add dev eth2 parent 2:101 handle 101: sfq perturb 10
   tc filter add dev eth2 parent 101: protocol ip handle 1 prio 12 flow
hash keys nfct-dst divisor 256

My main problem is packet loss, this is I because I can't limit each 
user but only a group (/24). At least that's how I understand it.

However if I were able to limit each IP to RATE 256kbit and CEIL 2Mbit 
for example. I then could achieve a state where p2p users who have not 
configured their clients to limit upload/download speeds would not 
congest the connection of the majority of users who want to use msn, www 
and play wow and stuff. Basically I want to do what an ISP does.

As the connection is not taxed separately on the campus bill, I'm free 
to play with speed limits in the name of the best solution for everyone.

The current solution where I have 19 groups does not scale to 19*256 groups.

As for shaping p2p traffic, I did do that using ipp2p for a while and 
even looked into level7, but to be honest, these methods are less 
effective by the day as more clients use encrypted p2p. And as for the 
legal stuff, everyone is responsible for their own actions and there are 
plenty of legal uses for p2p too. Being a censor and limiting based on 
blacklist filters is a big overhead and not very effective. It's just 
not worth it. YMMV.

I like the idea of giving a user limited bandwidth options and letting 
him decide, how he wants to use it.


What solutions exist for linux to make linux into a ISP like bandwidth 
limiting router?

Regards,

-- 

Aleksander Kamenik
System Administrator
Krediidiinfo AS
an Experian Company
Phone: +372 665 9649
Email: aleksander@krediidiinfo.ee

http://www.krediidiinfo.ee/
http://www.experiangroup.com/

