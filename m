From: busby@edoceo.com
Subject: RE: --policy DROP kills everything?
Date: Thu, 9 Jun 2005 04:54:31 -0700 (PDT)
Message-ID: <23591.65.121.191.30.1118318071.squirrel@lithium.edoceo.com>
References: <B80488675062364A909EE60F4A666038078EEA9E@usilms23.ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B80488675062364A909EE60F4A666038078EEA9E@usilms23.ca.com>
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

My OUTPUT and FORWARD tables have policy ACCEPT and no rules.
It's only INPUT that is causing headache.  In my current state (below) an
established connection is OK (like ssh in then start) but after adding
these rule no new connection can be made.

Config:
>
> imperium root # iptables -L INPUT -n
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  127.0.0.0/8          0.0.0.0/0
> ACCEPT     udp  --  192.168.42.1         192.168.42.2        udp spt:53
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:80
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED
> LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags =
0
level 4
>




