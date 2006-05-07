From: "R. Rajasekaran" <rrajas@yahoo.com>
Subject: ICMP Redirect
Date: Sun, 7 May 2006 00:19:11 -0700 (PDT)
Message-ID: <20060507071911.55929.qmail@web35005.mail.mud.yahoo.com>
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


Kindly help me in understanding the observation of 
following experiment :-



 --------         --------
 |      |         |      |
 |  H1  |---------|  H2  |
 |      |         |      |
 --------         --------

H1 and H2 are two Linux host.

IP of H1   = 10.0.0.1
MAC of H1  = 00:00:00:00:00:01


IP of H2   = 10.0.0.2
MAC of H2  = 00:00:00:00:00:02

Now I did the following configurations.

1) In host H1
-------------
I added a static arp entry in the arp cache of the
host H1
as  arp -s 10.0.0.3 00:00:00:00:00:02.

(ie) the mac address for 10.0.0.3 as H2's mac address.


2) In host H2
-------------
Enabled IP forwarding.


Then from host H1, I made a ping 10.0.0.3.
Here I found that ICMP request from host H1 reaches
host H2,
and host H2 sends the following as ICMP redirect
messages.

From 10.0.0.2: icmp_seq=1 Redirect Host (New nexthop:
10.0.0.3)
From 10.0.0.2: icmp_seq=2 Redirect Host (New nexthop:
10.0.0.3)
From 10.0.0.2: icmp_seq=3 Redirect Host (New nexthop:
10.0.0.3)

The above behaviour is of Linux functionality.
Here the redirect uses the next-hop address as
10.0.0.3.  What is the reason of it ?
It seems confusing because the ping was send just to
that address.

- R. Rajasekaran.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

