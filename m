From: Les Mikesell <les@futuresource.com>
Subject: Re: avoid NAT for one address?
Date: Sat, 24 Jul 2004 17:42:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090708976.18472.7.camel@les-home.futuresource.com>
References: <1090688447.17721.24.camel@les-home.futuresource.com>
	 <200407241824.43799.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241824.43799.Antony@Soft-Solutions.co.uk>
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

On Sat, 2004-07-24 at 12:24, Antony Stone wrote:
> On Saturday 24 July 2004 6:00 pm, Les Mikesell wrote:
> 
> > So, the long story comes down to this question: is there a simple
> > statement I can add to force all packets to a certain destination
> > to skip over all the other special cases and go directly out the
> > right interface with no nat or other changes?  I'd like to keep the
> > changes to a minimum since everything else works.
> 
> iptables -I POSTROUTING -t nat -d a.b.c.d -j ACCEPT
> 
> where a.b.c.d is the destination address for packets you don't want anything 
> changed on.

Thanks, but it didn't fix it and iptables -v -t nat --list shows
that the rule isn't being hit.  The weird thing here is that
tcpdump sees the GRE packets coming in on the eth1 interface OK but
as they go out the cipcb0 interface they are source-natted with
the eth0 interface address and I don't see any rules that
should be causing that - but I'm not sure I understand them
all.

---
  Les Mikesell
   les@futuresource.com



