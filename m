From: Bill Chappell <bill.chappell@critical.com>
Subject: Re: Question about -m tos option
Date: Tue, 14 Oct 2003 22:38:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8CB309.A4713C61@critical.com>
References: <000801c39183$9a3fed90$2d0410d4@urbannet6ku735>
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
To: netfilter@lists.netfilter.org

> "Pavel V. Chjen" wrote:
> 
> 0x60 is out of valid range in dscp matching (:
> [root@root linux]# iptables -A FORWARD -m dscp --dscp 0x60
> iptables v1.2.9rc1: DSCP `96` out of range

You only have 6 bits of the 8 bits in the ToS to work with
for DSCP,
(http://www.cisco.com/warp/public/105/dscpvalues.html#dscpandassuredforwardingclasses)
and valid values are explicitly 0 through 63 (decimal)
(http://www.cisco.com/univercd/cc/td/doc/product/software/ios122/122cgcr/fqos_r/qrfcmd4.htm#1098678).

Your rule used 60(hex),
which is 96(decimal) as the error message reported.


I got these references, and more, to confirm what
I thought I knew about DSCP by asking Google
for DSCP and DSCP+size, if that helps for the future.
(www.google.com)


I hope this helps and that you really do not
need 96 different values for the DSCP.

Bill


-- 
William Chappell,     Software Engineer,     Critical Technologies, Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica, NY
13501
315-793-0248  x148  < bill.chappell@critical.com >  www.critical.com

