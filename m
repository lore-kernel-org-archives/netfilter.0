From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: what's the problem of DNAT
Date: Mon, 31 Oct 2005 16:26:59 +0800
Message-ID: <43a0cdcb0510310026t66d553f2v@mail.gmail.com>
References: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com>
	<Pine.LNX.4.61.0510310758150.11251@filer.marasystems.com>
	<43a0cdcb0510302358y10f854ffg@mail.gmail.com>
	<54583.193.173.147.3.1130746205.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <54583.193.173.147.3.1130746205.squirrel@webmail.sterenborg.info>
Content-Disposition: inline
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

> Has anything changed in the FORWARD chain ? You need to allow it there.
>
follows are FORWARD chain. I think I DROP nothing except in the list.
I HAVE modified the policy of FORWARD chain to ACCEPT. that's why i'm
puzzled.
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            0.0.0.0/0           ipp2p
v0.8.0_rc3 --ipp2p
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED
ACCEPT     tcp  --  192.168.20.90        192.168.8.66        tcp dpts:137:4=
45
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:445
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpts:137:1=
39
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:5554
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpts:1433:=
1444
DROP       all  --  0.0.0.0/0            202.101.43.60
DROP       all  --  0.0.0.0/0            202.101.43.67
DROP       all  --  0.0.0.0/0            202.101.43.57

And there is another Interest thing (I'm pained with the "interesting thing=
")
where I use 'sbin/iptables -t nat -A PREROUTING -d Inet2 -p tcp
--dport 8087 -j DNAT --to 192.168.16.100:8087' rule, I can access
http://Inet2:8087 in the LAN, but I can't access http://Inet2:8087
through Internet(I have a machine direct access to internet)

when turn to use 'sbin/iptables -t nat -A PREROUTING -d Inet2 -p tcp
--dport 80 -j DNAT --to 192.168.16.100:8087' then I can access
http://Inet2:80 in the LAN, and both can access http://Inet2:80 in
Internet... that's the thing i had meet

