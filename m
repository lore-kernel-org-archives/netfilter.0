From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: bandwidth again maybe O T
Date: Thu, 05 Sep 2002 00:54:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPGEKBCNAA.stewart.thompson@shaw.ca>
References: <0H1Y00DGTFACWJ@l-daemon>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0H1Y00DGTFACWJ@l-daemon>
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
To: PayalR <payal@hotpop.com>, netfilter@lists.netfilter.org

Hi:

	If the connections were to the local machine, they
Wouldn't show up in the Forward Chain, but in the input chain.
Did you check all the counters? Iptables -v -L.

Stu.........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of PayalR
Sent: September 5, 2002 12:13 AM
To: netfilter@lists.netfilter.org
Subject: Re: bandwidth again maybe O T

Hi,
Thanks a lot for mails. Well, I think I get the general idea.
> However, to measure the amount of http traffic going to/from a specific IP
> address, put a couple of rules such as this in your FORWARD chain:
> iptables -I FORWARD -d a.b.c.d -p tcp --dport 80
> iptables -I FORWARD -s a.b.c.d -p tcp --sport 80

I wanted for all protocol and not just http so I modified your rule a bit
like,
iptables -I FORWARD -d 192.168.0.1 -p tcp
iptables -I FORWARD -s 192.168.0.1 -p tcp

These are the only two rules I have.

I tried to test it using
#iptables -L FORWARD -x -v
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination
       0        0            tcp  --  any    any     localhost.localdomain
anywhere

       0        0            tcp  --  any    any     anywhere
localhost.localdomain

I tried pinging it few times, connecting to port 25, telnet, 80 etc. fom the
local machine. But the number of bytes above do not change.
What must be wrong?
Thanks a lot in advance and bye.
-Payal





>
> You might want to run this command in a cron job every day (or perhaps
more
> frequently) and then you can calculate daily traffic patterns throughout a
> month etc.
>
> You can reset the counters with
>
> iptables -Z FORWARD
>
> If you combine the -Z option with the earlier command, you will find out
> the values of the counters and then they will be (atomically) reset to
zero
> so you can start counting a new day from zero.
>
> Antony.


