From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Suggestion Needed
Date: Tue, 17 Aug 2004 07:49:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905128B@asimail2.alphanumeric.com>
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

> I  am running Iptables with Squid procy server on my LAN, Just wanted =
to take
> suggestion that is it worth trying to block all the Trojan Ports, I =
came across
> a list which has about 350 Odds ports, my windows 2k machines are too =
vulnerable
> to these trojans?I have norton Corporate Edition, which catches most =
of the vir
> us but still there are times when the network gets very slow?Will this =
be a good
> solution?

instead of trying to keep up with an ever changing list of =
virus/trojan/backdoor ports, your time would be better spent compiling a =
list of port you need to allow out; and allow only those ports, blocking =
all other ports.

> Also what are spoofed packets?I use ethereal to monitor traffic and I =
see a lo
> t of dropped packets from the kernel?Is there a way to stop this?

"spoofed" packets in the context of a firewall generally refer to =
packets arriving on an interface with a source IP that falls in the =
range of another interface--with the hope to make it through your =
firewall rules; i.e.,=20

eth0 (external):  1.2.3.4/24
eth1 (internal):  10.1.1.1/24

a packet arriving on eth0 with a source IP of 10.1.1.100 is "spoofed."  =
in the general sense, a spoofed packet is any packet with a forged =
source address (commonly used in DoS attacks).

if you don't want to see them--don't log them.

-j

