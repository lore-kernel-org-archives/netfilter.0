From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: NEW vs INVALID
Date: 01 Oct 2002 10:49:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033462154.878.17.camel@elendil>
References: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de> 
	<3D98620B.2070707@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D98620B.2070707@fugmann.dhs.org>
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
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: Jens =?ISO-8859-1?Q?Lechtenb=F6rger?= <lechten@wi.uni-muenster.de>, netfilter@lists.netfilter.org

Le lun 30/09/2002 =E0 16:39, Anders Fugmann a =E9crit :
> Anyhow, AFAIK, the INVALID target only matches  ackets which are=20
> malformed. a SYN-FIN packets is not malformed as such. (But yes, SYN-FI=
N=20
> is an illegal combination, and should be dropped, though this is not th=
e=20
> purpose of the INVALID match (IMHO, this can easily be done using=20
> standard netfilter rules).

By the way, I was wondering why --syn was "only" equivalent to :
	--tcp-flags SYN,ACK,RST SYN

And not to :
	--tcp-flags SYN,ACK,RST,FIN SYN

I know it is definitly easy to filter according to such criterias, but I
was just wondering if there were a good reason why --syn should match
such packets (maybe should have asked netfilter-devel).

--=20
C=E9dric Blancher
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

