From: guido@lorenzutti.com.ar
Subject: Re: Ayuda PREROUTING
Date: Thu, 13 Jan 2005 12:00:11 -0300 (ART)
Message-ID: <54123.200.63.17.51.1105628411.squirrel@webmail.presencia.net>
References: <1105567838.5149.21.camel@firewall.ucbcba.edu.bo>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105567838.5149.21.camel@firewall.ucbcba.edu.bo>
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
Content-Transfer-Encoding: quoted-printable
To: Jorge Enrique <nunezj@ucbcba.edu.bo>
Cc: netfilter@lists.netfilter.org

Buenas, te contesto yo xq veo que nadie te tira una mano :)

Te cuento que si haces eso es un caos, porque imaginate que tood paquete
qeu este destinado a la ip externa de tu firewall no va a llegar, iria a
la ip interna, no obstante romp=E9s todo mal... lo que t en=E9s que hacer es
por puerto, no as=ED.

Probate algo como
iptables -t nat -A PREROUTING -p tcp --dport 80 -d $IPWAN ! -s $LAN -j
DNAT --to $WEB_SERVER_LAN

Donde:
 IPWAN =3D ip de internet del firewall
 LAN =3D La red de la lan, hago un inverso para que no haga esto cuando la
lan quiera hablar con un http server que funcione en el firewall.
Entonces los excluyo.
 WEB_SERVER_LAN =3D Servidor web que corre en la lan.

>=A0Una=A0consulta,=A0estado=A0haciendo=A0un=A0PREROUTING=A0en=A0mi=A0firew=
all,=A0quedando=A0de
>=A0la=A0sigueinte=A0manera
>=A0
>=A0$IPTABLES=A0-t=A0nat=A0-A=A0PREROUTING=A0-d=A0IP-EXTERNA=A0-j=A0DNAT=A0=
--to=A0IP_INTERNA
>=A0
>=A0Haciendo=A0las=A0pruebas=A0puedo=A0hacer=A0ping=A0a=A0la=A0IP_EXTERNA=
=A0e=A0IP_INTERNA=A0desde
>=A0mi=A0red=A0sin=A0ningun=A0problema=A0pero=A0si=A0lo=A0hago=A0desde=A0af=
uerea=A0o=A0con=A0otra
>=A0IP_EXTERNA=A0no=A0la=A0puedo=A0ver,=A0que=A0estaria=A0mal=A0o=A0donde=
=A0deberia=A0modificar
>=A0esto,=A0o=A0es=A0necesario=A0que=A0le=A0especifique=A0los=A0puertos=A0p=
or=A0los=A0que=A0quiero
>=A0que=A0se=A0vea????
>=A0
>=A0alguien=A0que=A0me=A0puede=A0orientar=A0en=A0esto.....
>=A0
>=A0
>=A0


