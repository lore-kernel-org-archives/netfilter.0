From: "Joe Haynes" <jhaynes@HERITAGEPROPANE.COM>
Subject: Transitioning from one DNAT gateway to another
Date: Thu, 20 Feb 2003 17:42:31 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <59610.12.227.180.139.1045788151.squirrel@web.heritagepropane.com>
Reply-To: jhaynes@HERITAGEPROPANE.COM
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hello to the list.

I apologize if this subject has been covered
elsewhere, but I have yet to locate instructions
on how to to this (redirections to appropriate
sites would be much appreciated).

Our network is currently attached to the internet via
a wavelan link (with a dedicated IP). We are transitioning
over to a T-1 line that has a new IP address.

What we would like to do is run a gateway off each single
external address and redirect specific ports to a single
internal server (we want to run both while we wait for
DNS updates).

Currently, we redirect port 80 on our external IP to an internal
webserver (also on port 80) using this line:
$IPT -t nat -A PREROUTING -i $INTERNET_DEV -d $INTERNET_IP -p tcp --dport
80 -d $INTERNET_IP -j DNAT --to 192.168.1.5

We'd like to do the same thing off the new gateway that's
linked to the T-1 line.

The problem I've run into is the responses that have come
through the new gateway end up getting sent back out
the old gateway.

Is there a way to redirect packets to the internal server using
PREROUTE and then change the source addresses using POSTROUTE so
the responses from the internal server come back through
the correct gateway?

Thank you,

Joe Haynes
Helena Montana



