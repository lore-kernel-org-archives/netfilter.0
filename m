From: Michael Martinez <mmartinez@csrees.usda.gov>
Subject: Re: Web server access
Date: 15 Jul 2003 10:19:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058278745.1356.9.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="utf-8"
To: Jorge =?ISO-8859-1?Q?Uma=F1a?= <jorgeaub@hotmail.com>
Cc: netfilter@lists.netfilter.org

First make sure the windows box port 80 can be accessed from your Linux
box:
1. log on to your linux box
2. telnet windows-box 80

Then, make sure your Linux box port 80 is accessible from the Internet:

3. go to http://centralops.net/co/
4. use the "tcpquery" function to do a http query on your Linux box

Then, configure iptables on your Linux box. Configure to log port 80
rejects and redirects. Use the logging info to make sure the packets are
being redirected.

mike

On Mon, 2003-07-14 at 11:10, Jorge Uma=C3=B1a wrote:
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
> Charla con tus amigos en l=C3=ADnea mediante MSN Messenger:=20
> http://messenger.yupimsn.com/
>=20
>=20
--=20
Michael Martinez
Linux System Administrator
ISTM/CSREES/USDA

