From: PayalR <payal@hotpop.com>
Subject: Re: bandwidth again maybe O T
Date: Mon, 9 Sep 2002 12:01:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3698.28577754578$1031553424@news.gmane.org>
References: <FLEKIPPLAEDMJMOOBBDPGEKBCNAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPGEKBCNAA.stewart.thompson@shaw.ca>
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

Hi,
=09Thanks a lot for the mails. I am late to reply cos' my connection was =
down=20
for 4 days.
Well, I put the rules like
ptables -I FORWARD -d 192.168.0.1 -p tcp
iptables -I FORWARD -s 192.168.0.1 -p tcp

Yes, I can see the logs by,
iptables -v -L
But there is nothing in FORWARD chain. The input and output chains are fi=
lled=20
up.
What is the problem?
Thanks a lot and bye.
-Payal

On Thursday 05 September 2002 01:24 pm, Stewart Thompson wrote:
> Hi:
>
> =09If the connections were to the local machine, they
> Wouldn't show up in the Forward Chain, but in the input chain.
> Did you check all the counters? Iptables -v -L.
>
> Stu.........
>
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of PayalR
> Sent: September 5, 2002 12:13 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: bandwidth again maybe O T
>
> Hi,
> Thanks a lot for mails. Well, I think I get the general idea.
>
> > However, to measure the amount of http traffic going to/from a specif=
ic
> > IP address, put a couple of rules such as this in your FORWARD chain:
> > iptables -I FORWARD -d a.b.c.d -p tcp --dport 80
> > iptables -I FORWARD -s a.b.c.d -p tcp --sport 80
>
> I wanted for all protocol and not just http so I modified your rule a b=
it
> like,
> iptables -I FORWARD -d 192.168.0.1 -p tcp
> iptables -I FORWARD -s 192.168.0.1 -p tcp
>
> These are the only two rules I have.
>
> I tried to test it using
> #iptables -L FORWARD -x -v
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>        0        0            tcp  --  any    any     localhost.localdom=
ain
> anywhere
>
>        0        0            tcp  --  any    any     anywhere
> localhost.localdomain
>
> I tried pinging it few times, connecting to port 25, telnet, 80 etc. fo=
m
> the local machine. But the number of bytes above do not change.
> What must be wrong?
> Thanks a lot in advance and bye.
> -Payal
>
> > You might want to run this command in a cron job every day (or perhap=
s
>
> more
>
> > frequently) and then you can calculate daily traffic patterns through=
out
> > a month etc.
> >
> > You can reset the counters with
> >
> > iptables -Z FORWARD
> >
> > If you combine the -Z option with the earlier command, you will find =
out
> > the values of the counters and then they will be (atomically) reset t=
o
>
> zero
>
> > so you can start counting a new day from zero.
> >
> > Antony.

