From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall IP change
Date: Mon, 26 Jul 2004 14:43:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407261443.20581.Antony@Soft-Solutions.co.uk>
References: <40FEE340.8090907@ctwa.com> <200407261327.43786.Antony@Soft-Solutions.co.uk> <200407261520.57942.fred99@libertysurf.fr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407261520.57942.fred99@libertysurf.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Monday 26 July 2004 2:20 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:

> Thanks Antony,
>
> According to your explanations I think I 'd rather to include the follo=
wing
> line in my iptable script :
> iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to 62.160.X.Y
>
> But to be sure : I've got two computers on my DMZ which have IP include=
d in
> 192.168.2.0/255.255.255.0 and other computers on my LAN which have IP
> included in 172.16.0.0/255.255.0.0  and static public IP on my WAN
> Firewall. So the best way is to use the line you advice me ?

Yes.

> Where on my script do I have to add this line ? At the beginning, just
> after a modprobe iptable_nat line ?

I like to put it just before or just after the FORWARD rules, because it'=
s for=20
packets which are being routed through the firewall.

> Last question : Do you see some clumsy things or errors in my script ?
> Unfortunately I think there are .... ;-(

You have approximately twice as many rules as I would expect to see - you=
 are=20
allowing each individual protocol (defined by its source port)n in an=20
ESTABLISHED rule; most people would just use one ESTABLISHED rule to allo=
w=20
all reply packets, no matter which protocol.

Also you have specific rules for FTP data connection on port 20 - better =
to=20
just leave these out and handle the packets as RELATED to the control=20
connection on port 21.

I prefer a simple ruleset if possible because it's easier to work with.

Regards,

Antony.

--=20
The difference between theory and practice is that in theory there is no=20
difference, whereas in practice there is.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


