From: "Spiro Azkoul" <spiro@snacorp.net>
Subject: Strange behavior
Date: Mon, 14 Jun 2004 02:54:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406140954.i5E9sbbJ002976@ylpvm15.prodigy.net>
References: <516423986E18D511B0A700508BB85789027F2A83@edi002ex.idzedi.admin.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <516423986E18D511B0A700508BB85789027F2A83@edi002ex.idzedi.admin.ch>
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

OK I've been toying with this all weekend, its 3 A.M and it is still funky,
thank God some of you are awake. 
Her is the deal, I have over 200 rules in the INPUT chain, which I entered
using: iptables -I INPUT -s ........ -j DROP. 
I never used the -I [rulenumber] option. So after entering all the rules, I
entered iptables -A INPUT  for http, smtp, pop, and other services. 
Now, when I turned it on, nothing was going through. 
I tried to iptables -I 100 INPUT -s 0/0 -p tcp ---dport 80 -j ACCEPT and it
did not work
I tried it but with [1] and it worked. 
I am perplexed!!!
Any feedback please?




