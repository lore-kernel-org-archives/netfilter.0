From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables + access-list
Date: Wed, 28 May 2003 16:54:06 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D25@wardrive.citadelcomputer.com.au>
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
To: Burak Sahin <burak.sahin@is.net.tr>, netfilter@lists.netfilter.org

Just ACCEPT those wanting to bypass squid and REDIRECT into squid (as =
the last line) for the rest of the networks.....

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Burak Sahin [mailto:burak.sahin@is.net.tr]
Sent: Wednesday, May 28, 2003 4:33 PM
To: netfilter@lists.netfilter.org
Subject: iptables + access-list


Hi to all,

I am using squid as transparent proxy. So I use iptables.Command I use =
is:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128

I want to use such an access-list: For instance if you want a page from
nework A.B.C.D/a.b.c.d, you do not use squid. It is possible doing with
squid, however I need to do this with iptables. I changed my command =
such
that:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
A.B.C.D/a.b.c.d -j REDIRECT --to-port 3128



MY QUESTION is;

For two networks, A.B.C.D/a.b.c.d and E.F.G.H/e.f.g.h how can I do this?

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
A.B.C.D/a.b.c.d -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
E.F.G.H/e.f.g.h -j REDIRECT --to-port 3128

Does not work. Because, when a request comes for an ip in the network
E.F.G.H/e.f.g.h, it is forwarded to squid, because of the iptabes first
rule...

How can I do access-list with iptables?

I need help

Thanks for your attention







