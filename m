From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: mac/ip match
Date: Thu, 18 Sep 2003 20:57:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063911472.844.7.camel@elendil.intranet.cartel-securite.net>
References: <1063909559.19096.12.camel@tux>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063909559.19096.12.camel@tux>
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
To: "M. Ziya Ozudogru" <e116132@metu.edu.tr>
Cc: netfilter@lists.netfilter.org

Le jeu 18/09/2003 =E0 20:26, M. Ziya Ozudogru a =E9crit :
> Here comes the problem.. How can i define in iptables to use these arp
> rules and give access only the one addresses that match the rules and
> should block all the others ( well i want to block the others [unused i=
p
> addresses by using iptables mac macth module ] ) . ? Any hints ?

See mac match :

cbr@elendil:~$ iptables -m mac --help
[...]
MAC v1.2.8 options:
 --mac-source [!] XX:XX:XX:XX:XX:XX
                                Match source MAC address

Now, you just have to implement rules matching source mac address and
source IP address.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

