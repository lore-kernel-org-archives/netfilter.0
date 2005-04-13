From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 11:08:43 -0500
Message-ID: <1113408523.8270.16.camel@plasma.starken.com>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
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
To: Eduardo Spremolla <edspremolla@antel.com.uy>
Cc: netfilter@lists.netfilter.org

Couldn't he just SNAT the packets on his side when they become un-
encapsulated?  I'm doing this on a couple of my vpn links.

Dan

On Tue, 2005-04-12 at 15:08 -0300, Eduardo Spremolla wrote:
> I have 2 local networks 10.2.2.0/24 and 10.37.130.0/24 interconnected by
> a ipsec tunnel running on kernel 2.6 native ipsec. So far so good.
> 
> Now the admin of 10.37.130.0 wants me to NAT my network to 10.3.3.0
> because he had a ip conflict. I cant SNAT because when the packet goes
> to nat post it has been encapsulated in ESP and had the firewalls
> address, as you can see in the bottom log snipe.I try to use NETMAP in
> mangle PREROUTING, but it changes the dest ip , not the source.
> 
> Is this possible?
> 
> Thanks in advance for any clue.
> 
> LALO



