From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: What does this mean?
Date: Thu, 27 Feb 2003 16:48:30 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0302271645200.31492@dns.toxicfilms.tv>
References: <1046358409.11465.23.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1046358409.11465.23.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

> I see this in my firewall log:
> Feb 27 16:51:19 firefly kernel: DROP FORWARD INTERNAL: IN=eth2 OUT=eth0
> SRC=10.0.0.67 DST=68.84.228.144 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> ID=64368 DF PROTO=TCP SPT=54767 DPT=0 WINDOW=5840 RES=0x00 CWR ECE SYN
> URGP=0
>
> What is DPT=0? I've never heard of using port 0 ...
No services there, this packet is certainly invalid. Some OS's respond to
them with tcp rst, some just drop them.

> What is CWR ECE SYN? Are they TCP flags? If so, what is CWR ECE ?
Yes they are TCP flags, CWR & ECE are ECN extensions to the TCP header.
Read RFC 3168.

Note, some routers outthere are not ECN aware and violate RFC 3168 by
dropping these packets. This causes interoperability problems, which
should be resolved by vendors.

> Ray
Maciej

