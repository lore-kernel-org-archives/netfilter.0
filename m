From: Tom Eastep <teastep@shorewall.net>
Subject: Re: [Shorewall-users] What's my src?
Date: Mon, 13 Dec 2004 17:58:04 -0800
Message-ID: <1102989484.32219.24.camel@tipper.shorewall.net>
References: <41BE4847.4050302@loudas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41BE4847.4050302@loudas.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Shorewall Users <shorewall-users@lists.shorewall.net>
Cc: "Netfilter Users (List)" <netfilter@lists.netfilter.org>

On Tue, 2004-12-14 at 14:56 +1300, Paul wrote:
> What is my source?
> tail /var/log/messages
> Dec 14 14:53:14 rama-kandra kernel: Shorewall:all2all:REJECT:IN=
> OUT=eth3 SRC=203.96.213.73 DST=203.152.118.23 LEN=288 TOS=0x00 PREC=0x00
> TTL=64 ID=73 DF PROTO=UDP SPT=500 DPT=500 LEN=268
> 
> doesn't match tcrules
> 4       202.37.230.93   0.0.0.0/0       udp     500
> 
> how does the kernel decide which src to use?
> 
> Ultimately I want all UDP 500 to use src 202.37.230.93

Paul -- this whole thread is wildly off-topic for this list!

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key



