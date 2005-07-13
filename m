From: <Chandra.Vempali@infineon.com>
Subject: RE: Ip_conntrack_ftp with PASSIVE FTP does not work
Date: Wed, 13 Jul 2005 15:30:37 +0530
Message-ID: <04EE7AD0450F7B498BA216312943A1A102937F40@blrse201.ap.infineon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: harmuth@mnemon.de, netfilter@lists.netfilter.org

Hi=20
Thanks for your reply.

My ip_conntrack_ftp module gets loaded properly.

If I keep a rule like "iptables -A INPUT -m state --state =
RELATED,ESTABLISHED -j ACCEPT"
It means that traffic is allowed to pass through for all ports which =
should not be done for security reasons.

As for passive FTP, I added two rules to allow traffic thru only 21 =
port.
iptables -A INPUT -p tcp --sport 21 -m state --state  ESTABLISHED,NEW -j =
ACCEPT=20
iptables -A OUTPUT -p tcp --dport 21 -m  state --state =
NEW,ESTABLISHED,RELATED -j ACCEPT

So, control messages goes thru firwall successfully.


But for the data, now both server and client work on random ports.
ip_conntrack_ftp module should read this PASSIVE port from FTP message =
and then it should create an expectation.

In my case, it is creating an expectation too. But when data starts =
flowing, firewall does not allow
even through it is expectation.

Any help will be highly appreciated ...

Chandra
P.S : I guess there is some patch for this problem.
Can anybody please point me to such patch and how to get it


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of J=F6rg =
Harmuth
Sent: Wednesday, July 13, 2005 3:09 PM
To: netfilter@lists.netfilter.org
Subject: Re: Ip_conntrack_ftp with PASSIVE FTP does not work


Chandra.Vempali@infineon.com schrieb:
> Hi all,
>=20
> For me, ip_conntrack_ftp does not work for PASSIVE ftp.
>=20
> In the firewall rules, I blocked everything and put the following=20
> rules, iptables -A INPUT -p tcp --sport 21 -m state --state=20
> ESTABLISHED,NEW -j ACCEPT iptables -A OUTPUT -p tcp --dport 21 -m=20
> state --state NEW,ESTABLISHED,RELATED -j ACCEPT
> And when I try to ftp, the control channel goes through firwall, but
> data channel fails to pass through.
So, your firewall connects to the FTP server, why not. First of all make =
sure that ip_conntrack_ftp is compiled into the kernel or as a module. =
If compiled as a module, make sure it is loaded.

As your firewall connects to the FTP server and your OUTPUT policy seems =
to be DROP or REJECT, you need rules like these:

iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT =
iptables -A OUTPUT -p tcp --dport 21 --syn -j ACCEPT iptables -A INPUT =
-m state --state RELATED,ESTABLISHED -j ACCEPT

Hmm, many people, including myself, think, that filtering in OUTPUT is =
pointless. More troublesome than usefull. If you decide to set OUTPUT =
policy to ACCEPT, you don't need the first two rules. Up to you.

Have a nice time,

Joerg

