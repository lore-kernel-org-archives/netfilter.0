From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: ADSL setup?
Date: Fri, 29 Nov 2002 19:04:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211291904.37120.netfilter@newkirk.us>
References: <000801c297ff$9a6af270$0a0110ac@nebuchadnezza>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c297ff$9a6af270$0a0110ac@nebuchadnezza>
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
To: Tim Rodriguez <twr@bellsouth.net>, iptables-list <netfilter@lists.samba.org>

On Friday 29 November 2002 06:32 pm, Tim Rodriguez wrote:
> Hey ppl,
>
> I have had my ADSL connection set up with the ADSL modem setup to bridg=
e to
> a Cisco 806 router that actually does all the pppoe configuration. It i=
s
> pretty sweet, but, the Cisco router is not functioning. The Ethernet po=
rt
> on the LAN side have defuncted, broken, not working. I have called Cisc=
o
> and they have confirmed that indeed the ethernet ports and not function=
al
> and they are shipping me out a new one.
>
> I used to have the Cisco router connect to one of three NICs on the
> firewall in order for me to filter traffic, now that the router is not
> functional I have to do a direct connection to my main pc in order to h=
ave
> access to the internet.
>
> I have three NICs on the firewall box, one for the internet (then route=
r)
> one for the internal LAN and one for the DMZ where I house my web, mail=
 and
> DNS server. I know that there is a way to configure the DSL modem to
> connect directly to an interface on the firewall box and do Natting the=
re
> in order for the DMZ and Internal networks to have access to the intern=
et.
> Could someone point me to documentation that I can use to accomplish th=
is?=20
> Your help, as always will be gratefully appreciated.

http://www.roaringpenguin.com/pppoe

This is the PPPoE client that is included with many distributions now, bu=
t it=20
would probably be best to download & install the latest release.  It is v=
ery=20
easy to configure, you just set up the NIC that the ADSL modem is connect=
ed=20
to so that it is NOT activated at startup, and run the PPPoE client=20
configuration, which can be set up to connect at startup, giving you a PP=
P0=20
device (by default).  Your IPTables rules will need to be modified to=20
accomodate this change, but likely no real configuration differences will=
 be=20
required apart from the -i ppp0 or -o ppp0 instead of references to the=20
external NIC directly.

There is documentation and some tutorials available at the RoaringPenguin=
=20
site, and elsewhere, but it really is simple to set up.  Oh, and if the s=
etup=20
wants to set up firewall/masquerade, DON'T, as you will want to handle th=
is=20
directly with iptables yourself.

If your LAN and DMZ are both connected to the firewall box, isn't it alre=
ady=20
performing NAT functions?  If not, then you will need to set up SNAT/MASQ=
 and=20
DNAT rules to move everything around properly.

I've been using the rp-pppoe client with ADSL for some time now with no=20
problems.  If you run into any setting it up, you are welcome to email me=
=20
privately and I will try to assist.  Any problems setting up NAT rules is=
 of=20
course topical to the list here, but if you piggyback any questions about=
=20
that along with rp-pppoe questions privately I won't mind.

j


