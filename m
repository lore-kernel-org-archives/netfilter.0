From: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Subject: Re: about dettecting different TTL value
Date: Wed, 03 May 2006 13:53:16 +0800
Message-ID: <4458454C.9080705@inxsoft.net>
References: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>	
	<44583D20.6010703@inxsoft.net>
	<1146634258.4841.19.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1146634258.4841.19.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Hello Cedric,

Cedric Blancher wrote:
> Le mercredi 03 mai 2006 =E0 13:18 +0800, Thomas Kuiper a =E9crit :
>=20
>>I think you want to filter with ebtables (like some cable ISP's do) based=
 on=20
>>the mac address. ttl is not good for that.
>=20
>=20
> 1. You can spoof MAC address, there's no big deal about it, even on
> Windows. Most soho routers have a "MAC cloning" functionnality  that
> exactly does this.

You can spoof anything. :-) I just wanted to point out that mac filtering i=
s=20
definetly better than being based on ttl.

> 2. ISP only sees router's MAC address, may be 1 or 20 hosts behind it.

ISP's that filter are bad and ethernet isn't really designed to be secure=20
for that. But thats wasn't question here. Whats your solution?

Thomas

