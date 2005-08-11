From: "Joris Dobbelsteen" <joris.dobbelsteen@mail.com>
Subject: RE: Use IP connection tracking only for input and output chains
Date: Thu, 11 Aug 2005 19:50:48 +0200
Message-ID: <B9833546B2643B43A56C4E962E13174602A98C@nehemiah.joris2k.local>
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

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org=20
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
>Sent: donderdag, 11 augustus 2005 19:05
>To: netfilter@lists.netfilter.org
>Subject: Re: Use IP connection tracking only for input and=20
>output chains
>
>On Thursday 2005-August-11 06:45, Joris Dobbelsteen wrote:
>> I've a question whether it is a supported configuration where the=20
>> connection tracking module is solely used for traffic local to the
>
>I believe the "raw" table can be used to bypass connection=20
>tracking. I don't know whether or not that is available in OpenWRT.

Could you provide more specific information on how to archieve this? A
tutorial (or a discussion about this) would be very nice. If you have a
good clue where I can find them it would save me a=20
lot of time getting through a lot of information.

Did see something here:
<http://iptables.gds.tuwien.ac.at/patch-o-matic/pom-submitted.html>, but
looks like OpenWRT doesn't support that:

-- /proc/net/ip_tables_names
nat
mangle
filter
-- /proc/net/ip_tables_targets
TCPMMS
LOG
MASQUERADE
MARK
REJECT
DNAT
SNAT

I'm not looking forward to recompiling OpenWRT to include this
feature...

- Joris Dobbelsteen



--- Offtopic -----------------------------------------------------

>Do you like OpenWRT? I have Sveasoft on mine but I am not=20
>comfortable with it because of the GPL violations and the=20
>comments I have seen about the Sveasoft maintainer. It's nice=20
>to have Linksys-style GUI control, but I am quite capable of=20
>CLI management too.

OpenWRT is perfectly capable to sqeeze every feature out of the box. I
modified it quit a lot form the original layout. I don't run a web
interface, I believe there are available though, administration uses
SSH.
Rather the device acts as a router (not a masquarade/nat gateway). I'm
running dhcp-fwd and djbdns (caching dns server, dnsmasq didn't do
because it includes dhcp I don't want) on the box. It runs quagga with
OSPFv2 (faster reconfiguration than RIP). The internal switch can be
easily altered for a different network setup (vlans). It runs WPA/WPA2
with Radius server.
Just check out http://openwrt.org/, look for the documentation how to
get started.

Basically you get a plain Linux with some basic functionality for
wireless, network, adsl links, netfilter/iptables and dnsmasq. You can
latter add/remove packages as desired.

The box lacks (just like most of linux) any good mechanism to enforce a
network policy, globally. I implemented my own insecure method of doing
so (I know how to secure this, but it requires some work to be done).
Seems like I really like Microsoft ISA Server for this though...

