From: Torsten Luettgert <t.luettgert@pressestimmen.de>
Subject: RE: A simple question
Date: Thu, 19 Aug 2004 10:39:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092904784.9327.11.camel@scaramouche>
References: <SERVER7QYx3G5aYY61L00000074@server7.bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <SERVER7QYx3G5aYY61L00000074@server7.bandwidthco.com>
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

On Don, 2004-08-19 at 06:18, Mark E. Donaldson wrote:
> As you might expect, it is quite easy to DOS the firewall itself
> when OUTPUT is set to DROP. And that is not a real good idea.

Please elaborate - why is it easy to DOS the firewall if the output
policy is DROP? You don't mean icmp/source-quench not getting
delivered or something?

> However, having said that, close scrutiny must be paid to what you
> allow out of the firewall and the necessary rules must be in place.

...which is why I personally use DROP as default policy for all
chains and explicitly allow everything I think necessary :-)

The only exception is in the mangle table, where I use ACCEPT
policies and just filter out the obvious spoofs, unclean frames
etc.

Greetings,
Torsten


