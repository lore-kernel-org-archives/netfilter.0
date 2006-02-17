From: angico <angico@yahoo.com>
Subject: can't -j TARPIT
Date: Fri, 17 Feb 2006 01:01:39 -0800 (PST)
Message-ID: <20060217090139.4088.qmail@web36803.mail.mud.yahoo.com>
References: <43F4E183.2020508@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43F4E183.2020508@trash.net>
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

hi, all!
i'm trying this:

iptables -A INPUT -s 1.2.3.4 -j TARPIT

but iptables says "no chain/target/match by that name", although
libipt_TARPIT.so is present in /lib/iptables/

i'm running kernel 2.6.15. any hints on what's wrong?
thanks in advance,
angico.


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

