From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: (newbie) SNAT woes
Date: Fri, 8 Aug 2003 08:53:21 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C079@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Martin Djernaes <martin@djernaes.dk>, netfilter@lists.netfilter.org

What you've missed is that tcpdump and other utilities work on different =
layers and if I'm not wrong (hopefully not) it's seeing the packets =
before the SNAT.

Also, better to use MASQUERADE rather than SNAT for workstation access =
to the internet.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Martin Djernaes [mailto:martin@djernaes.dk]
Sent: Friday, August 08, 2003 12:15 AM
To: netfilter@lists.netfilter.org
Subject: (newbie) SNAT woes


Hi,

I realise that you have seen mails like mine lots of time before, but I
have spend hours reading howtos and googling for some hint as to why my
very simple setup doesn't work.

I have a simple box which just is suppose to do normal NATing of =
outgoing
traffic so it uses the public IP address.

I thought that I had it all setup right (that was at least what I
understood from everything I read), so here is my nat table:

# iptables -t nat -v -L
Chain PREROUTING (policy ACCEPT 1774 packets, 193K bytes)
 pkts bytes target     prot opt in     out     source             =20
destination

Chain POSTROUTING (policy ACCEPT 1443 packets, 77156 bytes)
 pkts bytes target     prot opt in     out     source             =20
destination
    0     0 SNAT       all  --  any    eth1    anywhere           =20
anywhere           to:11.22.33.44

Chain OUTPUT (policy ACCEPT 317 packets, 23092 bytes)
 pkts bytes target     prot opt in     out     source             =20
destination

Now if I ping an external IP address from another box on the "inside" =
and
run "tcpdump -ni eth1" on the gateway box, I will see the source address
being unchanged! (and I don't get an icmp echo reply back).

So what did I miss? Isn't it just a oneliner to turn SNAT on?

Martin




