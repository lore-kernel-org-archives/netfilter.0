From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: DNAT confusion
Date: Thu, 31 Jul 2003 19:00:38 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0307311852060.10932@oskar-lap.agatha>
References: <3F28F02A.3070705@belfordhk.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F28F02A.3070705@belfordhk.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cc <cc@belfordhk.com>
Cc: Netfilter Group <netfilter@lists.netfilter.org>

Hi all,

Just thought I'd let people know that I am aware of this fault in the
tutorial, and it has been fixed. Unfortunately, I won't be releasing
it (together with a few other things) for quite some time yet.

I am working on 4-5 (possibly 6) new chapters, and want to finish them all
up before I release the next version of the tutorial.

After that, I am considering to updating the whole thing to 2.6 standards,
but I'll save that for then. I may possibly fork the document into two
separate entities, one for 2.4 kernels and one for 2.6 kernels.

Have a nice week (or month, depending on when you will see me next). I
will be leaving for CERTconf this sunday, and I will be attending the
netfilter workshop in budapest as well.

Anyways... see you all around :)

On Thu, 31 Jul 2003, cc wrote:

> Hi,
>
> I should've asked this question in my previous post.  I'm using
> Linux 2.4.20  (should be patching it to 21 soon).
>
> Right now, I have :
>
> $IPTABLES -t nat -A PREROUTING -p tcp -d $EXT_IP \
>           --dport 80 -j DNAT --to $HTTP_IP
>
> $IPTABLES -A FORWARD -p tcp --dport 80 -j ACCEPT
>
> $IPTABLES -t nat -A POSTROUTING -p tcp -d $HTTP_IP --dport 80 \
>            -j SNAT --to-source $FIREWAL_INT_IP
>
> Right now, I can access the Internet from within the LAN.
> The problem is when I try to use the FQDN (www.mydomain.net)
> to access my webserver.  I know that I've hit the exact
> hurdle as mentioned within the iptables tutorial.  But
> the problem is, I have included the tutorial's suggestion of
> adding that POSTROUTING rule in.
>
> I had it working before, but the problem i had with
> it working (*grin*) was that the web server wasn't logging
> the EXT_IP's IP, but rather my firewall's internal IP.
>
> I don't remember how I got it working before, so I'm
> stuck with a dilemna.  Should I allow FQDN references
> for local users (and having the web server log packets
> originating from the firewall) or should I disallow FQDN
> (and having the webserver log the actual IPs).
>
> Is there a way for me to have the best of both worlds?
>
> Now I'm not sure if the last remaining 'rule' given in
> the DNAT section is the clincher, but since I'm getting
> an invalid argument (and still am searching for the
> pom patch for it), I'm not able to use that third rule.
>
> Any help appreciated
>
> Edmund
>
> --
> email: cc@belfordhk.com  | "A man who knows not where he goes,
>                          |  knows not when he arrives."
>                          |                - Anon
>
>
>
> ** All information contained in this email is strictly     **
> ** confidential and may be used by the intended receipient **
> ** only.                                                   **
>
>

----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net

