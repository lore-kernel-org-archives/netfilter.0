From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: FORWARD-ed packet doens't reach POSTROUTING
Date: Mon, 23 Aug 2004 14:20:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512B8@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Fred Gansevles <fred@gansevles.defamilie.nl>, netfilter@lists.netfilter.org

> Hello,
>
> First: I'm not subscribed to this list so please make sure that any =
reply is
> also sent to: fred@gansevles.defamilie.nl
>
> I have a weird problem trying to setup multiple routes on my NAT-box
>
> I have the following setup:
>
>  <local network>  <NAT-box>
>  [192.168.0.0/24]  eth0: 192.168.0.1
>      eth1: <adsl.static.ip>
>      tunl1: <tunnel to remote NAT-box via eth1>
>
> The remote NAT-box can reach a special subnet which I want to connect =
to.
> The special subnet is also reachable thru eth1, but I want the =
packages that
> reach the special subnet to be NAT-ted by the remote NAT-box
>
> On my NAT-box I add the following route:
>
>  ip route add <special.sub.net> dev tunl1
>
> the relevant iptables rules are:
>  iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.0 -o eth1 \
>   -j SNAT --to-source <adsl.static.ip>
>  iptables -t nat -A POSTROUTING -o tunl1 \
>   -j SNAT --to-source <adsl.static.ip>

also of relevance would be your actual FORWARD rules.  as in--provide =
the output of "iptables -vnL FORWARD"

> All messages originating from my NAT-box for the special subnet are =
routed
> through tunl1 and SNAT-ted by the second iptables rule
>
> All messages originating from my local subnet for the special subnet =
are
> routed through tunl1 and *NOT* SNAT-ted by the second iptables rule =
(the
> packages never reach the POSTROUTING chain)
>
> If I remove the special subnet route with:
>
>  ip route del <special.sub.net> dev tunl1
>
> then all messages originating from my local subnet for the special =
subnet are
> routed through eth1 and SNAT-ted by the first iptables rule

something tells me that your FORWARD rules are specifying some =
combination of "-s 192.168.0.0/24" and "-o eth1"

if the packets are getting dropped in the FORWARD chain of the filter =
table; then no, they will never make it to the POSTROUTING chain of the =
nat table.

> All messages originating from my NAT-box for the special subnet are =
directely
> routed through eth1 and *NOT* SNAT-ted (no matching rule for
> SRC=3D<adsl.static.ip>)
>
> Summarizing: When I want to reach the special subnet using the remote =
NAT-box
> I can only do this *ON* the NAT-box and all machines in my local =
subnet cat
> *NOT REACH THE special subnet AT ALL*

the filter rules controlling packets from the NAT box itself are the =
OUTPUT rules; while the filter rules controlling the packets from your =
local subnet are FORWARD rules...something tells me there's a key =
difference between those sets of rules.  without posting your rules; it =
is very difficult to tell you what is wrong.  if you feel so inclined; =
provide the output of:  iptables -vnL && iptables -t nat -vnL && =
iptables -t mangle -vnL

-j

