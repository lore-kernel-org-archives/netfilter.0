From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Transitioning from one DNAT gateway to another
Date: Fri, 21 Feb 2003 01:58:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302210158.01203.netfilter@newkirk.us>
References: <59610.12.227.180.139.1045788151.squirrel@web.heritagepropane.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: jhaynes@HERITAGEPROPANE.COM

On Thursday 20 February 2003 07:42 pm, Joe Haynes wrote:
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

You should do this in routing.  Read up at=20
http://lartc.org/howto/lartc.rpdb.multiple-links.html#AEN266 which is=20
the specific part of the Linux Advanced Routing and Traffic Control=20
howto that deals with "Split Access", where you have incoming requests=20
on two different links that have to be answered back out the same link.

Essentially you set up two default routes each in it's own table, and set=
=20
routing rules that route traffic with a particular source IP to use the=20
appropriate routing table.  Traffic inbound gets DNATted to the server,=20
and when it returns gets unDNATted to present source IP matching the=20
original destination IP of the request, then routing takes over and=20
sends it out the appropriate link.

j

> Thank you,
>
> Joe Haynes
> Helena Montana


