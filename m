From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: cannot ping loopback address
Date: Wed, 05 Nov 2003 09:48:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068022085.803.52.camel@elendil.intranet.cartel-securite.net>
References: <JKELJHHMDHPOLKFBOEGHKEGLDAAA.cldavis@speakeasy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <JKELJHHMDHPOLKFBOEGHKEGLDAAA.cldavis@speakeasy.net>
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
To: cldavis@speakeasy.net
Cc: netfilter@lists.netfilter.org

Le mer 05/11/2003 =E0 09:18, Christopher Davis a =E9crit :
> I have setup an iptables script that will not allow me to ping
> 127.0.0.1 for some reason --=20
> Input policy is drop
> Forward and output policy is accept.  (Egress filtering on the way!)

INPUT policy is DROP. So unless you explicitly accept connections in
INPUT, anything will get dropped.
=20
> I have in the rules to allow established or related connections -- "-A
> INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> Can ping everything else.

When you ping someone, echo request goes through OUTPUT chain (state
NEW). Echo reply comes in INPUT, with ESTABLISHED state, so is accepted.

If you ping yourself (127.0.0.1 or any of your interfaces address),
packet goes through loopback (i.e. lo interface). Echo request goes to
OUTPUT with state NEW and you get it back later on INPUT chain, still on
NEW state. Because you don't have any rule to accept it, it is dropped.

It is most of the time safe to accept trafic that is coming from lo
interface (unless you want to filter local redirections). So you should
add something like this :

	iptables -A INPUT -i lo -j ACCEPT

Just after your "ESTABLISHED,RELATED" rule.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

