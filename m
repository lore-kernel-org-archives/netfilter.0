From: Jeremy Jones <jeremy@samnjack.com>
Subject: Re: Bridge question
Date: Fri, 17 Oct 2003 07:37:19 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066397839.29597.6.camel@jccn-crux-linux.djc.state.id.us>
References: <B4B08E56FC7A304EB88DC4B97043921816EFBE@hqmail03.mpr.org>
	 <200310162115.00685.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310162115.00685.Herman@AerospaceSoftware.com>
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

Herman,

in addition to the bridge.sourceforge.net pages, have a look at
ebtables.sourceforge.net.  the howto documentation you'll find at, say,
tldp.org is a little out of date, but at ebtables, you may find more
helpful info.  i've been using the bridging code & netfilter-bridge
kernel patch with 2.4.x for a while now, along with ebtables (analagous
to iptables, but filters at layer 2), and it's doing wonders for me.

good luck,

Jeremy

On Thu, 2003-10-16 at 21:15, Herman wrote:
> Hi everybody,
> 
> This question is not about iptables, but it is closely related, so
somebody 
> might know the answer:
> I am trying to construct a bridge, to filter 802.1q tags and protect a
legacy 
> version 2.2 kernel server, while preserving port to port security on
the LAN, 
> using the VLAN module.
> 
> Can anybody refer me to some documentation on filtering on a bridge
for the 
> 2.4 kernel?
> 
> Regards,


