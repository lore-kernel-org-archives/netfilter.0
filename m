From: "Ricardo A." <ricardoa@dim.fm.usp.br>
Subject: zlimit rules
Date: Wed, 10 Nov 2004 09:07:52 -0200
Message-ID: <4191F688.6040009@dim.fm.usp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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


       Good morning.

       Any one here all ready used zlimit rules for block portscanners=20
hides!?

       The rule is:

       iptables -A FORWARD -p tcp -tcp-flags SYN,ACK,FIN,RST -m zlimit=20
-limit 1/s -j ACCEPT.

       I get this rule in a magazine, but don't find the zlimit module.

       Anybody help-me!??

       Thanks.

--=20
             Ricardo A
        Analista de Suporte
	   www.usp.br/fm

Linux Registered User # 291904

The box said "Windows XP, Windows NT, or better".
So I installed GNU/Linux.

"Nunca discuta com um idiota. Ele ir=E1 arrast=E1-lo at=E9 o seu n=EDvel =
e ent=E3o o derrotar=E1 com a sua vasta experi=EAncia."


--------------------------
Esta mensagem foi verificada
pelo sistema de antiv=EDrus DIM e
acredita-se estar livre de Virus.
Virus data file v4405 created Nov 09 2004


