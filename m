From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forward a port ??!!
Date: Tue, 20 Jul 2004 21:55:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407202155.42179.Antony@Soft-Solutions.co.uk>
References: <40FD76CE.6050501@libertysurf.fr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FD76CE.6050501@libertysurf.fr>
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

On Tuesday 20 July 2004 8:47 pm, Fr=E9d=E9ric Gonzatti wrote:

> Hi all,
>
> I''ve got a firewall with three cards : eth0 (LAN), eth1(DMZ) and eth2
> (WAN).
> I'm trying to test port forward with iptables but it doesn't work !
> eth0 : 172.168.2.1 (I'm not using this card now)
> eth1: 192.168.2.1/255.255.255.0
> eth2: 192.168.3.1/255.255.255.0
>
> On the DMZ I've put a computer (192.168.2.151/255.255.255.0) with sendm=
ail.
> When I'm on this computer a telnet localhost 25 is working fine.
> I've connected a computer on eth2 with ip 192.168.3.2/255.255.255.0
> I would like to access to the computer with sendmail when I make a
> telnet 192.168.3.1 but I've got a timeout response.

> What it's wrong with this script ?

I see nothing obvious wrong with your script; however, what do you get fo=
r the=20
packet & byte counters from "iptables -L -nvx; iptables -L -t nat -nvx"? =
 =20
That should tell you which rules are successfully matching packets, and w=
hich=20
rules are seeing none.

You might want to try LOGging packets which reach the end of the INPJUT a=
nd=20
FORWARD chains, so you can see what's trying to get into or through the=20
firewall and being blocked by the default DROP policies.

Does the sendmail system try to do ident lookups on incoming connections?=
  =20
Does it refuse a connection if there is no ident reply (since you do not=20
allow idents into, or through, your firewall)?

I think a couple of LOGging rules, or a packet sniffer on eth1, will tel =
you=20
what's going on.

Regards,

Antony.

--=20
Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.

 - Damian Conway, Perl God

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


