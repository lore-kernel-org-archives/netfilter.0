From: "Daniel Boy" <dabohh@gmx.de>
Subject: owner module / Re: Delivery failure to iptables@acalprecision.com
Date: Tue, 10 Aug 2004 11:43:51 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <28054.1092131031@www46.gmx.net>
References: <20040810093710.5032gmx1@mx051.gmx.net>
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

Sorry for posting my question a second time.
I am confused of this reply ...

Who is iptables@acalprecision.com?
And why I am getting problems?

Kind regards
Daniel


> Delivery was attempted, but failed because:
> 551 5.0.0 Known SPAM source - address blocked.To resolve this problem
> please visit http://nospam.arix.com/blocked.php
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Original Message:
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
> X-TZO-Forward: iptables@acalprecision.com
> Received: from 62.128.28.23 by saf.tzo.com
> 	id 2004081005365025063 for iptables@acalprecision.com;
> 	Tue, 10 Aug 2004 09:36:50 GMT
> Received: from vishnu.netfilter.org ([213.95.27.115])
> 	by lakshmi.netfilter.org with esmtp (Exim 4.22 #1 (Debian))
> 	id 1BuT0O-0006Mq-1o; Tue, 10 Aug 2004 11:33:16 +0200
> Received: from mail.gmx.net ([213.165.64.20])
> 	by vishnu.netfilter.org with smtp (Exim 4.22 #1 (Debian))
> 	id 1BuSyf-0004zW-7s
> 	for <netfilter@lists.netfilter.org>; Tue, 10 Aug 2004 11:31:29 +0200
> Received: (qmail 7871 invoked by uid 0); 10 Aug 2004 09:31:28 -0000
> Received: from 80.171.10.240 by www46.gmx.net with HTTP;
> 	Tue, 10 Aug 2004 11:31:28 +0200 (MEST)
> From: "Daniel Boy" <dabohh@gmx.de>
> To: netfilter@lists.netfilter.org
> MIME-Version: 1.0
> Subject: owner module
> X-Priority: 3 (Normal)
> X-Authenticated: #13669367
> Message-ID: <11900.1092130288@www46.gmx.net>
> X-Mailer: WWW-Mail 1.6 (Global Message Exchange)
> X-Flags: 0001
> Content-Type: text/plain; charset=3D"us-ascii"
> Content-Transfer-Encoding: 7bit
> X-Spam-Score: -3.7 (---)
> Sender: netfilter-admin@lists.netfilter.org
> Errors-To: netfilter-admin@lists.netfilter.org
> X-BeenThere: netfilter@lists.netfilter.org
> X-Mailman-Version: 2.0.11
> Precedence: bulk
> List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=3Dhelp>
> List-Post: <mailto:netfilter@lists.netfilter.org>
> List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
> 	<mailto:netfilter-request@lists.netfilter.org?subject=3Dsubscribe>
> List-Id: General discussion and user questions
> <netfilter.lists.netfilter.org>
> List-Unsubscribe:
> <https://lists.netfilter.org/mailman/listinfo/netfilter>,
> 	<mailto:netfilter-request@lists.netfilter.org?subject=3Dunsubscribe>
> List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
> Date: Tue, 10 Aug 2004 11:31:28 +0200 (MEST)
>=20
> Hello,
>=20
> I try to implement the command "--cmd-owner" for some
> services in the "filter" table.
>=20
> When I do so the corresponding services do not terminate
> correctly any more.
>=20
> For example I opened an SSH connection and terminated
> it after the successful login with the "logout" command.
> Afterwards on the servers side "ps" and "netstat" says
> the connection is still alive. On the client side
> "netstat" says "FIN ACK", "LAST ACK", "CLOSING" and I get
> some log entries in "messages".
>=20
>=20
> The necessary iptables-rules at client-side:
>=20
> iptables -A OUTPUT -m owner --cmd-owner "ssh" -p tcp -s CLIENT -d SERVER
> --sport 1024:65535 --dport 22 -j ACCEPT
> iptables -A INPUT -p tcp -s SERVER -d CLIENT --sport 22 --dport 1024:65535
> -j ACCEPT
>=20
>=20
> Some of the drop-log entries at client-side:
>=20
> Aug  9 15:29:54 CLIENT kernel: DROP IN=3D OUT=3Deth0 SRC=3DCLIENT DST=3DS=
ERVER
> LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D129 DF PROTO=3DTCP SPT=3D33=
442 DPT=3D22
> WINDOW=3D24752 RES=3D0x00 ACK URGP=3D0
> Aug  9 15:29:55 CLIENT kernel: DROP IN=3D OUT=3Deth0 SRC=3DCLIENT DST=3DS=
ERVER
> LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D130 DF PROTO=3DTCP SPT=3D33=
442 DPT=3D22
> WINDOW=3D24752 RES=3D0x00 ACK URGP=3D0
> Aug  9 15:29:55 CLIENT kernel: DROP IN=3D OUT=3Deth0 SRC=3DCLIENT DST=3DS=
ERVER
> LEN=3D52 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D131 DF PROTO=3DTCP SPT=3D33=
442 DPT=3D22
> WINDOW=3D24752 RES=3D0x00 ACK URGP=3D0
>=20
>=20
> So I would say the boolean #--cmd-owner "ssh"# is immediately
> invalid. So the client cannot inform the server about the closing.
>=20
> Does anybody have an idea to let only the missing packets passing?
>=20
> Kind regards
> Daniel
>=20
> --=20
> NEU: WLAN-Router f=FCr 0,- EUR* - auch f=FCr DSL-Wechsler!
> GMX DSL =3D superg=FCnstig & kabellos http://www.gmx.net/de/go/dsl
>=20
>=20
>=20

--=20
NEU: WLAN-Router f=FCr 0,- EUR* - auch f=FCr DSL-Wechsler!
GMX DSL =3D superg=FCnstig & kabellos http://www.gmx.net/de/go/dsl


