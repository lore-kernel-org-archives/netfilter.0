From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: netfilter and iproute2
Date: Thu, 19 Aug 2004 13:44:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512AC@asimail2.alphanumeric.com>
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

> # iptables -A PREROUTING -i eth1 -s 213.2.4.37 -t mangle -j MARK =
--set-mark 50
> # ip rule add fwmark 50 table 100
>
> Packets from 213.2.4.37 continue to have their route selected by BGP / =
zebra
> just as everything else does.
>
> I know the packets are getting into the right chain because of:
>
> # iptables -t mangle -vnL
> Chain PREROUTING (policy ACCEPT 962K packets, 473M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 27602   24M MARK       all  --  eth1   *       213.2.4.37           =
0.0.0.0/0
> MARK set 0x32
>
> .. and yet the rules are there:
>
> # ip rule ls
> 0:      from all lookup local
> 32764:  from all fwmark       50 lookup 100
> 32765:  from 213.2.4.33 lookup 100
> 32766:  from all lookup main
> 32767:  from all lookup default
>
> Any ideas? :)

yeah--your marks don't match.  the output of "iptables -t mangle -vnL" =
shows you a mark of 0x32 (which is what 50 becomes in hex), whereas your =
"ip rule" is looking for a mark of "50."  change one of them.

decimal 50 is 80 in hex--so leaving your "ip rule" alone, your iptables =
rule should be:

  iptables -A PREROUTING -i eth1 -s 213.2.4.37 -t mangle -j MARK =
--set-mark 80

or change your "ip rule" to look for fwmark 32.

-j

