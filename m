From: Jeff Bonner <lunar@comcast.net>
Subject: RE: AIM/ICQ proxy (was: `Real Player Helper in 2.4')
Date: Wed, 12 Jun 2002 09:48:45 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <00d401c21217$df6bd8d0$0200a8c0@JEFF>
References: <20020611190930.3a0940c8.adam@vbfx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020611190930.3a0940c8.adam@vbfx.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org
Cc: 'Adam Young' <adam@vbfx.com>, maxheadroom2323@yahoo.com

On Tue 11 Jun 2002 19:10, Adam Young wrote:

> > Thanks. But, TCP doesn't need a NAT helper because only
> > UDP uses an anonymous port that the server needs to connect
> > back to the client on. The argument is that UDP give better
> > better performace which is why I am trying to get a 2.4 NAT
> > helper for Real Player. Anyone know of anyone else working
> > on the problem? ICQ would is another helper I am looking for.
> > Anyone working on that?
> 
> 	I know as far as ICQ goes, that a helper won't be made 
> (at least to my knowledge) since it is a closed protocol.
> However, I'm sure there is someone out there willing to
> design a helper for all our icq using friends :)

I am not sure what the original context of this message was,
but I assume it asks for help traversing NAT/masquerade, in
which case:

I was able to use ReAIM (http://reaim.sourceforge.net) with
both AOL Instant Messenger and ICQ for file transfers, even
though it's not specifically designed to do the latter.  It's
also supposed to work with MSN, but I have not been able to
verify this yet (it should, though).

FWIW, I broke something in my rules (or elsewhere) and it says
it can't get the external IP anymore -- so it no longer works
for me.  But when it did, it allowed me to transfer files for
the first time with iptables.

I'd also suggest that, where supported by the client, a SOCKS
proxy might serve the same purpose.  Getting the "reference
implementation" from NEC isn't immediate, but it's free for
personal or research use once you're verified as eligible.
Get it at http://www.socks.nec.com/cgi-bin/download.pl.

Or you might go with an alternative like DeleGate, which is at
http://www.delegate.org.  It can also act as a simple origin
server for some protocols.

Still, this is more work than just inserting a module; I, too,
would be interested in kernel support for IM clients.

HTH,

Jeff Bonner



