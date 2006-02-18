From: angico <angico@yahoo.com>
Subject: string match "--algo" option
Date: Sat, 18 Feb 2006 01:22:36 -0800 (PST)
Message-ID: <20060218092236.25320.qmail@web36804.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi!
i'm trying to use the string match in a rule like this
# iptables -A INPUT -s 1.2.3.4 -m string --string 'abc' -j TARPIT
but it says 'You must specify --algo'.
"iptables -m string --help" doesn't help at all.
the "netfilter extensions howto" also doesn't mention this option.
does anybody have any hint on what this option mean and what parameter
to use with it?
thanks in advance,
angico.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

