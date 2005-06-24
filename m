From: "Carl Holtje ;021;vcsg6;" <cwh0803@cs.rit.edu>
Subject: Re: Firewall feature recommendation
Date: Fri, 24 Jun 2005 11:20:31 -0400 (EDT)
Message-ID: <Pine.GSO.4.58.0506241118140.17433@queeg.cs.rit.edu>
References: <fad9d48405062403562537f546@mail.gmail.com>
	<200506240932.08470.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0506241635090.30646@yvahk01.tjqt.qr>
	<200506240953.06487.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506240953.06487.rob0@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

On Fri, 24 Jun 2005, /dev/rob0 wrote:

> On Friday 24 June 2005 09:37, Jan Engelhardt wrote:
> > >Most if not all of the listed domains were personally researched by
> > > me. That's the weakness of this, though: it's impossible to keep
> > > ahead of the spammers and other ratware peddlers in this arms race.
> >
> > Just look into the named and/or squid logs and see what users (or
> > programs acting on their behalf) request.
>
> Yes, that would be the methodology, but it should be done in a
> controlled environment. Some, and now perhaps most, of our squid
> traffic is legitimate.
>
> What is needed is a network "clean room". A fresh Windows install with
> monitored outbound access. Using Outhouse Distress, activate a known
> virus email, watch what it does. Using Internet Exploder, visit a known
> malicious IIS site, and see the results.

Heck.. just put the windows box behind a NAT-ting linux box.. just log the
NEW connections, and adjust from there.. probably be more likely than
having a non-infected windows box.. :)

Thanks for you insight!

Carl
- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."

