From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: dns server
Date: Sat, 8 Jun 2002 10:58:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020608105857.I2090@funkyjesus.org>
References: <1420507267.20020606152231@gmx.de> <1023372279.8475.27.camel@billy.demon.nl>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1023372279.8475.27.camel@billy.demon.nl>; from tonni@billy.demon.nl on Thu, Jun 06, 2002 at 04:04:38PM +0200
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
Content-Transfer-Encoding: 7bit
To: I <netfilter@lists.samba.org>

On Thu, Jun 06, 2002 at 04:04:38PM +0200, Tony Earnshaw wrote:
> tor, 2002-06-06 kl. 15:22 skrev Corin Langosch:

<snip>

> It depends what you want to do with it. And what DNS software you're
> running. I.e., if it's BIND, you can do more with BIND 9 than you can
> with BIND 8, more with BIND 8 than with BIND4.
> 
> Many security people might say that if you're running BIND 4 or 8, then
> you shouldn't be. Some of them again might say that you should be
> running BIND 9.2.

I believe that the latest BIND 8.something is still OK, and version 8 is
being maintained as far as security patches go.

As for the rest of the thread, you're best restricting that kind of access
using named.conf as the problem is at layer 7 - the BIND application, not
layer 3 - where netfilter mostly lives.


-- 
FunkyJesus System Administration Team


