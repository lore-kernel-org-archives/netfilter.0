From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: VPN?
Date: Fri, 13 Aug 2004 11:16:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905127E@asimail2.alphanumeric.com>
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

> I want to pass pptp traffic through my firewall. For that I added,
> iptables -A FORWARD -s 192.168.0.0/255.255.0.0 --protocol 47 -j
> ACCEPT
> in my firewall list plus,
> iptables -A FORWARD -s 192.168.0.0/255.255.0.0 -p udp -m udp --dport =
1723 -j A
CCEPT
> iptables -A FORWARD -s 192.168.0.0/255.255.0.0 -p tcp -m tcp --dport =
1723 -j A
CCEPT
> But my clients cannot connect to it. It gives connection timed out.
> What must be the error?
> My old firewall (before I made changes given above is at),
> http://payal.staticky.com/tables.txt

are you NAT-ing the connections from 192.168.0.0/24 to the PPTP server?  =
according to "-A POSTROUTING -s 192.168.0.0/255.255.0.0 -j MASQUERADE" =
in your posted rules, you are.

you need the pptp-conntrack-nat from POM for this to work.

-j

