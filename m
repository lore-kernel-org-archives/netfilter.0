From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Proxy Chaining
Date: Sat, 20 Sep 2003 12:17:15 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C315@wardrive.citadelcomputer.com.au>
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
To: Javier Govea <jgovea@magma.ca>, netfilter@lists.netfilter.org

Get SQUID to do that.. first machine can do a transparent proxy and let =
squid do the rest.

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
From: Javier Govea [mailto:jgovea@magma.ca]
Sent: Saturday, 20 September 2003 1:37 AM
To: netfilter@lists.netfilter.org
Subject: Proxy Chaining


Hi to all,

I want to setup a chain of proxies and I was wondering if this could be =
done with=20
iptables. Any advice is very welcome. Here is more in detail what I =
want:

Host A needs to forward all traffic (http, ftp, icmp, ...) to Host B, =
which in turns=20
forwards all traffic to Host C, which in turns forawards everything to =
its default=20
gateway. The hosts do not belong to a LAN only A and B are in the same =
LAN.=20

Is it possible to setup this kind of proxy chaining with iptables?? if =
so, any=20
suggestions on how to do it?? if iptables is not the right tool to solve =
this problem,=20
any suggestions on what can i use???

thanx to all in advance..
Xavier


