From: "Eray Aslan" <eray.aslan@caf.com.tr>
Subject: Ipsec/l2tp
Date: Sat, 3 Jul 2004 13:25:17 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4FE82EE778704E4D9D31E9CE0BEC1465032312@caf02.caf.local>
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

>> Haven't worked much with IPSec (at least not over firewall).  Are you
>> sure that IPSec packets will go through Netfilter twice (once =
encrypted,
>> and than once again unencrypted)?
>
>They do.   This makes it easy to filter the packet types you want to =
allow=20
>through the tunnel, rather than having a VPN which passes just =
everything.
>
>Regards,
>
>Antony.

Hi,

I am having problems in setting up the following (setup is similar to =
what is described at http://koeppe-net.de/l2tp-howto.txt )

WinXP (VPN Client)
|
|(ipsec/l2tp)
|
Firewall (linux 2.6.6 iptables 1.2.9)
|
|(l2tp)
|
Win2K3 (VPN Server)

Basically, the client should connect to the firewall with ipsec/l2tp.  =
At the firewall, the incoming encrypted packets from the VPN clients =
should be unencrypted and sent to the VPN Server.  However, I am =
confused about which tables the packets go through both in their first =
and second rounds. My guess is that I should

For the encrypted pockets coming in from the VPN Client:
Mark the encrypted packets in mangle/prerouting
Accept the marked packets in the filter/input
DNAT (to VPN Server) the marked packets in nat/output
Accept the marked packets in filter/output

Any comments? Or better yet, can anyone give me a list of tables an =
ipsec packet goes through in the 2 rounds it makes in netfilter? What is =
meant by "IPSec packets will go through Netfilter twice (once encrypted, =
and than once again unencrypted)" ?  Does the same packet hit =
mangle/prerouting, for example, twice (first encrypted and then =
unencrypted)?  Also, how about the other way around (from VPN Server to =
VPN Client)?

Any comments / suggestions on the setup are also welcome.  I'd rather =
not use pptp if I can help it.

Thanks
Eray Aslan

