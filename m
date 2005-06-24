From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: Firewall feature recommendation
Date: Fri, 24 Jun 2005 16:12:01 +0200
Message-ID: <29273.9371922382$1119621989@news.gmane.org>
References: <Pine.GSO.4.58.0506241002340.17433@queeg.cs.rit.edu>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0506241002340.17433@queeg.cs.rit.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I doubt that he is rewriting DNS requests with HTTP. He is using his
nameserver to tell the clients that the ie. *.gmail.com -> some_local_IP and
when the real HTTP request is being sent out - it is being sent out to
some_local_IP ... it is like entering fix IP adresses in /etc/hosts file..

Regards,

Edvin Seferovic

PS: it would be interesting which domains you are poisoning :) a zone file
would be great !

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Carl Holtje
;021;vcsg6;
Sent: Freitag, 24. Juni 2005 16:05
To: /dev/rob0
Cc: netfilter@lists.netfilter.org
Subject: Re: Firewall feature recommendation

On Fri, 24 Jun 2005, /dev/rob0 wrote:

> On Friday 24 June 2005 08:36, Carl Holtje ;021;vcsg6; wrote:
> > > > - Black lists for inbound & outbound traffic
> > >
> > > We don't do much of this. We *do* use DNS poisoning for certain
> > > known "ratware"/virus domains such as gator.com.
> >
> > Sorry to jump in half-way through, but how do you do this?
> >
> > I'm looking for a solution better than editing /etc/hosts that I can
> > apply to a small network..
>
> BIND 9, transparent DNS proxying for clients to force them into our
> local nameserver, where we have a simple null zone file which is loaded
> as master for each blocked domain. It points a wildcard "A" at an
> internal IP.

Would you be so kind as to post a randomly-selected zone file for our
enjoyment?

> Among other things, that internal machine runs a Web server. When we
> first started doing this, its apache logs were inundated with 404's as
> the now-stranded spyware attempted to phone home.

So you take a DNS (port 53) request and re-write it as HTTP (port 80)??

Wouldn't it just be easier to reply to the DNS request with a "host not
found"? Or where you trying to log the requests to find the infected
hosts..?

Thanks!

Carl

- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."



