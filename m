From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: about dettecting different TTL value
Date: Wed, 03 May 2006 07:30:58 +0200
Message-ID: <1146634258.4841.19.camel@anduril.intranet.cartel-securite.net>
References: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>
	<44583D20.6010703@inxsoft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44583D20.6010703@inxsoft.net>
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
To: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Cc: netfilter@lists.netfilter.org

Le mercredi 03 mai 2006 =E0 13:18 +0800, Thomas Kuiper a =E9crit :
> I think you want to filter with ebtables (like some cable ISP's do) based=
 on=20
> the mac address. ttl is not good for that.

1. You can spoof MAC address, there's no big deal about it, even on
Windows. Most soho routers have a "MAC cloning" functionnality  that
exactly does this.

2. ISP only sees router's MAC address, may be 1 or 20 hosts behind it.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

