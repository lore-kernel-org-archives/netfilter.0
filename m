From: Michel Briand <michelbriand@free.fr>
Subject: Netfilter NAT & Quake
Date: Tue, 15 Oct 2002 09:40:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <751.51778660274$1034812614@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I have Linux for many years and, since 10 month I play Quake III on 
Internet with my little linux box ;-)

Since I brought an HUB I connected my second PC and more to my local 
network.

I use kernel 2.4.19 and SuSE distro with their SuSEfirewall2 that give 
me some good functionnalities to achieve theses tasks :

- NAT for my LAN to the Internet
- protection of all non specified ports (tcp&udp)
- open thoses ports that I've chosen (ssh&https)

I have the following problem :

-- when we are 2 playing all run fine but when we are 3 the kernel spend 
more time in kernel space to deliver packets and Quake lags. A kernel 
hacker (a friend of mine) tell me that the kernel have to work a lot 
with all theses packets that Quake sends&receives .... and it would be a 
race problem in the NAT & filtering code.
When there is only 2 connections to Quake servers actives all run fine 
== the lag is not  perceptible ...

-- when a box of my LAN connects, my host (the router) could not connect 
to Quake III server anymore ... When the connection is in the inverse 
order (my host = route, another box of my LAN) all connect fine.

-- when I decide to run eDonkey from my M$ box, it complains about the 
port 4662 that I've specified in firewall to be open .... and it's not ????

That's all folks !
Thank you in advance ;)

Michel


