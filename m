From: "Aldo Lagana" <lagaa00@discmail.com>
Subject: Re: Lan traffic Monitoring tools
Date: Fri, 7 Feb 2003 10:08:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004201c2ceba$d1a31500$a700a8c0@ASLVAIO>
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
To: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org

I have been using Linux firewalls since ipfwadm.  What I used to use was
'ksnuffle' for both ipfwadm and ipchains; but since moving to iptables, I
have installed squid proxy and have it set to tranparent proxy and it
provides great information that I run through 'sarg' and then scp to my web
server for daily reports of LAN Internet usage

----- Original Message -----
From: "Sundaram Ramasamy" <sun@percipia.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, February 07, 2003 9:46 AM
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


