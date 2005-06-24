From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall feature recommendation
Date: Fri, 24 Jun 2005 08:45:37 -0500
Message-ID: <200506240845.37417.rob0@gmx.co.uk>
References: <fad9d48405062403562537f546@mail.gmail.com>
	<200506240826.14769.rob0@gmx.co.uk>
	<Pine.GSO.4.58.0506240935200.17433@queeg.cs.rit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0506240935200.17433@queeg.cs.rit.edu>
Content-Disposition: inline
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

On Friday 24 June 2005 08:36, Carl Holtje ;021;vcsg6; wrote:
> > > - Black lists for inbound & outbound traffic
> >
> > We don't do much of this. We *do* use DNS poisoning for certain
> > known "ratware"/virus domains such as gator.com.
>
> Sorry to jump in half-way through, but how do you do this?
>
> I'm looking for a solution better than editing /etc/hosts that I can
> apply to a small network..

BIND 9, transparent DNS proxying for clients to force them into our 
local nameserver, where we have a simple null zone file which is loaded 
as master for each blocked domain. It points a wildcard "A" at an 
internal IP.

Among other things, that internal machine runs a Web server. When we 
first started doing this, its apache logs were inundated with 404's as 
the now-stranded spyware attempted to phone home.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

