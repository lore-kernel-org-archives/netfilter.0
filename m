From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: MAC Address filtering
Date: Thu, 15 Feb 2007 10:08:32 +0100
Message-ID: <1171530512.4229.24.camel@anduril.intranet.cartel-securite.net>
References: <907894.27356.qm@web43118.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <907894.27356.qm@web43118.mail.sp1.yahoo.com>
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
To: Allan Parreno <atparreno@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le mercredi 14 f=E9vrier 2007 =E0 22:37 -0800, Allan Parreno a =E9crit :
> Computer1:  99:99:99:99
> Computer2:  98:98:98:98
> Computer3:  97:97:97:97

MAC addresses are 48 bits long, thus 6 hexa digits couples, not 4...

> Now I want those computers1,2 and 3 can access the net, all others
> will be block.

Just have to match their MAC address for an ACCEPT rule.

iptables -m mac --help


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

