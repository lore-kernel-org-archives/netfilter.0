From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Web server access
Date: 15 Jul 2003 14:52:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058273537.13995.1.camel@raylinux.internal>
References: <Law11-F121EveicGgej0000c435@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law11-F121EveicGgej0000c435@hotmail.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

You also need to forward rules to forward the traffic to and from your
webserver.


On Mon, 2003-07-14 at 17:10, Jorge Uma=F1a wrote:
> I have a LINUX box with a public ip. I need to use iptables to send all t=
he=20
> packages that come to the 80 port to my Web server in Windows. I am using=
=20
> this chain:
> iptables -t nat -A PREROUTING -p tcp -d $ipPUBLIC --dport 80 -j DNAT=20
> --to-destination $ipWEBSERVER
>=20
> I tried to access my web page from outside but does not work
>=20
> I will appreciate your help
> Thanks
>=20
> _________________________________________________________________
> Charla con tus amigos en l=EDnea mediante MSN Messenger:=20
> http://messenger.yupimsn.com/
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--


