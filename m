From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Route packets from an interface to another
Date: Mon, 12 Sep 2005 20:45:47 -0500
Message-ID: <200509122045.48011.rob0@gmx.co.uk>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
	<200509100254.40327.rob0@gmx.co.uk>
	<3609.83.227.27.100.1126511789.squirrel@webmail.antisocial.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3609.83.227.27.100.1126511789.squirrel@webmail.antisocial.nu>
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

On Monday 2005-September-12 02:56, Jonathan wrote:
> Yeah, it works. :-)
> Thank you for your interest in my problem, and your ambition to help
> me. I've never solved it myself. ;-)

My real ambition is always my own education, and I learned some handy 
tricks from this. :) So I'm happy with the result, even though I don't 
really need the static IP at home.

For the record and sake of completeness there's a minor correction:

> >> Started both ends of the tunnel. At home:
> >> # echo 64 tunnel >> /etc/iproute2/rt_tables
> >> # ip rule add from x.y.z.116 table tunnel
> >> # ip route add default via 192.168.6.248 table tunnel
> >> # ip route flush cache
> >> (These should go in an openvpn --up script.)

The first command obviously would NOT belong in a script. You only run 
that once. The latter commands might not always need to be run, 
depending on the state of the system routing tables at the time. You 
might also want a --down script to clean up the routing, or commands 
flushing the tunnel rule and table preceding those in the --up script.

Someone on a truly dynamic IP would want a --float option, and related 
options to enable reestablishment of the tunnel after the IP changes.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

