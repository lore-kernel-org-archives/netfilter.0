From: "Han, Yan" <hany@u.library.arizona.edu>
Subject: RE: Help! NAT unable to routing
Date: Fri, 31 Oct 2003 11:59:25 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BEA73FB6B8F62545A5B2818724D0DF2902E70848@u.library.Arizona.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?=27J=F6rg_Sch=FCtter=27?= <netfilter@schuetter.org>, netfilter@lists.netfilter.org


> # what is wrong ??
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 150.135.44.245 =
--dport 80
-j
> DNAT --to 150.135.45.96

>> what does "iptables -t nat -L -n -v" show? Is the counter (first =
column)
increased every time you try to connect your webserver?

Yes! It does. The "pkts" increases once I try to connect the address
150.135.44.245. I think it is correct that destination "150.135.44.245
tcp dpt:80  to:150.135.45.96". Any idea?

-------------------------------
Chain PREROUTING (policy ACCEPT 512K packets, 78M bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    3   144 DNAT       tcp  --  eth0   *       0.0.0.0/0
150.135.44.245     tcp dpt:80 to:150.135.45.96=20

Chain POSTROUTING (policy ACCEPT 46739 packets, 2972K bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain OUTPUT (policy ACCEPT 46752 packets, 2973K bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

>> What does "cat /proc/sys/net/ipv4/ip_forward" show?
1
(so the ipv4-forward is opened).




  J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


