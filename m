From: "John G. Norman" <john.g.norman@gmail.com>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 2 May 2005 16:55:00 -0400
Message-ID: <df31c40405050213556ddc65b2@mail.gmail.com>
References: <df31c4040505021142197fdcdc@mail.gmail.com>
	<427682BC.6000303@riverviewtech.net>
Reply-To: john@7fff.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427682BC.6000303@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Thanks again for the feedback.

You're right; here's some more detail. To make this even easier, I
have turned off what was on port 8080, and have started Apache on port
80, and now I'll attempt to redirect from port 8080 to port 80
(reverse of what I was trying earlier). First I'll flush the tables,
then I'll add my rule, then I'll do a request (I'll use wget, but it's
the same with a browser, etc.) on port 80, and then on port 8080; and
then I'll show the traffic through the chains.

0 packets through the rule on the "nat" table. I just don't get it.

Here's a transcript:

[root@preview ~]# /sbin/iptables -t filter -F
[root@preview ~]# /sbin/iptables -t mangle -F
[root@preview ~]# /sbin/iptables -t nat -F
[root@preview ~]# cat /proc/sys/net/ipv4/ip_forward
1
[root@preview ~]# /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dpor=
t 80
80 -j REDIRECT --to-port 80
[root@preview ~]# wget http://localhost >/dev/null
--16:56:06--  http://localhost/
           =3D> `index.html'
Resolving localhost... 127.0.0.1
Connecting to localhost[127.0.0.1]:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 35 [text/html]

100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>] 35            --.--K/s

16:56:06 (341.80 KB/s) - `index.html' saved [35/35]

[root@preview ~]# wget http://localhost:8080 >/dev/null
--16:56:10--  http://localhost:8080/
           =3D> `index.html.1'
Resolving localhost... 127.0.0.1
Connecting to localhost[127.0.0.1]:8080... failed: Connection refused.
[root@preview ~]# /sbin/iptables -L -n -v
Chain INPUT (policy ACCEPT 48367 packets, 43M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion


Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion


Chain OUTPUT (policy ACCEPT 28546 packets, 2657K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion

[root@preview ~]# /sbin/iptables -t nat -L -n -v
Chain PREROUTING (policy ACCEPT 35 packets, 3732 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion

    0     0 REDIRECT   tcp  --  eth0   *       0.0.0.0/0            0.0.0.0=
/0
        tcp dpt:8080 redir ports 80

Chain POSTROUTING (policy ACCEPT 367 packets, 16375 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion


Chain OUTPUT (policy ACCEPT 367 packets, 16375 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion

[root@preview ~]#



On 5/2/05, Taylor, Grant <gtaylor@riverviewtech.net> wrote:
> > /proc/sys/net/ipv4/ip_forward shows: 1
>=20
> ...
>=20
> > Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> >  pkts bytes target     prot opt in     out     source               des=
tination
>=20
> I'm not trying to doubt you but either you took the info from iptables be=
fore any traffic has passed through the forward chain or there is a problem=
 that is preventing traffic from traversing the forward chain.  You did say=
 that you set ip_forward to 1 which should allow traffic to be forwarded.  =
Do an iptables -L -n -v to see if any traffic passing through your forward =
chain.
>=20
>=20
> Grant. . . .
>=20
>

