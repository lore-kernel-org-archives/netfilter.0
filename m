From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Setting TOS in POSTROUTING mangle table
Date: Wed, 06 Oct 2004 18:15:00 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097079300.2976.14.camel@anduril.intranet.cartel-securite.net>
References: <E0E0E80CC865BFEC576183B5@[10.169.6.246]>
	<1097078302.5214.10.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1097078302.5214.10.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Le mer 06/10/2004 =E0 17:58, Jason Opperisano a =E9crit :
> if the netfilter box is also the traffic shaper--set TOS in PREROUTING
> so that that tc filters have the TOS values available to make a
> decision.

As TOS value will only be used within the box, I would prefer use fwmark
as QoS key. I won't alter IP header this way and result will be exactly
the same.

I use TOS mangling when I need my routing/QoS "key" to get exported over
the network so it can be used by others systems.


For Kenneth : if you still want to use TOS, I would reset it to 0 in
POSTROUTING chain, as some silly guys drop packets with non null TOS
value.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

