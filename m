From: "Akos Szalkai" <szalkai@2fkft.com>
Subject: Re: Weird TCP flags?
Date: Sat, 13 Dec 2003 15:00:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031213140043.GB229@2fkft.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <003101c3c065$f61ad790$13fea8c0@melita.com>
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
Content-Transfer-Encoding: 7bit
To: Ian Hunter <ihunter@hunterweb.net>
Cc: netfilter@lists.netfilter.org

> Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN URGP=0

I have also been seeing this kind of logs on our web server, and this is
my explanation.  Probably it is an incoming HTTP connection (ie. SYN
packet) from a spoofed source address (204.157.6.223 in this case).
Your web server sends a syn-ack response, which the firewall in front of
204.157.6.223 silently drops (since it never saw the first packet of the
connection).  Therefore your web server retransmits and keeps on trying
for at least the RFC-minimum 180 seconds.  However, after 60 seconds
this kind of half-open connection is deleted from the connection table
on your firewall and then the syn-acks start hitting your "Fwd
DMZ->Internet DROP:" rule.

The scenario may be different (eg. no spoofing but some kind of
misconfiguration, etc.) but I think this is the reason.  You can verify
this with tcpdump (which I have not bothered to do yet...)

Regards,
Akos

-- 
Akos Szalkai <szalkai@2f.hu>
IT Consultant, CISA
2F 2000 Szamitastechnikai es Szolgaltato Kft.
Tel: (+36-1)-4887700  Fax: (+36-1)-4887709  WWW: http://www.2f.hu/

