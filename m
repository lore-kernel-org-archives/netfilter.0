From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: can netfilter work on arp packet?
Date: Wed, 21 Sep 2005 09:09:45 +0200
Message-ID: <1127286585.5509.0.camel@anduril.intranet.cartel-securite.net>
References: <011701c5be72$6e76b630$060ae29f@javaboy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <011701c5be72$6e76b630$060ae29f@javaboy>
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
To: jywang <jywang@cnic.cn>
Cc: netfilter <netfilter@lists.netfilter.org>

Le mercredi 21 septembre 2005 =E0 14:05 +0800, jywang a =E9crit :
> if there are some hooks with which i can look deeply in other packets,
> i.e. ARP.

Ebtables and arptables do the trick.

	http://ebtables.sourceforge.net/


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

