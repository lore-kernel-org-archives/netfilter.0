From: "Walter Priesnitz Filho" <walterp@via-rs.net>
Subject: Blocking Squid Requests
Date: Wed, 7 May 2003 09:05:38 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001801c31490$fd031670$7107a8c0@maninho>
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
To: IPTables <netfilter@lists.netfilter.org>

Hi,
I have this environment, a subnetwork (192.168.0.0) that access another
subnetwork (192.168.59.0) and then access the internet. The second lan has a
proxy server (squid:3128).
I need to block the requests in th first lan to the squid server to some
sites. How can I do this?
I've tried this
iptables  -A FORWARD -p tcp -m multiport --dport 80,443,3128 -d
www.someplace.com -j DROP
but doesn't work.
Can anybody help-me?

Regards,
      Walter
--------------------------------------------
  Walter Priesnitz Filho - UIN 121745902
  http://camva.ucs.br/~walterp/
  Linux user 268789 - http://counter.li.org/
--------------------------------------------


