From: nakisawame <nakisawame@yahoo.com>
Subject: SSL Question
Date: Tue, 29 Jul 2003 15:49:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030729224958.57764.qmail@web41303.mail.yahoo.com>
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

Hello,

I am wondering if this will work... We are using NAT,
and I currently have 2 different webservers that we
need to put SSL on.

Each webserver has a different external DNS entry (I
am using 55.55.55.56 and 55.55.55.57 as examples).
Each actual webserver is on its own internal IP
address (192.158.0.14 and 192.168.0.15, respectively).

Can I do something like this:

iptables -t nat -A PREROUTING -p tcp -d 55.55.55.56
--dport https -j DNAT --to 192.168.0.14:443
iptables -t nat -A PREROUTING -p tcp -d 55.55.55.57
--dport https -j DNAT --to 192.168.0.15:443

Does this work? If it doesn't, how do I do this? This
is driving me nuts!

TIA!!!

-N


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

