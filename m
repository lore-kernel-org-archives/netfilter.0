From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Packets that should have been DNATted appearing in INPUT table
Date: Wed, 5 Jan 2005 19:00:40 +0100
Message-ID: <000901c4f350$7b3d1370$4206a8c0@loki>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi everybody,

first of all, please cc me in your answer as I am not a subscriber of this 
list.
I have a problem in understanding how the packet flow really works, as my 
setup is not completely working as expected.
I want to redirect all traffic coming from the internet to (for example) 
port 4664 to the same port on a box in my LAN and I use the following rule 
to accomplish this:
iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 4664 -j DNAT --to 
192.168.6.10
From what I read, I thought that with this rule packets go to PREROUTING, 
get their new destination and then through FORWARD and POSTROUTING right to 
eth0 and out to my LAN.
The only thing I have in my POSTROUTING is
iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.6.0/24 -j MASQUERADE
What I find really weird is that the packet counter of
iptables -A INPUT -i ppp0 -p tcp --dport 4664 -j DROP
is not zero, in fact the value is growing and about 10% of the number of 
packets successfully redirected to the other box in my LAN.
An example of a packet which should have been redirected but was logged in 
the INPUT chain is
IN=ppp0 OUT= MAC= SRC=217.30.133.213 DST=217.225.50.178 LEN=40 TOS=0x00 
PREC=0x00 TTL=120 ID=5272 DF PROTO=TCP SPT=2214 DPT=4664 WINDOW=10094 
RES=0x00 ACK FIN URGP=0
DST correctly shows my internet IP, but I thought that it should have been 
replaced with 192.168.6.10 in PREROUTING...
Now my questions are: Is there something I misunderstood with packet flow? 
Or should it be OK in theory and I screwed something up during 
implementation?
And finally: How do I get it to work in a way, that really every single 
packet coming in for a specific port on a specific interface is redirected 
to another host?

Thank you very much,

Marius 


