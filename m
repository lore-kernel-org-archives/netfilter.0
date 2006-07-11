From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: "stand-alone" web server
Date: Tue, 11 Jul 2006 16:19:02 -0500
Message-ID: <44B415C6.8040703@riverviewtech.net>
References: <c39d9d00714b2.714b2c39d9d00@southeast.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c39d9d00714b2.714b2c39d9d00@southeast.rr.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

KSCOTT9@triad.rr.com wrote:
> I am trying to set up a "stand-alone" internet lab environment where my
> web server will be on the internet side of a router serving up a
> training website. The clients will only be able to access those web
> pages, not the "Real" internet. It would best if users were routed to
> that web page regardless of whatever internet address they entered
> (except for server management screens). I'm thinking the following:

You may run in to a problem with your web server serving pages like you are wanting it to.  See below.

> I'm think maybe appropriate entry(s) in iptables will do this but I am
> not quite sure how to proceed. I think I need something like:
> 
> iptables -A PREROUTING  -p tcp -dport 80 -j REDIRECT --to-ports 80     
>   # web server
> iptables -A PREROUTING  -p tcp -dport 8081 -j REDIRECT --to-ports 8081 
>   # mgmt server
> The two server need to be configured to answer on those ports 

You may need to SNAT as well.  I have done this before, but it has been a while and I don't recall if I had to SNAT at all.  Basically the reason you would need to SNAT would be because the client computers sent a request to some server on the internet.  Your firewall redirected them by altering the target IP of the packet to be your local web server.  So your local web server will respond directly to your clients.  Your clients will not know who or why this person is offering them information that they did not ask for.  If you SNAT your local web server will send the traffic back to your firewall (even if it's the same system) which will un-DNAT the traffic back to your clients.  Your clients will now think that they got a reply from the server that they asked for data from.

You will also need to configure your web server's default site and page to be the page that you want people to see when they access what ever it is they access.  I.e. www.cnn.com and www.msn.com will really bring back your local default site and pages.  I would also recommend that you force your server to return a 200 series code even on the 404 page.  You will get a 404 when you ask for http://www.cnn.com/<bla>/<bla>/<bla>.<ext> because your server does not have that page to serve.  The 200 ""error code will help most browsers render what you want them to verses a 404 error page.  I would also recommend that you set the page expire time to be 1 second, or there abouts.  This will prevent client systems from caching your redirect page with a URL that it should not do so with.

By the way, this is really much easier than it sounds.



Grant. . . .


