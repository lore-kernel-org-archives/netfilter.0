From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: how to harden iptables rules?
Date: Wed, 03 Mar 2010 17:20:01 +0100
Message-ID: <20100303172001.149912au9jha5s8g@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi.

I'm playing around with hardening my iptables setups at the institue  
and I'd have some questions on this.

First of all, the systems should have these default policies:
#drop incoming packets by default
:INPUT DROP [0:0]
#drop forwarded packets by default
:FORWARD DROP [0:0]
#accept outgoing packets by default
:OUTPUT ACCEPT [0:0]

So non of them is itself a "firewall" or a router.


What I always did until now was:
#basic rules
-A INPUT	--in-interface lo			-j ACCEPT
-A INPUT	-m state  --state ESTABLISHED,RELATED	-j ACCEPT
-A INPUT	--protocol icmp				-j ACCEPT

#rules for some services, e.g. allowing ssh, dns, etc.

#reject all other incomming packets
-A INPUT						-j REJECT  --reject-with icmp-port-unreachable
(I know that rejecting might be too friendly when I speak about  
hardening,.. but droping or tarpit gives the source no error  
information, which is at least a bad idea within the institute.)




1) Is there anything obvious that I should block in addition?


2) Regarding ICMP, I must admit that I'm not that IP geek to know  
which of ICMP I should block. I want however have ping allowed. I mean  
if I block it completely (except echo-request) I also dont't get any  
ICMP error messages, which is probably a bad thing, right?
btw: in sysctl I do this:
net.ipv4.conf.all.rp_filter=1
net.ipv4.tcp_syncookies=1
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0
net.ipv4.conf.all.log_martians = 1
net.ipv6.bindv6only = 1


3) What I never clearly understood: Do I have to handle (drop)  
"external packets" with:
-a source address of 127.x.x.x or :1
-a destination address of 127.x.x.x or :1
-a source address that matches one of the addresses of my other  
interfaces (e.g. 88.88.88.88 if that is the address of eth0)
-what about other bogus addresses like 0.0.0.0 or 255.255.255.255 or so?

Or does the kernel block such crap automatically? If so how?

And how would I block these things cleanly? Using addrtype? And how do  
I make sure that any "internal traffic" still comes through?


4) Should I generally drop packets with state=INVALID or perhaps not  
for packets from/to lo?


5) Is it necessary to do this or is it done automatically?
-p tcp ! --syn -m state   --state NEW	-j DROP
and (!) vice versa:
-p tcp   --syn -m state ! --state NEW	-j DROP


6) When I accept packets for dedicated services (e.g. ssh) I can do  
one of those:
a) -A INPUT	--destination 88.88.88.88 --protocol tcp -m tcp  
--destination-port ssh --syn	-j ACCEPT
(if 88.88.88.88 is the address of eth0)
b) -A INPUT	--in-interface eth0 --protocol tcp -m tcp  
--destination-port ssh --syn	-j ACCEPT
c)  -A INPUT	--protocol tcp -m tcp --destination-port ssh --syn	-j ACCEPT

(c) Is probably a bad idea as it would allow ssh also on other interfaces
But is there (from a security point of view) and advantage between (a)  
and (b)?



Lots of thanks,
Chris.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

