From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP Forwarding
Date: Fri, 14 Jan 2005 09:27:30 -0500
Message-ID: <1105712849.3661.24.camel@hubcap.ljm.dom>
References: <20041228171949.35308.qmail@web53109.mail.yahoo.com>
	<1104255053.7318.28.camel@hubcap.ljm.dom>
	<001301c4fa17$03de2b20$0200a8c0@etpi>
	<008c01c4fa2d$92edd930$051ea8c0@floydian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008c01c4fa2d$92edd930$051ea8c0@floydian>
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
To: netfilter@lists.netfilter.org

On Fri, 2005-01-14 at 06:38, Deepak Seshadri wrote:
> iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -s $PublicIPAdd -d 
> 202.147.167.99 \
>    --dport 21 -j DNAT --to-destination 192.168.0.5

personally--i don't believe in filtering in NAT.  nat in NAT, and filter
in FILTER; that's why they're there.  it makes the rule set much easier
to troubleshoot, and it saves you time a year from now when you look at
your rules and can't figure out why you can't FTP to that server from
some random IP address, since the FILTER rule is wide open.

-j

--
"Let us all bask in television's warm glowing warming glow."
	--The Simpsons


