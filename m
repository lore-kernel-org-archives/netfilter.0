From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: problem reach the internal.
Date: Sat, 30 Nov 2002 10:27:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211301027.23099.netfilter@newkirk.us>
References: <20021130083402.3274.qmail@web14506.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021130083402.3274.qmail@web14506.mail.yahoo.com>
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
To: "james.Q.L" <shijialeeee@yahoo.ca>
Cc: netfilter@lists.netfilter.org

On Saturday 30 November 2002 03:34 am, james.Q.L wrote:
> the iptables counter is very neat to debug problem. i never thought of
> that.
>
> found a problem that in the following ruleset i shouldn't have '-i eth1=
'.
> it blocks the internal DNAT.
>
> > > iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 8888 \
> > > =09-j DNAT --to-destination 192.168.0.3:80
>
> i also change the order of the rule in FORWARD chain in Filter table.
>
> the rule for filter table is:
> [root@cozy166 Qiang]#iptables -L -n --line-numbers
>
> Chain FORWARD (policy DROP)
> num  target     prot opt source               destination
> 1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
> RELATED,ESTABLISHED 2    ACCEPT     tcp  --  0.0.0.0/0          =20
> 192.168.0.3        tcp dpt:80 3    ACCEPT     all  --  0.0.0.0/0       =
   =20
> 0.0.0.0/0
> 4    LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG fl=
ags
> 0 level 4
>
> the line num 3 and num 2 are swapped.
>
> i tried reset the counter of ruleset and make connection test to it. i
> found something that i don't understand. when i am testing from an inte=
rnal
> machine to INET_IP:8888 the ruleset for filter table is (counter has re=
set
> to zero)
>
> [root@cozy166 Qiang]#iptables -L -v -n --line-numbers
>
> Chain FORWARD (policy DROP 5 packets, 224 bytes)
> num   pkts bytes target     prot opt in     out     source       destin=
ation=20
> 1    11806   15M ACCEPT     all  --  eth1   eth0    0.0.0.0/0 =20
>          0.0.0.0/0          state RELATED,ESTABLISHED
> 2        3   144 ACCEPT     tcp  --  *      *       0.0.0.0/0          =
=20
> =09192.168.0.3        tcp dpt:80
> 3     8000  341K ACCEPT     all  --  eth0   eth1    0.0.0.0/0          =
=20
> =090.0.0.0/0=20
> 4        5   224 LOG        all  --  *      *       0.0.0.0/0   =20
>        0.0.0.0/0          LOG flags 0 level 4
>
> Chain OUTPUT (policy ACCEPT 13143 packets, 996K bytes)
> num   pkts bytes target     prot opt in     out     source             =
=20
> destination
>
> Chain drop-and-log-it (0 references)
> num   pkts bytes target     prot opt in     out     source             =
=20
> destination=20
> 1        0     0 DROP       all  --  *      *       0.0.0.0/0 =20
>          0.0.0.0/0
>
> ####
> noticed that the Forward chain has (policy DROP 5 packets, 224 bytes) a=
nd
> the line num 2 has 3 counter and 144bytes hits. it's gotta be a problem
> here.

Well, what were those 5 packets?  They were logged by line 4.  You can ad=
d
--log-prefix "IPT:forward drop:" to the rule, and then use:
tail -n 100 /var/log/messages | grep IPT:for=20
later to list them.  (or any other useful prefix for the log lines)

> one thing i am unsure is if the counter and packet get hit means the pa=
cket
> get passed or attempted to pass?  taking a look at the line num 2 rules=
et,
> it shouldn't block proper packet tho.=20
> 2    ACCEPT     tcp  --  0.0.0.0/0   192.168.0.3        tcp dpt:80

The counter in the first listing indicates that three packets matched thi=
s=20
rule, and were accepted.

> another thing i'm unsure is the POSTROUTING and PREROUTING both have tw=
o
> hits and packet records. so this seems to say the packet got back from =
the
> webserver. but if the FORWARD chain drops the packet there, the POSTROU=
TING
> shouldn't have anything..
>
> [root@cozy166 Qiang]#iptables -L -v -n -t nat --line-numbers
> Chain PREROUTING (policy ACCEPT 146 packets, 10341 bytes)
> num   pkts bytes target     prot opt in     out     source             =
=20
> destination=20
> 1        4   192 DNAT       tcp  --  *      *       0.0.0.0/0 =20
>          65.48.28.33        tcp dpt:8888 to:192.168.0.3:80
>
> Chain POSTROUTING (policy ACCEPT 1 packets, 249 bytes)
> num   pkts bytes target     prot opt in     out     source             =
=20
> destination=20
> 1        4   192 SNAT       tcp  --  *      *    192.168.0.0/24      =20
> =09192.168.0.3        tcp dpt:80 to:192.168.0.1

This tells us that 4 packets, total 192 bytes, matched this rule in=20
POSTROUTING.  4 packets from somewhere on the LAN, going to the server.  =
The=20
rule above this shows 4 packets, total 192 bytes, matching the rule in=20
PREROUTING that performs the DNAT.

Unfortunately this doesn't tell us anything about return packets.  The on=
ly=20
places those would be matched (at least with the listed rules) are in the=
 PRE=20
and POST policies, and in the ESTABLISHED rule in FORWARD.  However,=20
PREROUTING policy accepted 146 packets, POSTROUTING policy only 1, and th=
e=20
listed rules match 4 and 4, so the remaining 145 packets are unaccounted =
for=20
in the data here.

> 2       51  2866 MASQUERADE  all  --  *      eth1    0.0.0.0/0         =
 =20
> 0.0.0.0/0
>
> Chain OUTPUT (policy ACCEPT 79573 packets, 5705K bytes)
> num   pkts bytes target     prot opt in     out     source             =
=20
> destination

j


