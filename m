From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Oulook express not working on client machine
Date: Thu, 29 Jul 2004 10:54:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051206@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> eth0: 192.168.1.97 (My Public IP)
> eth1: 192.168.5.1 (My Lan IP)
>
> I have declared 25 and 110 as the safe ports also but still :((

are you trying to proxy SMTP and POP-3 through squid?
from http://www.squid-cache.org/Doc/FAQ/FAQ-1.html#ss1.1

	"Squid is a high-performance proxy caching server for web clients, =
supporting FTP, gopher, and HTTP..."

i.e, not SMTP, not POP-3...

>
> Based on therad i saw at linux solve, I tried to do
>
> /sbin/iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/24 -j =
MASQUERADE

if you're are trying to MASQUERADE your internal clients behind the =
external IP of your firewall--you have that reversed (and the source =
network doesn't match up)--it should be:

	/sbin/iptables -t nat -A POSTROUTING -o eth0 -s 192.168.5.0/24 -j =
MASQUERADE

also--i'm assuming you are sanitizing your IP addresses here; as =
MASQUERADING behind 192.168.1.97 won't do you much good if your traffic =
is destined for the internet.

it seems to me that you're missing some of the basics here--maybe a =
review of http://iptables-tutorial.frozentux.net/iptables-tutorial.html =
would help you out?

-j

