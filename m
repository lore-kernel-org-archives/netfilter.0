From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: iptables and pop3 lockup
Date: Tue, 16 May 2006 10:05:06 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582901676D1@pxtbenexd01.pxt.primeexalia.com>
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
To: Bowie Bailey <Bowie_Bailey@BUC.com>, "Netfilter List (E-mail)" <netfilter@lists.netfilter.org>

Um, have you tried adding a log statement before the drop to see what is
being caught?=20

Try adding the following right before the reject rule.

-A RH-Firewall-1-INPUT -j LOG --log-prefix "FIREWALL: " --log-level 1

Then tail the log while trying to make a pop3 connection to it. =20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Bowie Bailey
> Sent: Tuesday, May 16, 2006 9:56 AM
> To: Netfilter List (E-mail)
> Subject: iptables and pop3 lockup
>=20
> I am having a problem implementing iptables with Courier's pop3
> server.  If I disable iptables, everything works fine.  As soon as I
> enable it, pop3 will stop working for messages over 32K.  Small
> messages will go through with no problems, but large ones will time
> out.
>=20
> I get this message from OE: "Your POP3 server has not responded in 60
> seconds."  And an option to stop or continue waiting.  I can wait as
> long as I want, but it will not download the message.
>=20
> This problem only exists with connections coming from outside our
> network.  Connections from within the network can download large
> messages with no problems.
>=20
> Has anyone seen this before?  I would like to implement iptables for
> more security, but I can't do it if this problem persists.
>=20
> My server is:
>     P4 2.8, 1GB RAM
>     CentOS 4.3 (fully patched)
>     Courier 0.53.1
>=20
> My iptables rules were initially created with
> system-config-securitylevel and then modified from there.  The current
> rules are:
>=20
> Chain INPUT (policy ACCEPT)
>  target               prot opt in  out  source     destination
>  RH-Firewall-1-INPUT  all  --  *   *    0.0.0.0/0  0.0.0.0/0
>=20
> Chain FORWARD (policy ACCEPT)
>  target               prot opt in  out  source     destination
>  RH-Firewall-1-INPUT  all  --  *   *    0.0.0.0/0  0.0.0.0/0
>=20
> Chain OUTPUT (policy ACCEPT)
>  target  prot opt in  out  source         destination
>=20
> Chain RH-Firewall-1-INPUT (2 references)
>  target  prot opt in  out  source         destination
>  ACCEPT  all  --  lo  *    0.0.0.0/0      0.0.0.0/0
>  ACCEPT  icmp --  *   *    0.0.0.0/0      0.0.0.0/0  icmp type 255
>  ACCEPT  all  --  *   *    0.0.0.0/0      0.0.0.0/0  state
> RELATED,ESTABLISHED
>  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:25
>  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:110
>  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:53
>  ACCEPT  udp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW udp
dpt:53
>  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:587
>  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:80
>  ACCEPT  tcp  --  *   *    172.16.0.0/16  0.0.0.0/0  state NEW tcp
dpt:22
>  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:443
>  ACCEPT  tcp  --  *   *    0.0.0.0/0      0.0.0.0/0  state NEW tcp
dpt:995
>  REJECT  all  --  *   *    0.0.0.0/0      0.0.0.0/0  reject-with
> icmp-host-prohibited
>=20
> I have found information on Google indicating that this might be a
> problem with the MTU or MSS setting, but the solutions given seemed to
> be aimed at the end user rather than the server.  I tried them anyway,
> but they didn't seem to help.
>=20
> This is what was generally suggested:
>=20
>     iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
>              -j TCPMSS --clamp-mss-to-pmtu
>=20
> It didn't get any hits on the FORWARD chain.  I put it on the OUTPUT
> chain and it got some hits there, but didn't have any effect on the
> problem.  I also tried the --set-mss option with the same lack of
> results.
>=20
> I appreciate any suggestions.
>=20
> --
> Bowie


