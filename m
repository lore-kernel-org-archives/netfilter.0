From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: deny cgi scanner
Date: 01 Apr 2003 19:47:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049219263.4784.14.camel@elendil.intranet.cartel-securite.net>
References: <3E89CD8A.5020007@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E89CD8A.5020007@gmx.ch>
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
To: Eric Marchionni <mailing-lists@gmx.ch>
Cc: netfilter@lists.netfilter.org

Le mar 01/04/2003 =E0 19:34, Eric Marchionni a =E9crit :
> does anybody know how to drop packets with
> destination-port 80 after a limit of connections
> has been reached?
> i'd like to deny access for the attacker as soon
> as a cgi-scan has been detected.

See patch-o-matic iplimit match :

http://www.netfilter.org/documentation/pomlist/pom-base.html#iplimit

| Author: Gerd Knorr <kraxel@bytesex.org>
| Status: ItWorksForMe[tm]
|
| This adds CONFIG_IP_NF_MATCH_IPLIMIT match allows you to restrict the
| number of parallel TCP connections to a server per client IP address
| (or address block).
|
| Examples:
|
| # allow 2 telnet connections per client host
| iptables -p tcp --syn --dport 23 -m iplimit --iplimit-above 2 -j REJECT
|
| # you can also match the other way around:
| iptables -p tcp --syn --dport 23 -m iplimit ! --iplimit-above 2 -j ACCE=
PT
|
| # limit the nr of parallel http requests to 16 per class C sized
| # network (24 bit netmask)
| iptables -p tcp --syn --dport 80 -m iplimit --iplimit-above 16		\
|	--iplimit-mask 24 -j REJECT

I think it exactly fits your needs ;)

Note that someone has recently posted a patch to extend iplimit match to
UDP.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

