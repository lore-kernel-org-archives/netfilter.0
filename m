From: gypsy <gypsy@iswest.com>
Subject: Re: Passive FTP sees remote's _internal_ IP!!??
Date: Mon, 27 Nov 2006 20:46:42 -0800
Message-ID: <456BBF32.877BE99C@iswest.com>
References: <20061127184454.0BD73DB@brinstar.nerim.net>
	<456B57FA.5020000@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>

Pascal Hambourg wrote:
>=20
> Hello,
>=20
> Maxime Ducharme a =E9crit :
> > This happens when the remote server has a bad
> > NAT configuration for FTP.
>=20
> I fully agree, the problem seems to be on the server side.
>=20
> > Maybe SonicWALL is able to "fix" this itself, I dont
> > know this product very well.
>=20
> If it does so, I'd be happy to know how.

SonicWALL does fix this, and we also would REALLY like to know how!!  At
the present time, our only "solution" is to reconfigure the clients to
gateway to the SonicWALL because everyone's browser only does passive
FTP.

> Does this happen with any FTP server or only a specific one ?

It happens with more than one server, but as far as I can tell, all
Unix/Linux/*BSD FTP servers work; only MS Windows servers seem to fail.=20
But because of the success with the SonicWALL, it does not seem likely
that getting a remote site to change (or even look at) their setup will
ever happen.

SPECULATION:  In a google search for FTP servers, much comes up about
configuring IIS FTP, so perhaps it is a difficult thing to do, and
therefore it often is done wrongly.

Could it be worthwhile to run an FTP proxy such as
http://www.mcknight.de/jftpgw/jftpgw-0.13.4.tar.gz ?
--
gypsy

