From: <support@sjobeck.com>
Subject: nat, dns, public, private, port forwarding,
	iptables: cant see sites on LAN with public DNS
Date: Mon, 24 Jul 2006 22:55:32 -0700
Message-ID: <B74511B06DDF514399346C759139F03B8DF163@roma.sjobeck.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Dear All,

First time poster, go easy on me. I'm an IOS convert.

I just replaced my Cisco 1750 with a DSL WIC in it for a CentOS 4.3
machine with a Sangoma DSL card, and it works great, and we like it a
lot. There is one side-effect of the difference between the way that IOS
handled the static NAT mapping and the way that we are currently
(iptables) configured for same.=20

In IOS, the traffic came in the public IP, was mapped to the private IP,
and then hit that box. Same was true for out-bound, traffic came from
the box as private IP, to router, spun around in to public IP, and out
to the WAN, as that public IP.=20

Now my traffic hits the WAN interface of iptables, is mapped to the
private IP, hits the box on the LAN. But for traffic originating from
the box destained to the WAN, it appears to the WAN as just any other
box coming out of the NAT pool, and appears to come from the gateway's
WAN interface. It does not appear to come from its public IP.

So, here is the part that is "interesting trafic" to my discussion.=20

Question 1: Do I care? Do I want those boxes that are mapped to public
IP's to appear to the WAN to be actually coming from those public IP's?

But, most importantly, is question 2:

I can not see the websites that are hosted on this webserver on my LAN,
since those websites are for domains that have public DNS (and no split
horizon DNS)(we don't want split horizon DNS). Something is breaking
when my host tries to see these sites ..... it gets DNS from the WAN,
then tries to come back in through the NAT/router/iptables/port
forwarder/gateway machine to try to see the webserver, on my LAN, at its
private (RFC1918) address. Is there a way to elegantly resolve this? I
do not want to run internal DNS for these domains. I can not add 20
entries to all our laptops then remove those same entries when we leave
the LAN. (I did test adding entries to HOSTS file and sites come right
up)

Any flashes of brilliance from you brilliant people on this great list
will be so very much appreciated.

Thanks very much.

Peace.

Jason Sjobeck

www.sjobeck.com


