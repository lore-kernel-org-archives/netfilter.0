From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How to drop arps when protocol addrs of sender = target
Date: Thu, 11 Sep 2003 14:14:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063282486.990.4.camel@elendil.intranet.cartel-securite.net>
References: <3F5F598A.3080609@nist.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5F598A.3080609@nist.gov>
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
To: Chris Schanzle <nospam@nist.gov>
Cc: netfilter@lists.netfilter.org, schanzle@nist.gov

Le mer 10/09/2003 =E0 19:04, Chris Schanzle a =E9crit :
> I have a need to not respond to arps where the protocol address of the=20
> sender is the same as the target, which is the case when Windows client=
s=20
> try to ARP for the manually-configured address it is about to use.

It is not easy to achieve as you would need a specific match extensions
for that compares protocole source and destination addresses for
arptables or ebtables (iptables does not filter ARP). I wanted to write
something like this to spot wierd ARP stuff, but I do not have the time
for now. However, enhancing ebtables arp match is quite an easy thing. I
did not look at arptables, but it must be easy too.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

