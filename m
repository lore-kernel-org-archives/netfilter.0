From: "Joris Dobbelsteen" <joris.dobbelsteen@mail.com>
Subject: RE: Enable Loopback confuse
Date: Fri, 19 Aug 2005 13:55:39 +0200
Message-ID: <B9833546B2643B43A56C4E962E13174602A9C7@nehemiah.joris2k.local>
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
To: nattapon viroonsri <nattaponv@hotmail.com>
Cc: netfilter@lists.netfilter.org

Yes, normally loopback traffic is not forwarded

Telnet generates packet
Iptables evaluates OUTPUT filter
Packet it routed, destination is to local system
Iptables evaluates INPUT filter
Someby received the packet

This is how (I guess) it would work...

- Joris

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org=20
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
>nattapon viroonsri
>Sent: vrijdag, 19 augustus 2005 12:42
>To: netfilter@lists.netfilter.org
>Subject: Enable Loopback confuse
>
>
>Anyone please recommend me about iptables loopback
>
>When i enable loopback i just use 2 line below and everything=20
>work fine iptables -A INPUT -i lo -j ACCEPT iptables -A OUTPUT=20
>-o lo -j ACCEPT
>
>But i see many example around then have also included this=20
>line below  to enable loopback iptables -A FORWARD -o lo - j ACCEPT ?
>
>i try generate packet locally like "telnet localhost 25" and=20
>debug with "iptables -L -nv"
>but dont see any packet match  this rule(FORWARD)    only =20
>INPUT and OUTPUT=20
>matched
>
>So can i omit this line ?
>or what kind of packet that match this rule ?
>
>_________________________________________________________________
>Don't just search. Find. Check out the new MSN Search!=20
>http://search.msn.com/
>
>
>
>

