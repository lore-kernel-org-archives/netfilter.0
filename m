From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: dhcp
Date: Tue, 17 Aug 2004 08:10:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905128C@asimail2.alphanumeric.com>
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

> i have a strange problem, not sure whats going on. i
> have  a dhcp3-server on a machine. the server is serves
> to eth1 and eth2 addresses. now i would like to block
> the server (so that a client cant send a request
> anymore).
>
> but so far i dont even manage to block the dhcprequest
> with the default policy drop.
>
> i have all 3 tables all chains drop
> i dont have any rule
>
> but when i do tcpdump i can see the following
>
> 192.168.5.30 bootpc > 192.168.5.1 bootps ......
> 192.168.5.1 bootps > 192.168.5.30.bootpc ....
>
> what is going on? does dhcp-request goes somehow over
> layer2?

depends on the dhcpd implementation.  some dhcpd's operate at the BPF =
layer (layer 2-ish), so the packets will be received by the daemon =
before netfilter has a chance to block them [*].

if you want to block access to it--why not just shut the daemon down?  =
if you're trying to allow dhcp to a few known clients and block all =
other access--try the "deny unknown clients" option in dhcpd.conf.

[*] you could also play with "-m mac --mac-source [!] XX:XX:XX:XX:XX:XX" =
in netfilter to see if that helps you.

-j

