From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Unable to block ICMP
Date: Tue, 17 Apr 2007 08:12:41 -0700
Message-ID: <1176822761.2408.14.camel@anduril.intranet.cartel-securite.net>
References: <46224132.4080702@gmail.com>
	<78a2adce0704150816o77d64848x5982caafd70c30df@mail.gmail.com>
	<46224EFE.6060409@gmail.com>
	<78a2adce0704150914y4e9fd552m8e316ebd1b00ae79@mail.gmail.com>
	<46225C81.6070503@gmail.com>
	<20070417094611.GD13613@torres.zugschlus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070417094611.GD13613@torres.zugschlus.de>
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
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

Le mardi 17 avril 2007 =E0 11:46 +0200, Marc Haber a =E9crit :
> Bad idea. All you're going to achive is that everybody knows "there is
> something that is frantically trying to be invisible", which is kind
> of a beacon instead of "blending into the crowd".

I agree. Moreover, a non-existent host is signaled by ICMP errors in
normal operation.

Say your packet reaches the router attached to network containing target
IP address and there's no host on that very IP address. Then router will
issue an ARP request and won't get any answer. In this case, it should
send back a Host Unreachable ICMP message.

It's a very common mistake around to think that probing non existing
hosts don't generate any answer...


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

