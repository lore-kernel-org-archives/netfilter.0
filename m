From: Arthur Meyer <arthur.meyer@tbz.ch>
Subject: Re: Transparent Remote Proxy Server
Date: Tue, 28 Sep 2004 08:38:45 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409280838.45644.arthur.meyer@tbz.ch>
References: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>
	<41586A3A.5060901@pbl.ca>
	<1096313839.16814.63.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096313839.16814.63.camel@wolfpack.ljm.dom>
Content-Disposition: inline
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

Am Montag, 27. September 2004 21:37 schrieb Jason Opperisano:
> On Mon, 2004-09-27 at 15:30, Aleksandar Milivojevic wrote:
> > As Jason wrote, REDIRECT will also rewrite destination IP address.
> > Squid is using woodoo magic to find out what was the original
> > destination address before rewriting (that's why you need to also change
> > Squid configuration).  Squid can do that only if it runs on the same box
> > where the address was rewritten.  Even the woodoo magic has limitations
> > ;-)
> >
> > Daniel's document is using nat table for both filtering and NATing,
> > which is the approach I don't particulary like.  Plus the rules are very
> > open (made to demonstrate the concept, not to be used on a real
> > firewall).
> >
> > Anyhow, what you might try out is a bit of debugging to see what is
> > going on the wire.  Your tcpdump from wum shows that it got SYN packet,
> > and that it sent out SYN ACK.  I don't see third packet with ACK going
> > back to wum, so it might be that it got dropped somewhere.  My next step
> > would be to move to tor.  I'd guess if you run tcpdump on tor's
> > interface to internal network, you'd see only SYN packet, and not SYN
> > ACK.  And if you run it on interface wheer wum is connected that you
> > would see both SYN and SYN ACK.  If that is the case, than you might
> > have something else on tor that is causing it to drop return packets
> > from wum.
>
> keep in mind that a side-effect of the REDIRECT "magic" is that the SYN
> does not go to; nor does the SYN-ACK come from, wum's IP address (as was
> evident from the tcpdump snippet provided).
>
> with the REDIRECT target, wum will pretend to be the destination web
> server from the perspective of the client and tor.
>
> all this being said--i couldn't tell from the OP why things weren't
> working.
>
> tcpdump anywhere and everywhere and you'll find the culprit.
>
> -j

If you are using squid and netfilter to setup a firewall, you need to modify 
configure and squid.conf accordingly.
Compile squid mit configure parameter --enable-linux-netfilter.
Set then in the squid.conf die following statements
httpd_accel_host to virtual
httpd_accel_with_proxy to on
httpd_accel_uses_host_header to on

With these settings you can use nat.
Arthur Meyer
TBZ

