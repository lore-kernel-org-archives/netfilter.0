From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ICMP types to allow
Date: Wed, 21 Dec 2005 20:22:09 +0100
Message-ID: <1135192930.4872.4.camel@anduril.intranet.cartel-securite.net>
References: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
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
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

Le mercredi 21 d=E9cembre 2005 =E0 08:45 -0500, Derick Anderson a =E9crit :
> I know that some networks just drop all ICMP to prevent traceroutes but
> recently I've been been seeing problems related to fragementation and
> MTU and wondering if dropping ICMP is causing some of that (since
> Fragementation Needed packets can't get through). On the flip side of
> that there's the Source Quench and Fragmentation Needed DoS attacks
> which have recently become mildly popular (I've gotten a few hits on
> Snort but not that many).=20

ICMP is part of IP mechanisms. Break ICMP, you break IP. That's just as
simple as this. Regarding "recent" ICMP DoSes, protections have been
proposed (and added) to mitigate them, such as TCP sequence number check
in ICMP citation.

In addition to this, Netfilter, unlike some popular proprietary
products, provide a proper stateful ICMP filtering. Just use it. Valid
ICMP errors will fall into RELATED state, others will be INVALID.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

