From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptable woes
Date: 21 Apr 2003 19:25:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050967556.24606.144.camel@alpha.newkirk.us>
References: <9EC6A5A6B11DA843A551CC9AD9323FAC3014@exchange.musicreports.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9EC6A5A6B11DA843A551CC9AD9323FAC3014@exchange.musicreports.com>
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
To: "James D. Parra" <JamesP@MusicReports.com>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Mon, 2003-04-21 at 17:55, James D. Parra wrote:
> Hello,
> 
> Try as I may, I cannot get packets to go through the firewall from the
> public side to the private side. I have set up scripts that should work, as
> written from Netfilter, but there must be something I am overlooking.

Yep... ;^)


> # TCP Rules
> iptables -A INPUT -p TCP -i eth1 -s 0/0 --destination-port 1723 -j okay
> iptables -A INPUT -p tcp -i eth1 -s 0/0 --destination-port 80 -j okay

dport 80 not needed, since you're DNATting it anyway.


> # (4) FORWARD chain rules
> # Accept packets we want to forward
> iptables -A FORWARD -i eth0 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -p tcp --sport 1024:65535 -d
> PVT.XXX.XXX.XXX --dport 80 \
> -m state --state NEW -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j
> ACCEPT

This last is also unneeded, since you have a more general state rule
just above it.

> # (6) PREROUTING chain rules
> iptables -t nat -A PREROUTING -i eth1 -p tcp --sport 80 -d PUB.XXX.XXX.XXX
> --dport 80 \
> -j DNAT --to-destination PVT.XXX.XXX.XXX:80
> iptables -t nat -A PREROUTING -p tcp -d  --dport 1723 -j DNAT
> --to-destination PVT.XXX.XXX.XXX

Ah, the meat of the problem...  You're matching ONLY packets with BOTH
dport AND sport of 80...  Drop the "--sport 80" part and you should be
all set to server http.

j



