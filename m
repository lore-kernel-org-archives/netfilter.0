From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: rules suggestion
Date: Thu, 22 Jul 2004 16:31:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511E0@asimail2.alphanumeric.com>
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
To: netfilter@lists.netfilter.org

> $ipt -t filter -A OUTPUT -o $extif_name -p udp -d 192.168.1.255 =
--dport
> 137:139 -j DROP  #NETBIOS
>
> $ipt -t filter -A INPUT -i $extif_name -p udp -d 192.168.1.255 --dport
> 137:139 -j DROP  #NETBIOS
>
> $ipt -t filter -A FORWARD -i $extif_name -p udp -d 192.168.1.255 =
--dport
> 137:139 -j DROP  #NETBIOS
>
> $ipt -t filter -A FORWARD -o $extif_name -p udp -d 192.168.1.255 =
--dport
> 137:139 -j DROP  #NETBIOS

all these rules block are UDP 137-139 to the specific broadcast address =
on your internal LAN.  while this is nice for tidying up your logs; i =
*believe* the original poster was looking to keep netbios-related =
traffic from leaking out to the internet.  in which case, my =
recommendation is:

-A FORWARD -o $external_if -p udp --dport 137:138 -j DROP
-A FORWARD -o $external_if -p tcp --dport 139 -j DROP
-A FORWARD -o $external_if -p tcp --dport 445 -j DROP

two notes:

all the examples are using "-A."  keep in mind that if you already have =
some kind of "allow everything on the inside out" rule, these will never =
get matched.  in such a case, you would need to "-I FORWARD x" where x =
=3D the numnber of the "allow everything out" rule.

it gets mentioned all the time on this list, but hey--you can never get =
too much of a good thing, right:

the best way to design your firewall rules is to start with a default =
drop, and then just allow the specific traffic that you need.  it may =
take slightly longer to get it setup initially, but requires much less =
care & feeding in the long run.

-j=20

