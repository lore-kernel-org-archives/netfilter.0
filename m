From: "Joe Haynes" <jhaynes@heritagepropane.com>
Subject: Re: Transitioning from one DNAT gateway to another
Date: Thu, 20 Feb 2003 22:08:34 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1783.192.168.1.7.1045804114.squirrel@web.heritagepropane.com>
References: <59610.12.227.180.139.1045788151.squirrel@web.heritagepropane.com>
Reply-To: jhaynes@heritagepropane.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <59610.12.227.180.139.1045788151.squirrel@web.heritagepropane.com>
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
To: netfilter@lists.netfilter.org

I think I answered my own question. I was able to SNAT
on connections that were directed toward an internal
server using this command:

iptables -t nat -A POSTROUTING -o $DMZ_DEV -j SNAT --to $DMZ_IP

So, when a packet for port 80 comes into the firewall,
it is redirected toward a server in the DMZ. Then, SNAT
is used so the responses back from the web server come back
out through the current gateway instead of the gateway
used by the DMZ server.

I apologize for finding out on my own what should have been
obvious from the start.

-jph


Joe Haynes said:
> Hello to the list.
>
> I apologize if this subject has been covered
> elsewhere, but I have yet to locate instructions
> on how to to this (redirections to appropriate
> sites would be much appreciated).
>
> Our network is currently attached to the internet via
> a wavelan link (with a dedicated IP). We are transitioning
> over to a T-1 line that has a new IP address.
>
> What we would like to do is run a gateway off each single
> external address and redirect specific ports to a single
> internal server (we want to run both while we wait for
> DNS updates).
>
> Currently, we redirect port 80 on our external IP to an internal
> webserver (also on port 80) using this line:
> $IPT -t nat -A PREROUTING -i $INTERNET_DEV -d $INTERNET_IP -p tcp
> --dport 80 -d $INTERNET_IP -j DNAT --to 192.168.1.5
>
> We'd like to do the same thing off the new gateway that's
> linked to the T-1 line.
>
> The problem I've run into is the responses that have come
> through the new gateway end up getting sent back out
> the old gateway.
>
> Is there a way to redirect packets to the internal server using
> PREROUTE and then change the source addresses using POSTROUTE so
> the responses from the internal server come back through
> the correct gateway?
>
> Thank you,
>
> Joe Haynes
> Helena Montana



