From: antonio <fonetica@tiscali.it>
Subject: Re: nmap
Date: Tue, 22 Oct 2002 21:12:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021022211221.3d91e4fb.fonetica@tiscali.it>
References: <1035264046.15391.85.camel@hyperno>
	<20021022174245.13d2766b.fonetica@tiscali.it>
	<plopm31y6icovs.fsf@drizzt.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <plopm31y6icovs.fsf@drizzt.dyndns.org>
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
To: netfilter@lists.netfilter.org

Ok,but in order to set the policy at DROP,which port/protocols I have to =
set at ACCEPT to allow nmap from firewall box to anywhere nad from LAN to=
 anywhere?





On Tue, 22 Oct 2002 20:25:11 +0200
kilobug@freesurf.fr (Ga=EBl Le Mignot) wrote:

>=20
> Tue, 22 Oct 2002 17:42:45 +0200, tu as dit :=20
>=20
>  > Hi Everyone,
>  > Just a question:
>  > I want to set up a firewall box with iptables in which I can use nma=
p.
>  > Which ports/protocols can I set to ACCEPT and which to DROP?
>=20
> I advise you to set the policy at DROP, and to accept:
> * RELATED, ESTABLISHED packets
> * NEW packets on the ports you _need_ to open (80 if you host a web ser=
ver,
>   22 if you want to allow remote login using ssh and so on).
> * ICMP echo-request packets
>=20
> This is a basic and a simple firewall and should be a good start.
>=20
> --=20
> Gael Le Mignot "Kilobug" - kilobug@freesurf.fr - http://kilobug.free.fr
> GSM         : 06.71.47.18.22 (in France)   ICQ UIN   : 7299959
> Fingerprint : 1F2C 9804 7505 79DF 95E6 7323 B66B F67B 7103 C5DA
>=20
> Member of HurdFr: http://hurdfr.org - The GNU Hurd: http://hurd.gnu.org
>=20

