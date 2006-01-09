From: "Amresh Kumar" <amresh_srivastava@hotmail.com>
Subject: Re: iptables: No chain/target/match by that name
Date: Mon, 09 Jan 2006 12:51:42 +0530
Message-ID: <BAY105-F19C8BBEE4B5C9FE19B026C9E220@phx.gbl>
References: <1136659810.2599.10.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1136659810.2599.10.camel@localhost>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jsullivan@opensourcedevel.com
Cc: netfilter@lists.netfilter.org


Hi,
Thanks for quick reply. My Iptables rule is enabled  as a module. Yes i am 
loading the module for this i am doing

modprobe ip_tables
insmod ./ipt_nth.ko
Than after applying rule iptables  -A PREROUTING -i eth0 -p tcp --dport 80 
-m state
--state NEW -m nth --counter 0 --every 4 --packet 0  -j DNAT
It is working fine

But  iptables rule for Load Balancing with random  is not working. still 
giving error
iptables: No chain/target/match by that name

Can i enable this rule in my kernel.....


Thanks....

>--

>From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
>To: Amresh Kumar <amresh_srivastava@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: iptables: No chain/target/match by that name
>Date: Sat, 07 Jan 2006 13:50:10 -0500
>MIME-Version: 1.0
>Received: from itza.net ([198.77.208.51]) by bay0-mc12-f10.bay0.hotmail.com 
>with Microsoft SMTPSVC(6.0.3790.211); Sat, 7 Jan 2006 10:50:38 -0800
>Received: from [192.168.223.201] (unverified [24.75.251.186]) by itza.net 
>(ITZA Company Hosting Services - http://www.itza.net) with ESMTP id 
>14066248 for multiple; Sat, 07 Jan 2006 13:50:25 -0500
>X-Message-Info: JGTYoYF78jHLwkyVEn2eatAFdoqg5YYBiazxjq0B+qw=
>Return-Path: <jsullivan@opensourcedevel.com>
>References: <BAY105-F281A346E9A68ED0764F10F9E200@phx.gbl>
>X-Mailer: Evolution 2.2.3 (2.2.3-2.fc4) X-Server: High Performance Mail 
>Server - http://surgemail.com r=-670927196
>X-Avast: Message is clean
>X-IP-stats: Incoming Last 0, First 70, in=193, out=0, spam=0
>X-External-IP: 24.75.251.186
>X-OriginalArrivalTime: 07 Jan 2006 18:50:38.0487 (UTC) 
>FILETIME=[40476270:01C613BB]
>
>On Sat, 2006-01-07 at 12:42 +0530, Amresh Kumar wrote:
> > Hi ,
> >
> > I am using  iptables rule for Load Balancing with random* or nth but i 
>am
> > getting the error
> >
> > iptables: No chain/target/match by that name
> >
> > iptables rule :  iptables  -A PREROUTING -i eth0 -p tcp --dport 80 -m 
>state
> > --state NEW -m nth --counter 0 --every 4 --packet 0  -j DNAT
> > --to-destination 192.168.0.5:80
> >
> > iptables -A PREROUTING -i eth0 -p tcp --dport 80 -m state --state NEW -m
> > random --average 25 -j DNAT --to-destination 192.168.0.5:80
> >
> > My kernel version is  2.6.9-5.0.3.EL
> > Iptable version = iptables v1.3.4
> >
> > can anyone  explain.
> >
> > Thanks..
><snip>
>Is it enabled in the kernel or as a module? If as a module, is it
>loaded? - John
>--
>John A. Sullivan III
>Open Source Development Corporation
>+1 207-985-7880
>jsullivan@opensourcedevel.com
>
>If you would like to participate in the development of an open source
>enterprise class network security management system, please visit
>http://iscs.sourceforge.net
>

_________________________________________________________________
How good are you in a Formula One car? Play now 
http://server1.msn.co.in/sp05/tataracing/onlinegame.asp


