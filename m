From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables logging using ulog : which can handle high traffic, writing in db or json or xml?
Date: Fri, 21 Nov 2014 11:51:18 -0500
Message-ID: <201411211151.18885.neal.p.murphy@alum.wpi.edu>
References: <CAA5aLPimjDRd4X5uJYEtFp=j8miNBiy7r=HoqGwanNZQM2hFEA@mail.gmail.com> <405CDB4498600447A16CCC4ED3BFCAD301B832C2C7@SCOOBY.corp.eastlink.ca>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <405CDB4498600447A16CCC4ED3BFCAD301B832C2C7@SCOOBY.corp.eastlink.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="utf-8"
To: netfilter@vger.kernel.org

10 000 PPS is, at worst, around 15 000 000 bytes/s. Even today's lamest=
 SATA=20
drives should be able to handle that data rate; USB thumb drives can be=
 a=20
different story.

Turn off O_SYNC. Let Linux do its job; it handles disk I/O very well. W=
rite to=20
the file cache and let Linux handle flushing the data to disk. Be sure =
you=20
have plenty of RAM to cache plenty of data. And if you expect to read t=
he data=20
simultaneously, you'll want even *more* RAM to give the system half a c=
hance=20
of keeping some of the data cached. If you're worried about power=20
inerruptions, use a UPS. If you're worried about FS corruption, use a=20
journalled FS.

N


On Friday, November 21, 2014 07:43:09 AM Joel Gerber wrote:
> What type of storage are you writing to? The slow-down might be disk
> access.
>=20
> If you really want to log traffic in the 10,000 pkt/sec range, I woul=
d
> start by writing to memory storage, and then have a process in the
> background sync to disk. Hopefully the sync will be able to keep up
> relatively well.
>=20
> You'll also want a writing system with very little overhead. Writing
> directly to a file with no abstraction layer, using binary output, mi=
ght
> be the fastest thing possible, short of writing to a raw partition ta=
ble.
>=20
> The other thing to consider, is even with all of the data written, ho=
w will
> you read it? Having a file constantly open for writing, precludes bei=
ng
> able to reliably read from it.
>=20
> Joel Gerber
> Network Specialist
> Network Operations
> Eastlink
> E: Joel.Gerber@corp.eastlink.ca T: 519.786.1241
>=20
>=20
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Akshat Kakkar S=
ent:
> November-21-14 7:36 AM
> To: netfilter@vger.kernel.org
> Subject: iptables logging using ulog : which can handle high traffic,
> writing in db or json or xml?
>=20
> i want to do logging of traffic iptables rules.
> Traffic can go upto 10000pkts/sec.
>=20
> While using ulog and writing in mysql db, I could not get good result=
s. Max
> around 300 pkts/sec were able to handle. Further traffic was delayed =
in
> db.
>=20
> Then I used json, it was able to handle around 1700 pkts/sec, beyond =
that
> there is traffic loss in json file.
>=20
> Is there any other mode which can be faster than json without losing =
any
> traffic? --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in the
> body of a message to majordomo@vger.kernel.org More majordomo info at=
=20
> http://vger.kernel.org/majordomo-info.html
> N=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDr=EF=BF=BD=EF=BF=BDy=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDX=EF=BF=BD=EF=BF=BD=C7=A7v=EF=
=BF=BD^=EF=BF=BD)=DE=BA{.n=EF=BF=BD+=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=D7=AB=EF=BF=BD{ay=EF=BF=BD=1D=CA=87=DA=99=EF=BF=BD,j=
=07=EF=BF=BD=EF=BF=BDf=EF=BF=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=EF=BF=BD=EF=
=BF=BDz=EF=BF=BD=1E=EF=BF=BDw=EF=BF=BD=EF=BF=BD=EF=BF=BD=0C=EF=BF=BD=EF=
=BF=BD=EF=BF=BDj
> :+v=EF=BF=BD=EF=BF=BD=EF=BF=BDw=EF=BF=BDj=EF=BF=BDm=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=07=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDzZ+=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=A2j"=EF=BF=BD=EF=BF=BD!=EF=BF=BDi
