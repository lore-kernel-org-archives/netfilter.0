From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: DROP or REJECT
Date: Tue, 11 May 2004 18:19:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084313967.2953.27.camel@grendel>
References: <163801c4375e$49bb6d50$49caa8c0@caris.priv>
	 <1084295762.1965.8.camel@grendel>
	 <20040511183825.GH23789@torres.ka0.zugschlus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040511183825.GH23789@torres.ka0.zugschlus.de>
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
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-05-11 at 14:38, Marc Haber wrote:
>
> On Tue, May 11, 2004 at 01:16:03PM -0400, Chris Brenton wrote:
> > Depends. I like rejecting with host-unreachables as it makes it look
> > like you do not have a firewall.
> 
> NACK. If I weren't there, the host unreachable would have the source
> address of the upstream router, and not my own one.

I didn't say "not there", I said "look like there is no firewall". The
type 3 code 1 mimics the response of a typical router.

>  To be truly
> invisible, you'd need to fake the upstream router's IP address,

Not going to work. Firewalk will quickly identify there is a hop on the
wire that is not accounted for. Thus I don't bother shooting for
invisible, just a little bit of decoying and deception. ;-)

HTH,
Chris



