From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables script and ports to access intranet from internet..
Date: Thu, 16 Dec 2004 08:14:34 -0500
Message-ID: <20041216131434.GA22631@bender.817west.com>
References: <006601c4e27e$2d75fb80$0400a8c0@beta03>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006601c4e27e$2d75fb80$0400a8c0@beta03>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Dec 15, 2004 at 05:15:02AM -0300, Guillermo Javier Nardoni
wrote:
> iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port
> 3128

this is your problem.  if your intent is to redirect internal users to a
transparent proxy--specify the internal interface:

  iptables -t nat -A PREROUTING -i $IF_LAN -p TCP --dport 80 \
    -j REDIRECT --to-port 3128

without specifying the internal interface--your external port 80
requests will be redirected to the proxy as well (this may or may not be
what you want--sounds like it's not).

> #iptables -A INPUT -p tcp --dport 80 -i $IF_WLAN -j AACEPT

fix the typo and uncomment that to allow access to port 80 on the
firewall from the outside:

  iptables -A INPUT -p tcp --dport 80 -i $IF_WLAN -j ACCEPT

> iptables -A INPUT -i ppp0 -j ACCEPT

you really think that's a good idea?

> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
>
> iptables -A INPUT -p tcp --dport 21 -j ACCEPT
>
> iptables -A INPUT -p tcp --dport 23 -j ACCEPT
>
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT

a lot of this seems repetitive...

> echo " Logging & Dropping..."
>
> iptables -A INPUT -p tcp -j LOG -m limit --log-prefix "FILTER
> TCP-BAD-IN:"
>
> iptables -A INPUT -p tcp -j DROP
>
> iptables -A INPUT -p udp -j LOG -m limit --log-prefix "FILTER
> UDP-BAD-IN:"
>
> iptables -A INPUT -p udp -j DROP
>
> iptables -A INPUT -j LOG -m limit --log-prefix "FILTER
> UNKNOWN-BAD-IN:"
>
> iptables -A INPUT -j DROP

since you've already accepted everything--you won't be doing much
dropping here...

-j

--
"Call this an unfair generalization if you must, but old people are
 no good at everything."
        --The Simpsons

