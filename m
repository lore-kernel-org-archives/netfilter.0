From: Jason Opperisano <opie@817west.com>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 18:16:05 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095977765.9581.11.camel@wolfpack.ljm.dom>
References: <415290B1.5030401@imag.fr>  <4152DADF.4090802@pbl.ca>
	<1095976931.5171.12.camel@mistified.sf.bgservice.lab>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095976931.5171.12.camel@mistified.sf.bgservice.lab>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-23 at 18:02, Dimitar Katerinski wrote:
> Sorry, a little bit off topic, but I allways go red about such kind of crappy rules:
> 
> > Use DNAT target.  In short what you need to do is:
> > 
> >    iptables -A FORWARD -m state --state NEW -j ACCEPT
> 
> Do you know what you just did? You've just allowed any kind of
> connections, protocols to any port and from/to any destionation. Cute,
> isn't it? Remember, --state NEW, never ever have meant, and I doubt
> it'll ever mean that this is an tcp connection with only SYN bit set. It
> could be everyting, ACK,URG,PSH etc. So guess what, you just open a wide
> hole in your so called "firewall" machine. You better use --tpc-flags or
> --syn alias for such purposes. --state NEW can be used for redundant
> firewalling for example, but for me it has no use.

if you're going to go on a tirade about the problem with that rule, at
least point out the actual problem:  it doesn't specify the inbound
interface and/or source network(s):

  iptables -A FORWARD -i $INTERNAL_IF -m state --state NEW -j ACCEPT  

modifying it to use "-p tcp --syn" still allows all TCP traffic through
the FORWARD chain in both directions.

-j

-- 
Jason Opperisano <opie@817west.com>


