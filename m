From: "Paul Cousins" <paul@pimper.fsnet.co.uk>
Subject: Re: Lan traffic Monitoring tools
Date: Fri, 7 Feb 2003 16:07:47 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002b01c2cec3$0e34ef90$0c00a8c0@frodo>
References: <E88493086664D511A1E4000103330E82027FE05C@mail.maconomy.dk> <832811662.20030207102832@wp.pl> <003501c2ceb7$c3713af0$8c01a8c0@sundaram>
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

Best thing you  can do is install squid and then set it up as a transparent
proxy and use itpables to route all prot 80 traffic through it. ntop and
mrtg will not give you the level of detail you are after on there own
however when used with squid youll be able to get all the info youll ever
need on what clients are doing what.

Unless the clients you wish to minito are SNMP enabled you not going to able
to get much data form them using mrtg et al also you will not just capture
net traffic but all lan traffic will also been shown so again this would not
be close to what you need. defianltey look into squid and transparent
proxying.

______________________________________________
No trees were harmed in posting this message. However, a large number of
electrons were terribly inconvenienced.

"Sir, we're surrounded."
"Excellent. We can attack in any direction!"

----- Original Message -----
From: "Sundaram Ramasamy" <sun@percipia.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, February 07, 2003 2:46 PM
Subject: Lan traffic Monitoring tools


> Hi All,
>
> I have firewall based on iptables (Redhat 7.3) Custom build kernel. I want
> to
>  monitor the my LAN traffic, basically I need a report
>  PC IP Address : web site it accessing, date and time
>
> I am not using any proxy in my gateway machine.
>
>  I checked out ntop, mrtg. I would like to know which is best  tool for
this
> propose.
>
> -RS
>
>
>
>



