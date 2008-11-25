From: "Adem" <for-gmane@alicewho.com>
Subject: Re: banning bot ips with ipset
Date: Tue, 25 Nov 2008 23:54:08 +0100
Message-ID: <gghvpm$1cc$1@ger.gmane.org>
References: <492C6780.4020909@xprima.com> <Pine.LNX.4.58.0811252145030.31197@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

"G.W. Haywood" wrote:
> On Tue, 25 Nov 2008, Nigel Heron wrote:
> 
> > We're being attacked by a botnet ... started dropping them in
> > iptables, once we got to ~1700 banned ips the server stopped nat'ing
> > completely (not sure why..)
> 
> It probably just ran out of steam.  The performance of iptables with
> thousands of rules can be poor if you don't structure them carefully.
> 
> > Is ipset stable enough to be deployed on live environments?
> 
> I've been using it for years with absolutely zero problems.
> 
> > iphash seems like the best set type for us, how many
> > ips can the set handle before there's a noticeable slowdown?
> 
> I currently have about 50,000 ipset (iphash) rules on modest hardware,
> with no noticeable performance impact.  There's a good report here:
> http://people.netfilter.org/kadlec/nftest.pdf

Do you understand what the authors means with this statement in section 4.2:

  "As the graph displays, the system handled almost 
   3,500,000 concurrent connections at the peak."

I wonder how this is possible... :-)
I think one would need a machine with 54 NIC's (real and/or virtual) attached to it, isn't it? :-)


