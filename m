From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: iptables and device aliases
Date: Wed, 18 Aug 2004 15:41:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512A5@asimail2.alphanumeric.com>
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

> I will still need to define the device alias, correct?
> Thanks
> Dave

yeah--sorta...the term "device alias" is misleading--it's an IP alias.  =
full example...  today you have an external interface on your firewall; =
eth0, with IP address 1.2.3.4/24.  you currently redirect port 443 to =
10.1.1.100 port 8443, like so:

  -A PREROUTING -i eth0 -p tcp --dport 443 \
     -j DNAT --to-destination 10.1.1.100:8443

you now want to start redirecting port 443 on IP 1.2.3.5 to 10.1.1.101 =
on port 8443 (in addition to the above):

  ip address add 1.2.3.5 dev eth0

  -A PREROUTING -i eth0 -p tcp -d 1.2.3.4 --dport 443 \
     -j DNAT --to-destination 10.1.1.100:8443

  -A PREROUTING -i eth0 -p tcp -d 1.2.3.5 --dport 443 \
     -j DNAT --to-destination 10.1.1.101:8443

since the inbound interface is "eth0" whether the destination IP is .4 =
or .5--you need to distinguish between the two with "-d x.x.x.x" so the =
traffic gets redirected correctly.

make sense?

-j

