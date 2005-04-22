From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Local Port Forwarding.
Date: Fri, 22 Apr 2005 17:02:04 -0500
Message-ID: <4269745C.70305@riverviewtech.net>
References: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
	<20050422215756.GA5739@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050422215756.GA5739@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

>   iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortY \
>     -j DNAT --to-destination $LocalHost:$PortY

Slight typo

iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortX -j DNAT --to-destination $LocalHost:$PortY



Grant. . . .

