From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffelist@amagerkollegiet.dk>
Subject: Re: Forwarding problem, :( port redirection!
Date: Mon, 24 Feb 2003 09:57:21 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0302240952280.1142-100000@grignard.amagerkollegiet.dk>
References: <04a401c2dbdf$61d69d00$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04a401c2dbdf$61d69d00$0b00000a@nocpc3>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: louie miranda <lmiranda@chikka.com>
Cc: netfilter@lists.samba.org

On Mon, 24 Feb 2003, louie miranda wrote:

> panic:/# iptables -t nat -A PREROUTING -i eth0 -p tcp -d
> 203.190.72.108 --dport 21 -j DNAT --to 10.0.0.11:21
> panic:/# iptables -A FORWARD -i eth0 -o eth1 -p tcp -d
> 203.190.72.108 --dport 21 -j ACCEPT
> panic:/# telnet 203.190.72.108 21
> Trying 203.190.72.108...
> telnet: Unable to connect to remote host: Connection refused
> panic:/# telnet 10.0.0.11 21
> Trying 10.0.0.11...
> Connected to 10.0.0.11.
> Escape character is '^]'.
> 220 Dynu FTP Server (Version 1.13)
> ^]
> telnet> q
> Connection closed.
> panic:/# telnet 203.190.72.108 21
> Trying 203.190.72.108...
> telnet: Unable to connect to remote host: Connection refused
> panic:/#

Why do you want to use the WAN IP from your LAN when you could contact
the LAN IP directly?

What you have to do is:

1) Forward traffic from internal hosts.
2) NAT local->local traffic (This is explained somewhere in the
   netfilter docs)

The above rules only forwards traffic from the internet.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
Programming is a race between programmers, who try and make more and
more idiot-proof software, and universe, which produces more and more
remarkable idiots.
Until now, universe leads the race.
                                                           - R. Cooka
----------------------------------[ moffe at amagerkollegiet dot dk ] --



