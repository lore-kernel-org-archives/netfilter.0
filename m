From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: matching -d to a given interface without specifying ip address
Date: Fri, 08 Sep 2006 11:44:43 +0200
Message-ID: <45013B8B.2040801@plouf.fr.eu.org>
References: <009601c6cfdf$c4406910$0101000a@tanjian>
	<44FD003D.7080509@nth.ca>	<edn2vt$4dl$1@sea.gmane.org>
	<4500CA7B.6050304@nth.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4500CA7B.6050304@nth.ca>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Dmitri a =E9crit :
> Danny Rathjens wrote:
>=20
>> Dmitri wrote:
>>
>>> The problem with specifying an IP is that it may change, which breaks=
=20
>>> the rules and requires an update (and detection as well). Event for a=
=20
>>> static IP, that's an extra dependency to watch out for.
>>
>> That's what variables in your firewall script are for.
>> Just re-run it when your network connection restarts:
>> EXTIF=3D"eth0"
>> EXTIP=3D`ifconfig $EXTIF |perl -ne'print $1 if /inet addr:([\d.]+)/'`
>> iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 80
>=20
> Yes, but it's exactly the sort of hack I hoped to avoid. For a perfectl=
y=20
> simple expression, now I need to 1) detect that IP changed or connectio=
n=20
> restarted, and 2) run the hack. There isn't supposed to be any firewall=
=20
> script.

 From what you wrote in your messages, I understand that your box serves=20
as a gateway with an ethernet interface on the LAN side and a PPP=20
interface on the WAN side. On the LAN side, a gateway address is not=20
likely to change, so I don't see a reason to worry about changes of the=20
address of the ethernet interface. On the WAN side, pppd can run scripts=20
every time the PPP connection goes up or down and provide them useful=20
information in environment variable such as the IP address, the peer=20
address, the interface name... without the need fo hugly hacks.

> It's like SNAT vs. MASQUERADE - MASQUERADE works without any scripts or=
=20
> reloads.

Or not. MASQUERADE does not work in some special cases when advanced=20
routing is used. MASQUERADE is not just SNAT with a dynamic address, it=20
is much more. For example you don't actually tell MASQUERADE "use that=20
interface address" but rather "use the suitable source address for the=20
packet destination".

