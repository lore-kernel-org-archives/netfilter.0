From: "Emilio Lombardo" <emiliokatia@terra.com.br>
Subject: Fw: Upgrading kernel 2.4.26 cuts out DNAT --to rules.....!!??
Date: Wed, 2 Feb 2005 14:02:51 -0200
Message-ID: <004c01c50940$a5c53950$1d01000a@cingo.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=======AVGMAIL-4200F9AB588A======="
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
To: RODRlGO <ro.garcia@gmail.com>, netfilter@lists.netfilter.org

--=======AVGMAIL-4200F9AB588A=======
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


----- Original Message -----=20
From: Emilio Lombardo=20
To: netfilter@lists.netfilter.org ; rodrigo.garcia@gmail.com=20
Sent: Wednesday, February 02, 2005 1:47 PM
Subject: Upgrading kernel 2.4.26 cuts out DNAT --to rules.....!!??


hi at all the List !
This is my first entry and i'm quite a newbie at all in netfilter =
iptables.... i'm working as a net administrator from Brazil so apologize =
by now for any english error i may do... ;-)
I have a Debian Linux distribution, the kernel 2.6.4 and we had the task =
of making varios simultaneos vpn gre connections=20
because before we had a problem and couldn't make more than one pptp =
connection at a time=20
passing by the firewall (iptables 1.2.7 version)
So what we did was upgrading to iptables 1.2.11 on kernel 2.4.26  and =
recompiling it whithin patch-o-matic and it worked out !
Now we got simultaneous and various vpn on gre protocol perfectly =
working passing by the firewall whitout any problem (and of course it =
was really the firewall because we tested the vpn's bypassing it and =
they worked.all toghether...)
Well...now when everithing looked working but than debugging the =
internal rules we saw that any attempt to add a "DNAT --to" always got =
an answer of=20
Invalid Argument ..........the same rules that before was working =
....!!!!!And here came the problem.....
How is it possible for us making both instances (The VPN's and the DNAT =
--to rules) work togheter...is there any linux guru...:-) who can lend a =
hand and help us to find a way out in this maze ?

Thanks a lot for any help!

Regards=20
Emilio
--=======AVGMAIL-4200F9AB588A=======
Content-Type: text/plain; x-avg=cert; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Description: "AVG certification"

No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 265.8.1 - Release Date: 27/1/2005

--=======AVGMAIL-4200F9AB588A=======--

