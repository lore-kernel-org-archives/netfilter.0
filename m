From: Thierry ITTY <thierry.itty@besancon.org>
Subject: linux router announces bad ip/mac
Date: Wed, 06 Nov 2002 08:47:19
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3.0.1.16.20021106084719.230ff560@s-net-04.besancon.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

Hello

I have a linux box (rh 73 out of the box on a P200mmx and 2 accton nics)
with iptables (1.2.3-1)

there's a script which configures it either :
 - as a simple host (only NIC A is activated with ip 1.1.1.10)
 - as a transparent bridge (both NICs are activated, bridge device gets ip
1.1.1.10)
 - as a filtering router (both NICs are activated, A with ip 1.1.1.10 and B
with 192.168.1.1)

the reason of this is because I have a distant class room with several
windoz PCs, and, depending of the teacher/attenders, I want them to either
have absolutely no access to our network, or full access, or limited
access. In the case of full access I could have set up a non-filtering
router, this would have been much easier, but as I needed to allow NetBEUI
to work in this case I choosed to use a transparent bridge configuration.=20

Configuration changes must be done remotely. NIC A is connected on our
network (so whatever configuration is active, the box is always reachable
at 1.1.1.10), NIC B is connected to the class room lan.=20

On the A side there are 2 IP networks on the same ethernet wire : 1.1.1.0
and 192.168.1.0. there are a lot of workstation on that side ine the
192.168.1.0 subnet. On the B side (only the classroom) there are a few
workstations in the (only) 192.168.1.0 subnet. All the 192.168.1.0 machines
have a default gateway set to 192.168.1.1.

On the A side there are 2 routers, one with IP 192.168.1.1 and one with
1.1.1.1=20

so when the box is configured as a transparent bridge, NetBEUI is forwarded
through it, and IP too, so class room PCs "talk" to the "true" router at
192.168.1.1.

when the box is configured as a filtering router, NetBEUI is no more
forwarded, and class room PCs can't talk to 192.168.1.1. instead, they talk
to the linux box, which MASQUERADEs (on 1.1.1.10) and forwards only to
selected ip destinations. whatever configuration it is in, the linux box
always has 1.1.1.1 as a default gateway. Of course, other PCs on the A side
go on talking to the "true" 192.168.1.1 router.

thought it's a bit complex, this allows me to handle the NetBEUI case and
avoids any configuration change on the class room PCs.

OK, now here's the problem I get :
when the box is in router mode, it answers to ARP requests asking for
192.168.1.1 coming on NIC B (sent all from the B side PCs in their normal
network operation process) with NIC B's mac address. this is fine
BUT, it also answers to ARP requests asking for 192.168.1.1 coming on NIC A
(sent all from the A side PCs) with NIC A's mac address. and this is of
course wrong, because A side PCs then send their routed traffic to the
linux box (which obviously doesn't handle it) instead of sending it to the
true router.

what causes this behaviour (responding on the A side to arp requests which
it should not answer to) and how can I cure it ?

tia
			- * - * - * - * - * - * -
Bien s=FBr que je suis perfectionniste !
Mais ne pourrais-je pas l'=EAtre mieux ?
	Thierry ITTY
eMail : Thierry.Itty@Besancon.org		FRANCE

