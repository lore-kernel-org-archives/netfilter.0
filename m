From: Saad Faruque <faruque@gmail.com>
Subject: netfitler against Trojans and worms
Date: Mon, 5 Jul 2004 19:59:03 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1d7da3f40407050659476384b7@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello List,
We are having a windows network (our clients network) with private ip
address with a linux gateway. The linux box is doing SNAT for all
(windows network) users, that means its forwarding all the users
request to the Internet. But the problem is the internal windows
network is effected by all different kind of worms and Trojans, which
are coursing a huge amount of unwanted upload/requests to Internet. 
remember these are the workstations we don't have total control over.
Securing these windows work stations is some thing which we cant very
easily do.
So we are currently protecting these stations with simple netfilter
rulez such as
iptables -A FORWARD -p tcp --dport 135 -j DROP
iptables -A FORWARD -p udp --dport 1025 -j DROP
.
.
.
.
iptables -A FORWARD -p tcp --dport 1214 -j DROP
iptables -A FORWARD -p udp --dport 3127:3198 -j DROP
which are some commonly used virus ports.
my question if there any such project or document  which lists all the
well known virus ports, virus detection signature which i can use with
string serch or from port and tcp flag.
i did find couple of sites ex.
(http://www.doshelp.com/trojanports.htm) which lists some ports. but i
really am not sure if u simply block all these ports if it will effect
my clients regular internet activity. any alternative suggestions are
also welcome :)

Regards,
Saad Faruque.

