From: "Iced Tea" <Iced_tea@gmx.net>
Subject: Re: iptables newbie
Date: Sat, 27 Dec 2003 20:09:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c3ccad$033417e0$056fa8c0@gotcha>
References: <Pine.GSO.4.58.0312271424260.10965@peppar.cs.umu.se> <1072536610.1868.41.camel@jasiiitosh.nexusmgmt.com> <Pine.GSO.4.58.0312271715200.23735@peppar.cs.umu.se>
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
To: Johan Cimen <c99jcn@cs.umu.se>
Cc: netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Johan Cimen" <c99jcn@cs.umu.se>
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Saturday, December 27, 2003 6:05 PM
Subject: Re: iptables newbie


>
> A more precise explanation of my problem:
> When I use below command within my script,
>
> iptables -t mangle -A OUTPUT -o $IFACE -p UDP --dport 7001 -j TOS
> --set-tos 0x10
>
> where I have an iptables -L at the very end, I can see the results:
>
> Chain OUTPUT (policy ACCEPT)
> target  prot opt source  destination
> TOS     udp -- anywhere  anywhere    udp dpt:7001 TOS set
Maximize-Throughput

for detailed information use verbose option -v:

iptables -vL OUTPUT

tschoe
  Ulrich


