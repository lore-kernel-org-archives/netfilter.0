From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: RE: opening a port..
Date: 09 Jan 2003 12:23:37 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042095224.810.19.camel@india>
References: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local> 
	<1042080082.606.21.camel@nirvana>  <1042088119.810.3.camel@india> 
	<1042092980.487.4.camel@nirvana>  <1042093627.810.17.camel@india> 
	<1042094721.423.15.camel@nirvana>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042094721.423.15.camel@nirvana>
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
To: mdew <mdew@mdew.dyndns.org>
Cc: netfilter <netfilter@lists.netfilter.org>

> >=20
> > # nc -l -p 4662
> >=20
> > And then run nmap. You should get listed this port!
> >=20
> > --=20
> > Dharmendra.T
> > Linux Enthu
>=20
> mdew:~# nc -l -p 4662
> =C3=A3P<H=C2=B9og=C3=9DT'b=C2=B4\Y6=E2=96=92http://emule-project.net<6=C3=
=91~=C3=96Emdew:~#
>=20
> (some strange characters, then it quits)
>=20
> mdew:~# netstat -an|grep 4662
> mdew:~#
>=20
> nirvana:/home/mdew# nmap 10.0.0.6
>=20
> Starting nmap V. 3.10ALPHA4 ( www.insecure.org/nmap/ )
> Interesting ports on debian (10.0.0.6):
> (The 1591 ports scanned but not shown below are in state: closed)
> Port       State       Service
> 22/tcp     open        ssh
> 25/tcp     open        smtp
> 110/tcp    open        pop-3
> 111/tcp    filtered    sunrpc
> 113/tcp    open        auth
> 135/tcp    filtered    loc-srv
> 136/tcp    filtered    profile
> 137/tcp    filtered    netbios-ns
> 138/tcp    filtered    netbios-dgm
> 139/tcp    filtered    netbios-ssn
> 199/tcp    filtered    smux
> 826/tcp    filtered    unknown
> 953/tcp    filtered    rndc
> 8080/tcp   open        http-proxy
>=20
>=20
>=20
>=20

nc, I mean to say netcat.?



--=20
Dharmendra.T
Linux Enthu


