From: PayalR <payal@hotpop.com>
Subject: Re: bandwidth again maybe O T
Date: Thu, 5 Sep 2002 12:42:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <44941.1693065942$1031210845@news.gmane.org>
References: <200209041908.49707@.> <200209041527.g84FRpv31480@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209041527.g84FRpv31480@vulcan.rissington.net>
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
Thanks a lot for mails. Well, I think I get the general idea.
> However, to measure the amount of http traffic going to/from a specific=
 IP
> address, put a couple of rules such as this in your FORWARD chain:
> iptables -I FORWARD -d a.b.c.d -p tcp --dport 80
> iptables -I FORWARD -s a.b.c.d -p tcp --sport 80

I wanted for all protocol and not just http so I modified your rule a bit=
=20
like,
iptables -I FORWARD -d 192.168.0.1 -p tcp
iptables -I FORWARD -s 192.168.0.1 -p tcp

These are the only two rules I have.

I tried to test it using=20
#iptables -L FORWARD -x -v
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source            =
  =20
destination
       0        0            tcp  --  any    any     localhost.localdomai=
n =20
anywhere

       0        0            tcp  --  any    any     anywhere            =
=20
localhost.localdomain

I tried pinging it few times, connecting to port 25, telnet, 80 etc. fom =
the=20
local machine. But the number of bytes above do not change.
What must be wrong?
Thanks a lot in advance and bye.
-Payal





>
> You might want to run this command in a cron job every day (or perhaps =
more
> frequently) and then you can calculate daily traffic patterns throughou=
t a
> month etc.
>
> You can reset the counters with
>
> iptables -Z FORWARD
>
> If you combine the -Z option with the earlier command, you will find ou=
t
> the values of the counters and then they will be (atomically) reset to =
zero
> so you can start counting a new day from zero.
>
> Antony.

