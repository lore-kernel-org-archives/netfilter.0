From: pkumar@students.iiit.net
Subject: Forward packets from one interface to other interface
Date: Fri, 7 Jan 2005 19:33:15 +0530 (IST)
Message-ID: <56510.192.168.36.204.1105106595.squirrel@192.168.36.204>
References: <200501061753.j06Hqxlb024586@students.iiit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501061753.j06Hqxlb024586@students.iiit.net>
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


Hello,
     I want some help from the users of this group.

I have network setup as follows

                 172.17.0.0                       static ip2
                (Intranet 1) <-->(Linux Box 2)<-->Internet 2
               /                 (proxy server)
Internet1-->Switch ---> Linux Box 1)
static ip1     \       (proxy server)
                \
                 (Intranet 2)
                 172.18.0.0


(Note:(Linux Box 1) is setup only for the users for (Intranet 2) so that
they can access the net faster and also have VPN facility from outside
world).


Intranet1 is the one using Internet through (Linux Box 2).
Intranet2 is the one using Internet through (Linux Box 1).

Now Intranet2 people has to access the Intranet1 through (Linux Box 1) and
access Internet1.

i.e Linux Box 1 has 3 interfaces
 eth0 - Internet1 ( Static Ip) Eg. 220.56.245.4
 eth1 - Intranet2 172.18.0.1/255.255.0.0
 eth2 - Intranet1 172.17.0.10/255.255.0.0

Now I am able to access the both Intranets 1&2, Internet from (Linux Box 1).

Also from (Intranet 2)I am able to connect to Internet1 through (Linux Box1)

Problem :

    I have to access the systems from (Intranet 2) to (Intranet 1).


What rules I should specify in the Linux Box so that I can access the
Intranet1 from Intranet2?

i.e From a user Ip (eg. 172.18.0.3/255.255.0.0 gw 172.18.0.1) I should
access a system (eg. 172.17.3.8/255.255.0.0) and so on.


I specified the rule below in the Linux Box1

iptables -A FORWARD -i eth1 -d 172.17.0.0/255.255.0.0 -o eth2 -j ACCEPT

to access the Intranet1 from Intranet1.

But it's not working.

Can anyone suggest me how to solve this problem so that I can access
systems in Intranet1 from Intranet2 using Linux Box1.

Hoping for a solution

Thanks In advance
Phani Kumar
IIIT-Hyd










