From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: RELATED connections and the feeling of security
Date: Fri, 13 Apr 2007 23:52:16 +0200
Message-ID: <461FFB90.3020309@plouf.fr.eu.org>
References: <200704131202.27971.Hugo.Mildenberger@t-online.de>	<1176463828.9361.14.camel@anduril.intranet.cartel-securite.net>	<200704131457.59976.Hugo.Mildenberger@t-online.de>	<461FC3C1.1090906@plouf.fr.eu.org>
	<461FDF35.7010901@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <461FDF35.7010901@rtij.nl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Martijn Lievaart a =E9crit :
>>
>>> should the ftp-conntrack helper expose arbitrary ports on the=20
>>> originating host?
>>
>> Yes it should, for the following two reasons :
>> 1) The host explicitly asked for it over the FTP control connection.
>> 2) The firewall administrator allowed it by loading the FTP conntrack=20
>> module.
>=20
> No, not arbitrary ports. The port asked for in the port command should=20
> be opened (and it is).

I took "arbitrary" as "arbitrarily chosen by the host".

