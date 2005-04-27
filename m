From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Local Port Forwarding.
Date: Wed, 27 Apr 2005 21:48:59 +0100
Message-ID: <20050427204859.GC18183@metastasis.org.uk>
References: <1114206098.6690.5.camel@cautin2.dcsc.utfsm.cl>
	<20050422215756.GA5739@bender.817west.com>
	<4269745C.70305@riverviewtech.net>
	<20050422220715.GA5807@bender.817west.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050422220715.GA5807@bender.817west.com>
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

On Fri, Apr 22, 2005 at 06:07:15PM -0400, Jason Opperisano wrote:
> On Fri, Apr 22, 2005 at 05:02:04PM -0500, Taylor, Grant wrote:
> > >  iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortY \
> > >    -j DNAT --to-destination $LocalHost:$PortY
> > 
> > Slight typo
> > 
> > iptables -t nat -A OUTPUT -p tcp -d $HostX --dport $PortX -j DNAT 
> > --to-destination $LocalHost:$PortY
> 
> whoops.  nice catch.

iptables -t nat -A OUTPUT -p udp -d 192.168.13.43 --dport 161 -j
REDIRECT --to-ports 32789

Makes no difference to the traffic I sent out on port 161 to host
192.168.14.43, any ideas on what I could be missing out?

I'm using iptables version 1.2.8 if that makes a difference....

-- 
http://tinyurl.com/7xyt2


