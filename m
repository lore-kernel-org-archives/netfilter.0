From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Problem configuring masquerading Gateway on RedHat 9.0...
Date: Fri, 6 Aug 2004 08:31:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051247@asimail2.alphanumeric.com>
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

> #iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> and
> #echo 1 > /proc/sys/net/ipv4/ip_forward

are those the only commands you've issued?  do you have a script that is =
creating additional rules that you're not including here?  the output of =
"iptables -vnL; iptables -t nat -vnL; iptables -t mangle -vnL" would be =
helpful.

> The problem is I can ping or telnet a remote host from
> an internal network but browsers say 'unknown host'
> when I try to load a remote site.

are you pinging/telnetting by IP address, and then trying to load a web =
page via FQDN?  if so, my guess would be that your problem is DNS =
resolution.

-j

