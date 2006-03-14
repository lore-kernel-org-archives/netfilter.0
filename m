From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: MAC Address filter on wireless interface
Date: Tue, 14 Mar 2006 08:59:08 +0100
Message-ID: <1142323148.4833.8.camel@anduril.intranet.cartel-securite.net>
References: <44158057.20203@4dllc.com>
	<1142262177.4809.67.camel@anduril.intranet.cartel-securite.net>
	<4416608F.1050008@4dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4416608F.1050008@4dllc.com>
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
To: Steve Comfort <steve@4dllc.com>
Cc: netfilter@lists.netfilter.org

Le mardi 14 mars 2006 =E0 08:19 +0200, Steve Comfort a =E9crit :
> mac.allow is a file we create containing permitted MAC addresses. The
> above was just a snippet, I have the same rule in place for the
> FORWARD chain.

OK. Then what I would do is check with an iptables -L -v rules counters
to verify if thoses rules actually match. And if they don't, try to
figure out why. Maybe you have one prior rule that allows all packets,
bypassing this part of the ruleset.

On the other end, I would do a mac.allow file, and put a DROP policy so
you'll never see anything go through until you get the right MAC, and
the right ruleset ;) Maybe another "customer request" ?

> Yeah, I know. Customer requirement unfortunately.

Customers...


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

