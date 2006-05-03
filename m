From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: about dettecting different TTL value
Date: Wed, 03 May 2006 07:23:52 +0200
Message-ID: <1146633832.4841.14.camel@anduril.intranet.cartel-securite.net>
References: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>
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
To: isp@cgscomm.net
Cc: netfilter@lists.netfilter.org

Le mercredi 03 mai 2006 =E0 10:41 +0600, isp@cgscomm.net a =E9crit :
> I am new here. I am working in an ISP. I like to know that how can I
> prevent user to use multiple computer with single internet connection? I
> have searched on the web and found nothing.

Before preventing, you need to detect. And there's _plenty_ of papers
online about that. Imho, the best ways are TTL matching and IPID classes
observations.

> I think it is only possible by detecting different TTL value that comes
> from same IP address. And I didn't get any thing from the web. I like to
> know that is it possible to do with IPTABLES? And how can I detect
> defferent TTL Value with IPTABLES?

	iptables -m ttl --help

But, what do you think people will do if ISPs are begining to enforce
something like this ? Traffic normalization, which is very easy. For
instance, you can rewrite TTL field on the fly with Netfilter :

	iptables -j TTL --help

And all your traffic now exhibits the same TTL value, whatever host can
send it...


<rant>
BTW, I don't understand why there's still ISP in this world still losing
their time on detecting and preventing connection sharing. For what I
could see for some that acutally do this, they really should consider
spending their time on improving quality of service...
</rant>

--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

