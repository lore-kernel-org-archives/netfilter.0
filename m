From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: udp/tcp port range rules for forward/input chains
Date: Thu, 16 Oct 2003 17:34:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066340042.6368.21.camel@tarkus>
References: <1066187418.14600.28.camel@tarkus>
 <1066199232.20310.4.camel@alpha.newkirk.us>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1066199232.20310.4.camel@alpha.newkirk.us>
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
To: firewalldude@newkirk.us
Cc: netfilter@lists.netfilter.org

As it turned out their was a hidden character in one of my logging rules
which was totally messing with my head :-)



Thanks,
Ted
On Wed, 2003-10-15 at 02:27, Joel Newkirk wrote:
> On Tue, 2003-10-14 at 23:10, Ted Kaczmarek wrote:
> > Digging around the only thing I found was a patch-o-matic that allowed
> > for doing a range of 15 ports.
> > 
> > I see many references with dnat and snat, but nothing besides the patch
> > for input or forward chains.
> > 
> > If anyone has a link that or info that can steer me in the right
> > direction the beers are on me at the Javits Center Linux show.
> > 
> > Thanks,
> > Ted
> 
> Do you mean something like specifying tpc port 135 through 139 in a
> single rule?
> 
> iptables -A INPUT -i $EXTIF -p tcp --dport 135:139 -j DROP
> 
> If you mean non-contiguous ports, you're looking at multiport:
> 
> iptables -A INPUT -p tcp -m mulitport --dport 21,25,80,110,143,443 -j
> ACCEPT
> 
> Multiport is limited to 15 ports per rule.
> 
> j


