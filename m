From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: NAT for IPv6
Date: Thu, 11 Mar 2004 01:24:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078964663.2666.2.camel@anduril.intranet.cartel-securite.net>
References: <63B4989DE77A11468B4562182B203AD10EBAF4@cole.ad.nps.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <63B4989DE77A11468B4562182B203AD10EBAF4@cole.ad.nps.navy.mil>
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
To: "Phillips, Matthew USA" <mdphilli@nps.navy.mil>
Cc: netfilter@lists.netfilter.org

Le jeu 11/03/2004 =E0 00:58, Phillips, Matthew USA a =E9crit :
> Is it possible to do strictly v6 to v6 NAT'ing

Yes, one can do this.

> So, my question is, is it possible to port over the NAT functionality
> from iptables to ip6tables and also, has it been done already? Thanks
> for any input.

It's not planed for Netfilter, and afaik won't be. But I guess one can
implement this. But, conntrack for IPv6 will be necessary first, and
it's not done yet either.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

