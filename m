From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffelist@amagerkollegiet.dk>
Subject: Re: Forwarding problem, :( port redirection!
Date: Mon, 24 Feb 2003 09:25:19 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0302240923210.1142-100000@grignard.amagerkollegiet.dk>
References: <045a01c2dbdc$8964ae00$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <045a01c2dbdc$8964ae00$0b00000a@nocpc3>
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

> Im trying just to forward simple ftp, 21 request into my internal machine=
=2E
> Im typing this but it does not work..

> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 10.0.0.11 --dport 21 -j
> DNAT --to 203.190.72.108:21
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 203.190.72.108 --dport 21 -=
j
> ACCEPT

Are you *sure* of those IP's? 10.0.0.11 is a private IP and is unusable
on the internet - however your rules state that 10.0.0.11 is located on
the internet. I'm pretty sure, you need to exchange the global and local
IP.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
Drink wet cement: Get Stoned.
----------------------------------[ moffe at amagerkollegiet dot dk ] --


