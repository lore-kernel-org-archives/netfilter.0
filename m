From: "AB" <sinaasappelsap@planet.nl>
Subject: HELP SSL-problem
Date: Thu, 6 Jun 2002 21:05:25 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <GGECKAHHDGDOOLALHDJFCEIKCAAA.sinaasappelsap@planet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello everybody, I hope someone out there can help me with a problem I have
:-)

Recently I compiled the 2.4.18 version of the Linux kernel. I am using
IPtables with one rule in it:

	iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Internet works fine but I bump into trouble trying to reach an internet
banking site.
It uses https. The first few pages work well but when I have authenticated
and
want to see my account it seems to timeout.
The same problem occurred when I tried to subscribe to a hotmail account.

I've tried other https pages and they work just fine.
I've tried to pinpoint the problem with tcpdump and with ethereal but I
can't find it.
I know now that ssl3 is used and that it DOES work when I establish a direct
connection
(not through the Linux router)....

PLEASE anyone HELP ME... Tell my I'm stupid and please tell me what I'm
doing wrong.

If there's any config or log or whatever file you want to see, let me know
:-)

Thank you, for reading this. Arjan.


