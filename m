From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Conntracking on a multihomed server
Date: Fri, 24 Jun 2011 18:44:25 +0200
Message-ID: <4E04BEE9.5030603@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hi list,

I have a multihomed server with several local nets.

wan1: default route to internet. Fix IP.
wan2: alternate route to internet. Fix IP. (Mainly for SMTP/POP3 services.)
wan3: alternate route to internet. Dynamic IP. (Internet for our guests.)

lan1: local net for our organization unit 1.
lan2: local net for our organization unit 2.
lan3: guest net.

My POP3 server is in the lan1 net.
I have two SMTP servers. One located on the firewall, (mainly for 
checking the incomming e-mails from the wild.) and one on the POP3 server.
I can reach them from anywhere I want to.
So the routing, conntracking is working properly. (Even in the so called 
"triangle" scenario -> User and server is on the same net but user tries 
to reach the public IP.)

The guest net (lan3) is almost separated from the other lans. (They can 
reach the SMTP/POP3 servers on the public fix IPs, but no other local 
service available for them.)

My problem starts with an UDP connection that should work form everywhere.

So, I am running an UDP service ON the firewall. (It is not bound to any 
specific interface.)
If I am connecting from the internet (to any of the FIX IPs) then it works.
But if I try to connect for example from the guest lan then it is simply 
not working.

conntrack entries:

udp      17 28 src=<LOCAL-USER> dst=<FIX-IP1> sport=34150 
dport=<SERVICE> packets=17 bytes=1190 [UNREPLIED] src=<FIX-IP1> 
dst=<LOCAL-USER> sport=<SERVICE> dport=34150 packets=0 bytes=0 mark=0 
secmark=0 use=2
udp      17 28 src=<FIREWAL-LOCAL-IP> dst=<LOCAL-USER> sport=<SERVICE> 
dport=34150 packets=19 bytes=1478 [UNREPLIED] src=<LOCAL-USER> 
dst=<FIREWALL-LOCAL-IP> sport=34150 dport=<SERVICE> packets=0 bytes=0 
mark=10 secmark=0 use=2

As I see:
- The client initiates a connection to the firewall public IPs (in a 
round-robin manner).
- The service sees a connection that came from a lan. (Remember that is 
not bound to any interface.)
- The service reply with the corresponding local IP of the firewall.
- The client drops the packets because they are not from the expected 
public IPs.

How can I make it work?

- I don't want to bind the service to any interface.
- I tried conntracking/nat-ing but as you can see these are two 
different connections. (At least for the conntrack subsystem.)
- It is not an forwarded connection, it is a service on the firewall.

IMHO:
- If a service receives a connection then it should reply with the 
original destination IP as a source IP and not with the corresponding 
network IP. (If both local.)
- If the conntrack subsystem would think that those connections are the 
same then I could SNAT the packets. (Maybe would not need any SNAT at all.)

Is it a conntracking, routing or IP stack problem?

Any comments?

Thanx.

Swifty

