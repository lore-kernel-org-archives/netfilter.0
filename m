From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Redirect DHCP requests to DMZ?
Date: 23 Apr 2003 14:19:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051100353.12295.96.camel@elendil.intranet.cartel-securite.net>
References: <3EA66634.2020508@blinkenlichten.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EA66634.2020508@blinkenlichten.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Le mer 23/04/2003 =E0 12:08, Carsten Maass a =E9crit :
> Local LAN (192.168.20.*)
>      |
>      |
>    Switch
>      |
>      |
> Router/Firewall ---- DMZ (192.168.21.*)
>      |
>      |
>      |
>   Internet
>
> Everything runs smoothly, except for one thing: I am unable to
> redirect DHCP request from the clients on the local LAN to the DHCP
> server inside the DMZ.

You'll achieve this setting a DHCP Relay up. Due to what they are, DHCP
packets cannot be routed through different IP networks (mainly because
of destination addresses that are used).

But this kind of setup is no secure. If someones breaks into your DMZ,
he will be able to have your LAN's configuration, and even tamper it,
acting on DHCP stuff. That's _very bad_. DMZ compromission must not
endanger rest of network security.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

