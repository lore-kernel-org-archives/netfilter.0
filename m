From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall feature recommendation
Date: Fri, 24 Jun 2005 09:12:08 -0500
Message-ID: <200506240912.08598.rob0@gmx.co.uk>
References: <fad9d48405062403562537f546@mail.gmail.com>
	<200506240845.37417.rob0@gmx.co.uk>
	<Pine.GSO.4.58.0506241002340.17433@queeg.cs.rit.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0506241002340.17433@queeg.cs.rit.edu>
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

On Friday 24 June 2005 09:04, Carl Holtje ;021;vcsg6; wrote:
> > BIND 9, transparent DNS proxying for clients to force them into our
> > local nameserver, where we have a simple null zone file which is
> > loaded as master for each blocked domain. It points a wildcard "A"
> > at an internal IP.
>
> Would you be so kind as to post a randomly-selected zone file for our
> enjoyment?

[file: null.zone]
$TTL 86400      ; one day

@       IN      SOA     ns.local.lan.   hostmaster.local.lan. (
                        2004081000      ; serial number YYMMDDNN
                        28800           ; refresh  8 hours
                        7200            ; retry    2 hours
                        864000          ; expire  10 days
                        86400 )         ; min ttl  1 day

                        NS      ns.local.lan.
                        A       192.168.40.1

*               IN      A       192.168.40.1
[end file]

> > Among other things, that internal machine runs a Web server. When
> > we first started doing this, its apache logs were inundated with
> > 404's as the now-stranded spyware attempted to phone home.
>
> So you take a DNS (port 53) request and re-write it as HTTP (port
> 80)??

No. The spyware does a DNS lookup and then HTTP request to the IP 
returned.

> Wouldn't it just be easier to reply to the DNS request with a "host
> not found"? Or where you trying to log the requests to find the
> infected hosts..?

When I first did this I had no idea what was going to happen. :) Later 
on I decided to stick with the internal IP for that reason, yes, it 
does help us identify infected hosts.

DNS logging would have accomplished the same thing.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

