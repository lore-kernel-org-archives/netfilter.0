From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Allowing FTP and internal but nothing else
Date: Wed, 03 Mar 2004 18:20:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078334449.2601.33.camel@anduril.intranet.cartel-securite.net>
References: <4A8849EC2E153F41B6CECD20C81BC63BD11E66@wolfcreek.skld.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4A8849EC2E153F41B6CECD20C81BC63BD11E66@wolfcreek.skld.net>
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
To: Paul Harlow <pharlow@skld.com>
Cc: netfilter@lists.netfilter.org

Le mer 03/03/2004 =E0 17:55, Paul Harlow a =E9crit :
> I have an FTP server that I would like to filter out all external
> traffic except ftp and ftp-data. This same server has an internal
> interface that I would like to allow everything on the inside to have
> access to. Given what I've read I have come up with this general idea
> of what to put into a filter table for now. Please let me know what
> your gurus of netfilter think.

I am not a guru, but I do think you should read docs... See
http://www.netfilter.org/ documentation section (HOWTOs and tutorials).

> iptables -I INPUT -i eth0 -j ACCEPT
> iptables -I INPUT -i eth1 -d port 21 -j ACCEPT
> iptables -I INPUT -i eth1 -d port 20 -j ACCEPT
> iptables -I INPUT -i eth1 -j deny

It won't work at all.
Firstly, -I inserts rule at top of chain. This the first rule for eth1
will be the "deny all" one (your last rule). So FTP won't work.
Secondly, your FTP description is nor exact nor functional. TCP/20 is
used as source by FTP server for active data transfert, so you do not
need to open it in INPUT. But for passive data transfert, you need to
open all unpriviledge ports range (1024:65535) to accept data connection
from client.
And thirdly, "deny" is not a valid target for iptables. You have to use
DROP.

Netfilter is stateful and can handle FTP using conntrack. So use it :

	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	iptables -A INPUT -m state --state NEW -p tcp --dport 21 \
				-j ACCEPT

This will be enough to handle the full FTP session.

To me, the full ruleset to achieve what you want should be :

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -m state --state NEW -j ACCEPT
iptables -A INPUT -i eth1 -m state --state NEW -p tcp --dport 21 \
			--syn -j ACCEPT


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

