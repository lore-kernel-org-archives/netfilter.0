From: Pablo Neira Ayuso <pablo@eurodev.net>
Subject: Re: string help
Date: Mon, 26 Dec 2005 14:03:18 +0100
Message-ID: <43AFEA16.1070103@eurodev.net>
References: <20051224073209.54921.qmail@web35908.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051224073209.54921.qmail@web35908.mail.mud.yahoo.com>
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
To: Noman Liaquat <khankhn1@yahoo.com>
Cc: netfilter@lists.netfilter.org

Noman Liaquat wrote:
> I want to replace string "hello" with "abcd" how i
> could do with iptables mangle, patch-o-matic is
> working fine

Firstly, since kernel >= 2.6.14 you don't need the string match in
pom-ng anymore.

About your question: such kind of replacement that you want to do is
evil. Think about a TCP connection, if you modify the size of the packet
the sequence number will be corrupted. So, adding support for replacing
a string with another string of the same size would be fine. Whatever
else would be broken.

-- 
Pablo

