From: "Dmitry L. Donskih" <donskih@delna.ru>
Subject: REDIRECT outgoing packets -- how?
Date: Mon, 9 Feb 2004 12:59:12 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <164332529593.20040209125912@mail.ru>
Reply-To: DD <9222653@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everyone.

I am trying to make some outgoing IP packets (from my linux box
itself, not forwarded) be redirected to a port on localhost. And it
doesn't work just because any such packet can be caught by a NAT rule
only after "routing decision". So even NAT-ed packets leave the box
anyway.

Example:
I want TCP packets from (localhost):10000 to (any_host):80 be
redirected to (localhost:8080).
I could use

   iptables -t nat -A PREROUTING -p tcp -s 12.34.56.78 --sport 10000 \
   --dport 80 -j DNAT --to-destination 12.34.56.78:8080

but it doesn't work (and, it shouldn't) -- for only POSTROUTING and OUTPUT
chains are available for outgoing packets.

(By the way, REDIRECT for local packets (originally from and to localhost)
works fine)

Is there any other way to DNAT/REDIRECT outgoing packets to localhost?

System: RedHat 7.2 (2.4.7-10), iptables 1.2.6a

Thanks in advance for assistance.

P.S. Please CC: your reply to donskih@delna.ru.

-- 
WBR,
 Dmitry                          mailto:donskih@delna.ru


