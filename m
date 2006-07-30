From: fred dusin <fdusin@yahoo.com>
Subject: routing, source-address rewriting
Date: Sun, 30 Jul 2006 04:14:58 -0700 (PDT)
Message-ID: <20060730111458.99932.qmail@web57106.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi!

let's say i have 2 pcs connected to the internet. each one has a public
ip address from a totally different subnet.

pc1 should now accept connections on port 80 and forward them to pc2.
pc2 has a webserver running, processes the request and should then
reply DIRECTLY to the client, so bypassing pc1. speaking of packets,
pc1 should get the packets from the client, forward them to pc2. pc2
processes the request and sends the answer packets directly to the
client (and not over pc1).

i though doing this using iptables should be quite easy:
1. forward all packets arriving at pc1 on port 80 to pc2. (does works!)
2. change the source-address of the outgoing packets from pc2 to the ip
of pc1 so the clients see the packets comming from pc1 while in realtiy
they come from pc2. (does not work!)

when i change the source-adress of the packets on pc1 to the ip of pc1, 
everything works fine. but this way the packets are going out to the 
client over pc1 but i want them to go the client directly.

i'm really looking forward to any suggestions. may be doing it by some
tunnel or what ever is much better than trying to do this with
iptables?

fred

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

