From: Johan Cimen <c99jcn@cs.umu.se>
Subject: Re: iptables newbie
Date: Sat, 27 Dec 2003 20:16:59 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.58.0312272015300.23735@peppar.cs.umu.se>
References: <Pine.GSO.4.58.0312271424260.10965@peppar.cs.umu.se>
 <1072536610.1868.41.camel@jasiiitosh.nexusmgmt.com>
 <Pine.GSO.4.58.0312271715200.23735@peppar.cs.umu.se> <000a01c3ccad$033417e0$056fa8c0@gotcha>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c3ccad$033417e0$056fa8c0@gotcha>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Iced Tea <Iced_tea@gmx.net>
Cc: netfilter@lists.netfilter.org

On Sat, 27 Dec 2003, Iced Tea wrote:

> >
> > A more precise explanation of my problem:
> > When I use below command within my script,
> >
> > iptables -t mangle -A OUTPUT -o $IFACE -p UDP --dport 7001 -j TOS
> > --set-tos 0x10
> >
> > where I have an iptables -L at the very end, I can see the results:
> >
> > Chain OUTPUT (policy ACCEPT)
> > target  prot opt source  destination
> > TOS     udp -- anywhere  anywhere    udp dpt:7001 TOS set
> Maximize-Throughput
>
> for detailed information use verbose option -v:
>
> iptables -vL OUTPUT

Noop! Shows nothing as usually.

Thanks for your suggestion.

-Johan-

