From: James Sneeringer <james+netfilter@vincentsystems.com>
Subject: Re: "CE" - Where's the  snot?
Date: Sun, 25 Jul 2004 00:26:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040725052624.GA31277@valjean.si.ocslink.com>
References: <1090682116.3343.7.camel@dchws.tqmcube.com> <200407241644.01366.Antony@Soft-Solutions.co.uk> <1090700564.10960.2.camel@dchws.tqmcube.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1090700564.10960.2.camel@dchws.tqmcube.com>
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
To: NetFilter List <netfilter@lists.netfilter.org>

On Sat, Jul 24, 2004 at 04:22:44PM -0400, David Cary Hart wrote:
> Jul 24 16:21:01 mail kernel: - Firewall:  IN=eth0 OUT=
> MAC=00:4f:4e:12:f9:93:00:09:5b:c9:37:54:08:00  SRC=68.236.163.19 D
> ST=192.168.0.31 LEN=41 TOS=00 PREC=0x00 TTL=126 ID=59477 CE DF PROTO=TCP
> SPT=4694 DPT=135 SEQ=4252944646 ACK=3536024229 WIND
> OW=64320 ACK URGP=0
> 
> Note the "CE" just in front of "DF" = Congestion Experienced

Sounds like ECN, Explicit Congestion Notification.  CE is one of the bits
it can set.  Linux has had support for it for some time, but it's a 
compile-time option that's disabled by default because not all firewalls 
understand it, and many won't deal with ECN negotiation properly.  If you 
have a /proc/sys/net/ipv4/tcp_ecn, then your kernel supports ECN.  If 
tcp_ecn is set to 1, it's turned on (which is the default if you compile 
it in).

The remote source, 68.236.163.19, is either the host you were speaking to, 
or some router along the way, and it was trying to notify you that the 
path between you and them might be congested.

http://www.faqs.org/rfcs/rfc2481.html
http://www.faqs.org/rfcs/rfc3168.html

It's complicated, but if this was traffic you were going to drop anyway, 
it's not worth worrying about.  If ECN caused you to incorrectly drop the 
packet, there's an ECN match and target in the stock kernel you might find 
useful, though you might need to recompile to get them 
(CONFIG_IP_NF_MATCH_ECN and CONFIG_IP_NF_TARGET_ECN).

-James


