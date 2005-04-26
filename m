From: Alejandro Villarroel <alejandro.villarroel@usm.cl>
Subject: Re: Local Port Forwarding.
Date: Tue, 26 Apr 2005 08:59:58 -0400
Message-ID: <1114520398.10652.3.camel@cautin2.dcsc.utfsm.cl>
References: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
	<20050422215756.GA5739@bender.817west.com>
	<4269745C.70305@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4269745C.70305@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Thanks Taylor and Jason, both solutions worked just fine,
Thanks for your help,
	Alejandro

iptables -t nat -A OUTPUT -d $HostX -p tcp --dport $PortX -j REDIRECT --
to-ports $PortY

On Fri, 2005-04-22 at 17:02 -0500, Taylor, Grant wrote:
> >   iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortY \
> >     -j DNAT --to-destination $LocalHost:$PortY
> 
> Slight typo
> 
> iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortX -j DNAT --to-destination $LocalHost:$PortY
> 
> 
> 
> Grant. . . .



