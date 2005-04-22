From: Jason Opperisano <opie@817west.com>
Subject: Re: Local Port Forwarding.
Date: Fri, 22 Apr 2005 18:07:15 -0400
Message-ID: <20050422220715.GA5807@bender.817west.com>
References: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
	<20050422215756.GA5739@bender.817west.com>
	<4269745C.70305@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Apr 22, 2005 at 05:02:04PM -0500, Taylor, Grant wrote:
> >  iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortY \
> >    -j DNAT --to-destination $LocalHost:$PortY
> 
> Slight typo
> 
> iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortX -j DNAT 
> --to-destination $LocalHost:$PortY

whoops.  nice catch.

-j

--
"Brian: You got anything on that remote lower than Mute?"
        --Family Guy

