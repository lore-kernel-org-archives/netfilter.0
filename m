From: "Didier Hung Wan Luk" <DidierH@frci.net>
Subject: Iptables rules...
Date: Sat, 7 Sep 2002 13:39:24 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39778BFB9C25BA429794B15B50AEC78104B194@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi All,


I am new to firewall/iptables can someone help me to clear up some =
concepts about firewalling?

If my default rule for the input chain of my external interface is DROP =
need I again specify to DROP packets in the INPUT chain of my external =
interface?

i.e..

#My Default rule
iptables -P INPUT DROP

#Drop all attempts on my ext. interface trough port 6000:6063

iptables -A INPUT -i ppp0 -p tcp --dport 6000:6063 -j DROP

If I am right I think that I need not include a rule again saying to =
drop packets to my 6000;6063 ports since I do not have a rule saying to =
accept connections on these ports...

Thanks,

Didier Hung Wan Luk



