From: "Jon Anderson" <jon-anderson@rogers.com>
Subject: Blocking hosts on the fly...?
Date: Wed, 30 Oct 2002 20:35:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002c01c2807d$c4d5abc0$0300000a@hypnos>
References: <878z0qjelg.fsf@ataraxia.vodkafone.de>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

I was playing around with my firewall yesterday, and I had a thought...Would
it be possible to block portscans on the fly (i.e. as they happen, block the
offending host)?

It's easy enough to foil invalid packet portscans (i.e. invalid state), but
syn and connect() scans are a little more annoying...They can be blocked (in
an unusable way) with the following:

# iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
# iptables -A INPUT -p tcp --syn -j REJECT --reject-with tcp-reset

That of course would allow one syn packet per second (plus burst, but I'll
ignore that for now), and packets beyond that would be sent a tcp-rst -
making open or closed ports look closed after a burst of syn packets is
detected. This effectively blocks the port scan (because everything after
1/s + burst looks closed). I tested this with nmap -sS, and it does in fact
trick it into thinking all ports are closed.

Doing it this way obviously doesnt't work though, because, this makes DoS
attacks real easy, and prevents more than one connection a second, even from
legitimate users. This obviously isn't a working solution.

This leads me to wonder if it's possible to block hosts on the fly - is
there a way to say something like allow one syn packet per second, per host,
and if more than 1/s block that host?

Hope that question makes some sense...And I hope there's an iptables based
solution to this!

Cheers,

jon anderson


