From: Jason Opperisano <opie@817west.com>
Subject: Re: Port-forwarding Perfomance
Date: Wed, 23 Feb 2005 16:10:53 -0500
Message-ID: <20050223211053.GA12107@bender.817west.com>
References: <421D2F04.8090100@wildcash.com>
	<1109156169.11713.2.camel@nostromo.bgsecm.com>
	<421DE4AF.6040702@wildcash.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <421DE4AF.6040702@wildcash.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Thu, Feb 24, 2005 at 06:29:03AM -0800, Rudi Starcevic wrote:
> Hi,
> 
> Still having trouble with port-forwarding performance.
> 
> As much as I look I can't find anything wrong.
> 
> I have one Linux 66.283.12.21 box and one Windows box 192.168.0.10
> 
> I can download a file of the linux box at around 140K/s
> 
> That very same file on the Windows machine is around 15K/s using DNAT 
> and Masq/Forwarding.
> 
> I'm very disappointed and did not expect to see anything like this, I 
> had more like 10% in mind ...
> 
> The linux box is not under heavy load and there is only 431 connections 
> being tracked.
> 
> Hmm .. I must have a problem else where, it just too hard to believe 
> those download rate numbers.

thoughts:

1 - you have a speed/duplexing mismatch between the internal interface
of the firewall and your internal switch...or the windows box and the
internal switch (but you should notice that slowing internal
transfers)...or both.

2 - your internet connection is ppp/pppoe and you have an MTU problem.
since the linux gateway is directly connected, it knows to lower the MTU
of the external interface, but machines behind it would continue to
assume an MTU of 1500; and in the absence of functioning PMTU
discovery, would suffer from significant packet loss due to the need for 
fragmentation.

3 - you're using some traffic shaping script (like the wondershaper) and
it is misconfigured.

-j

--
"Let us celebrate our agreement with the adding of chocolate to milk."
        --The Simpsons

