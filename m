From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPtables accounting ...
Date: Wed, 13 Nov 2002 15:38:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211131538.gADFcPe32172@vulcan.rissington.net>
References: <1037193855.4553.25.camel@rayw.knowledgefactory.co.za> <1037196520.7181.205.camel@tech004>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037196520.7181.205.camel@tech004>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wednesday 13 November 2002 2:08 pm, Eric Leblond wrote:

> On Wed, 2002-11-13 at 14:24, Raymond Leach wrote:
> > Hi
> >
> > Where do I do iptables accounting?
> >
> > For example: If I have users on a private LAN surfing via a proxy on the
> > firewall and I have web servers in a DMZ also being routed via the
> > firewall, where do I put my accounting rules? In the FORWARD chain, or
> > the INPUT chain, or both?
>
> Not INPUT if you don't have a web server on your firewall.
> FORWARD is a good place.

But he does have a web server on his firewall - he is running a proxy, which 
is both a server and a client in a single application.

Antony.

-- 

Most people have more than the average number of legs.

