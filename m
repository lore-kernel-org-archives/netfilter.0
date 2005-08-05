From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Help needed for a box with 4 Ethernet Interfaces
Date: Fri, 05 Aug 2005 00:48:03 -0500
Message-ID: <42F2FD93.1080504@riverviewtech.net>
References: <20050804161142.23403.qmail@web30115.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050804161142.23403.qmail@web30115.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

                                                                         =
------------
                                            -----------------------------=
|  Box D   |
                              172.16.6.10   |                            =
|          |
         Mgmt Port<---------------------|   |                            =
------------
                                        |   | 192.168.0.1                =
 192.168.0.2
                                   Eth0 |   | Eth1 (for internal network)=

 ------------                        ------------                        =
  ------------
 |  Box A   |10.1.1.1--------10.1.1.2|  Box B   |21.21.21.2 -----21.21.21=
=2E1|  Box C   |
 |          |Eth1                Eth2|          | Eth3                 Et=
h1|          |
 ------------     10.1.1.0/24        ------------       21.21.21.9/24    =
  ------------
  192.168.0.1(eth0)                   192.168.0.3                        =
  192.168.0.2 (eth0)

Box A
-----
eth0:  192.168.0.1
eth1:  10.1.1.1

Box B
-----
eth0:  172.16.6.10
eth1:  192.168.0.1/24
eth2:  10.1.1.0/24
eth3:  21.21.21.9/24

Box C
-----
eth0:  192.168.0.2
eth1:  21.21.21.21

Box D
-----
eth0:  192.168.0.2

Here is what I want to do:
Packets from Eth2 should only go to Eth3 except the ones detined to Eth0'=
s IP.
Packets from Eth3 should only go to Eth2 except the ones detined to Eth0'=
s IP.
Local packets destined for Eth1's ip and its subnet should be forwarded v=
ia Eth1 only.
Packets from Eth1 can only be directed to Eth0.

I'm not quite sure why you are wanting to do this, but my job is not to q=
uestion why (for now).  I think that you really need some advanced routin=
g.  You will need to create a new routing table be it by name or number. =
 I would recommend that you create a table and add it to "/etc/iproute2/r=
t_tables", this way you can reference it by name verses the routing table=
 number.  Once you have created your new routing table you will then need=
 to populate it and the default table in a special way.

(It has been too long of a day for me to come up with exact ip route / ip=
 rule commands for you to use so I will give you the just of what I would=
 do.)

Before we start on the routing table for Box B let's set up the routing t=
ables on boxen A and C.  On both Box A and Box C you will need to configu=
re the netmask for eth0(s) to be 255.255.255.255 so that the routing code=
 will know that the respective IPs are the only ones on the interface.  Y=
ou will also want to set their default gateway to be the IP that Box B ha=
s on the network that they are connected to.  This will cause Box A and B=
ox C to send any traffic destined to 192.168.0.x/24 other than 192.168.0.=
1 and 192.168.0.2 (respectively) to their default gateway.

Add entries to the routing table for eth2 and eth3 that would show that y=
ou can get to 10.1.1.0/24 network via eth2, 21.21.21.0/24 network via eth=
3, 172.16.6.0/24 network via eth0 as well as 192.168.0.1/32 host via 10.1=
=2E1.1 on the 10.1.1.0/24 network and 192.168.0.2/32 host via 21.21.21.1 =
on the 21.21.21.0/24 network.  Add entries to the main routing table that=
 would show that you can get to 172.16.6.0/24 network via eth0 and 192.16=
8.0.0/24 network via eth1.  Once you have created these routing tables yo=
u will have to add ip rules that tell the kernel that any traffic coming =
in from eth2 or eth3 to use the routing table for eth2 and eth3.  This is=
 where I run in to the problem.  I do knot know of a way to have packets =
from eth0 on Box B destined for 192.168.0.0/24 network know which routing=
 table that they are suppose to use as both routing tables will have a ro=
ute for the 192.168.0.0/24 network and it is impossible to know which net=
work the traffic is destined for via routing alone.  The best that I can =
think of is to use IPTables to MARK traffic that is either entering or le=
aving eth1 or other wise associated with the LAN on eth1 with a value and=
 not marking the traffic that is associated with the LANs on eth2 and eth=
3.  I personally think it would be easier to MARK the traffic associated =
with the LAN on eth1 as it is the single odd man out and thus you would h=
ave to mess with marking on fewer interfaces.  With this NetFilter MARK v=
alue you can set a Connection Mark value and then have IPTables migrate t=
he associated MARK value to traffic that is coming in eth0 and then set u=
p an ip rule based on the existence of the fwmark in the packet.  I perso=
nally have tried to avoid MARK as I have seen little use for it in the pa=
st.  However I think this situation does warrant such a use.  Seeing as h=
ow I tend to not use MARK I am not qualified to help you any more with it=
=2E

Ok, my mind is about to shut down so I'm going to go to bed.  Give this a=
 good read and see if you agree with my logic.  If you have any more ques=
tions I'll try to answer them when I'm more awake.



Grant. . . .



