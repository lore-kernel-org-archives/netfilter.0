From: "Nikolaj G." <damn_you_alexis@yahoo.com>
Subject: Example scripts with DNS and DMZ solutions
Date: Wed, 25 Feb 2004 12:18:36 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040225201836.19105.qmail@web20411.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi All,

Im in the beginning of IPTABLES and I need some
examples, especially explaining some DNS solutions. At
first, here is my setup:

I have 3 netcards in the firewall:
- 1 for the router
- 1 for DMZ
- 1 for LAN.

DMZ:
- Web server
- Mail server (DNS?)

LAN:
- DHCP server (DNS?)


My question: should I have a DNS server on the DHCP
(LAN) machine serving local requests, or only on the
Mail server (DMZ)... or maybe both and then use
forwarding?
Second, I use DHCP - I guess my DNS server will get an
automatic update.

Thanks in advance.

Nikolaj G.

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools

