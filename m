From: Eric Marchionni <mailing-lists@gmx.ch>
Subject: Re: deny cgi scanner
Date: Tue, 01 Apr 2003 21:43:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E89EBE5.5090804@gmx.ch>
References: <3E89CD8A.5020007@gmx.ch> <1049219263.4784.14.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049219263.4784.14.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

thx a lot cedric and jesper!

Cedric Blancher wrote:
> Le mar 01/04/2003 =E0 19:34, Eric Marchionni a =E9crit :
>=20
>>does anybody know how to drop packets with
>>destination-port 80 after a limit of connections
>>has been reached?
>>i'd like to deny access for the attacker as soon
>>as a cgi-scan has been detected.
>=20
>=20
> | # limit the nr of parallel http requests to 16 per class C sized
> | # network (24 bit netmask)
> | iptables -p tcp --syn --dport 80 -m iplimit --iplimit-above 16		\
> |	--iplimit-mask 24 -j REJECT
>=20
> I think it exactly fits your needs ;)

this sounds already pretty good!
as far as i understand this will result in a slowdowned scan.
if somehow possible i'd like to abort the scan at all. like
denying any connection from the attackers ip for about 1 minute=20
or so...
(i know it's dangerous if someone begins spoofing google-ip or
my dns-server-ip with a cronjob, but this would only affect the
web-server...)

else i'll use iplimit ;-D

-eric


