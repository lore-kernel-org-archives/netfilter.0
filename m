From: "=?iso-8859-1?q?Ing.=20C=E9sar=20Coello?=" <cecoello_2000@yahoo.com>
Subject: Squid - Iptables
Date: Mon, 23 Dec 2002 10:51:04 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021223165104.22694.qmail@web13605.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-394547293-1040662264=:22062"
Content-Transfer-Encoding: 8bit
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

--0-394547293-1040662264=:22062
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Estoy realizando un control  de acceso en base a las reglas de iptables. Pe=
rmito o Deniego paquetes segun sea la direccion de la maquina cliente. todo=
 me funciona perfectamente, excepto cuando utilizo el Squid. La direccion i=
p que obtengo es la del servidor proxy y no la direccion cliente. Usando el=
 X-forwared puedo conocer la direccion ip cliente, pero no se como agregar =
una regla con iptables para permitir o denegar los paquetes que vengan desd=
e ese ip. Pues si pongo en la regla el ip que obtengo con X-Forwared no pas=
a nada.

Gracias

=20



---------------------------------
Do You Yahoo!?
Todo lo que quieres saber de Estados Unidos, Am=E9rica Latina y el resto de=
l Mundo.
Vis=EDta Yahoo! Noticias.

--0-394547293-1040662264=:22062
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<P>Estoy realizando un control&nbsp; de acceso en base a las reglas de ipta=
bles. Permito o Deniego paquetes segun sea la direccion de la maquina clien=
te. todo me funciona perfectamente, excepto cuando utilizo el Squid. La dir=
eccion ip que obtengo es la del servidor proxy y no la direccion cliente. U=
sando el X-forwared puedo conocer la direccion ip cliente, pero no se como =
agregar una regla con iptables para permitir o denegar los paquetes que ven=
gan desde ese ip. Pues si pongo en la regla el ip que obtengo con X-Forware=
d no pasa nada.</P>
<P>Gracias</P>
<P>&nbsp;</P><p><br><hr size=3D1 noshade><b>Do You Yahoo!?</b><br>
<a href=3Dhttp://espanol.yahoo.com/mail_tagline/*http://espanol.news.yahoo.=
com><img src=3D"http://us.i1.yimg.com/us.yimg.com/i/not/dailynews.gif" widt=
h=3D30 height=3D26 border=3D0 align=3Dleft></a>
Todo lo que quieres saber de Estados Unidos, Am=E9rica Latina y el resto de=
l Mundo.<br>
Vis=EDta <a href=3Dhttp://espanol.yahoo.com/mail_tagline/*http://espanol.ne=
ws.yahoo.com>Yahoo! Noticias</a>.<br>
--0-394547293-1040662264=:22062--

