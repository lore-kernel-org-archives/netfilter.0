From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Remote Access Via Mac Address and Unknown IPs
Date: Mon, 12 Mar 2007 06:44:41 +0100
Message-ID: <1173678281.7841.1.camel@anduril.intranet.cartel-securite.net>
References: <45F4B8CC.390FD831@isp-systems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F4B8CC.390FD831@isp-systems.com>
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
To: OTR Comm <otrcomm@isp-systems.com>
Cc: netfilter@lists.netfilter.org

Le dimanche 11 mars 2007 =E0 19:19 -0700, OTR Comm a =E9crit :
> I have seached Google and the archives but I can not find anything that
> tells me how to use iptables and mac addresses to allow a user at a
> remote location to access a server when the remote IP address is
> unknown.

You can't. A host MAC address is only visible on local network. After
the first router, you don't see it anymore...


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

