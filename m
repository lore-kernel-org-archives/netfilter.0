From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT table bypass for local traffic
Date: Sat, 01 May 2010 16:29:25 +0200
Message-ID: <4BDC3AC5.1030500@plouf.fr.eu.org>
References: <n2h812495871004281019nb633c037i7dc04336bc47bd59@mail.gmail.com>	 <h2v7d7f2e8c1004281059l2ad0d411x1e5f17fd6d7e489f@mail.gmail.com>	 <alpine.LSU.2.01.1004282136590.18231@obet.zrqbmnf.qr>	 <h2i812495871004281350j23f2bdefhe18b60101fcf5acc@mail.gmail.com>	 <alpine.DEB.2.00.1004282253090.2332@aurora.sdinet.de> <q2xcfeab66d1004282325wbf9a93aduf3a8fc2d82ee90b0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <q2xcfeab66d1004282325wbf9a93aduf3a8fc2d82ee90b0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

ratheesh k a =E9crit :
>=20
> Does echo reply will show up in nat PREROUTING chain ?

No.
If conntrack saw the echo request and the related "connection" exists,
then the echo reply is in the ESTABLISHED state and by-passes the nat
chains.
If conntrack did not see the echo request or the related "connection"
was further deleted or expired, then the echo reply is in the INVALID
state and by-passes the nat chains too.
