From: antonio <fonetica@tiscali.it>
Subject: Re: nmap
Date: Wed, 23 Oct 2002 00:35:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021023003527.50af26db.fonetica@tiscali.it>
References: <1035264046.15391.85.camel@hyperno>
	<20021022174245.13d2766b.fonetica@tiscali.it>
	<plopm31y6icovs.fsf@drizzt.dyndns.org>
	<20021022211221.3d91e4fb.fonetica@tiscali.it>
	<plopm3vg3ub2vw.fsf@drizzt.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <plopm3vg3ub2vw.fsf@drizzt.dyndns.org>
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
Cc: kilobug@freesurf.fr=?unknown-8bit?q?Ga=EBl?=LeMignot

OK but if I set the policy OUTPUT at DROP which ports/prot I have to set =
al ACCEPT?
This's my problem.


On Tue, 22 Oct 2002 23:05:39 +0200
kilobug@freesurf.fr (Ga=EBl Le Mignot) wrote:

>=20
> Tue, 22 Oct 2002 21:12:21 +0200, tu as dit :=20
>=20
>  > Ok,but in order to set the policy at DROP,which port/protocols I hav=
e to set at ACCEPT to allow nmap from firewall box to anywhere nad from L=
AN to anywhere?
>=20
> If you don't block OUTPUT and allow ESTABLISHED and RELATED packets in =
INPUT,
> you don't need to open extra ports. Maybe some extra icmp for "weird" s=
cans,
> that's all.
>=20
> --=20
> Gael Le Mignot "Kilobug" - kilobug@freesurf.fr - http://kilobug.free.fr
> GSM         : 06.71.47.18.22 (in France)   ICQ UIN   : 7299959
> Fingerprint : 1F2C 9804 7505 79DF 95E6 7323 B66B F67B 7103 C5DA
>=20
> Member of HurdFr: http://hurdfr.org - The GNU Hurd: http://hurd.gnu.org
>=20

