From: "andre" <ad7@gmx.at>
Subject: NAT HOWTO; iptables, man pageM; Errata
Date: Thu, 19 Dec 2002 10:47:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c2a743$993303e0$fa00a8c0@testmachine>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.samba.org

Dear Rusty Russell,
First of all, I must apologise if I use a wrong email-adress, but this
was the only one I found in the HowTo.

The HowTo descripes following:
6.2. Destination NAT
...
## Change destination addresses of web traffic to 5.6.7.8, port 8080.
# iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0 \
        -j DNAT --to 5.6.7.8:8080

The "--dport" option is available only if the extended packet matching
modules are loaded.
Altought the man page says, that the extended packet matching modules
are loaded implicity, when -p or --protocol is specified, the only way
to load them in Version 1.2.2 is to set the -m option.

So the way it works look like this
## Change destination addresses of web traffic to 5.6.7.8, port 8080.
# iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -i eth0 \
        -j DNAT --to 5.6.7.8:8080

Best regards
Ein herzliches Servus aus Wien
Andr=E9 Dostal
mailto: ad7@gmx.at


