From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Routing Public IPs over NAT Address Space
Date: Mon, 14 Jul 2003 17:23:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DF2@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: "A. Clausen" <techlists@alberni.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>


>However, we've had some inquiries about a few businesses who want
actual
>subnets (for mail servers, web servers, or whatever).  The problem with
NAT
>is that I can't guarantee there will be a helper for every protocol.
What I
>was wondering was whether I could allocate a subnet and get it across
the
>private (NAT) network to their router.  I have my doubts as to whether
this
>is possible, but not being an expert I thought I'd ask.


1. Add the ip address block to the internet interface, and make sure
that the internet routes to your firewall/gateway for those IP's in the
netblock given to your customer.

2. Add a route that allows the firewall to find your customer's network.
This can look something like:
route add <business_net> mask <business_msk> <gw to business customer>
-i <iface to business customer>

3. Add passthrough-non-nat rules to allow the traffic through to the
customer's machines with no NAT enabled. This could look like:

iptables -A FORWARD --source 0.0.0.0/0
--destination <business_net>/<business_msk> -j ACCEPT

iptables -A FORWARD --source <business_net>/<business_msk>
--destination 0.0.0.0/0 -j ACCEPT

4. Their subnet has to have this firewall as their default router or the
system will break

5. This limited set of rules gives no protection for your customers. Any
filtering is turned off. If you would like that type of service, then
just change the -j ACCEPT to -j INETTOBUSINESSABC or something then
write a filter list in the INETTOBUSINESSABC chain. It is very easy to
keep track of everything this way.

6. Just make sure that the net/mask is just assigned to your customer.
Otherwise, the system could bleed into existing systems.

7. This system forces you to give the public IP addresses to your
customer. You may or may not like this. It is probably the easiest way
for you though. If you give them private IP's, you are pretty much
enslaved with the NAT/Helper mentality, which I can imagine would bring
much of the hurt you have considered.


PS: I don't think this is a normal iptables function. Yeah, some people
ask newbie questions, but since this IS the frontline iptables group, we
should be the ones taking this on the chin. If there was an ipt-newbs
mailing list then maybe you should put them in their place (that ml),
but since there ARE many people that ask redundant questions please just
live with it, or better, politely send a form letter response of common
howtos and FAQ's.



