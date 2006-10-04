From: Thomas <t.munker@gmx.net>
Subject: POM, random, unclean, psd match and other
Date: Wed, 04 Oct 2006 20:05:38 +0200
Message-ID: <4523F7F2.2040608@gmx.net>
Reply-To: t.munker@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

hi,

in short form: where do i get random, unclean, psd for example to work
in my 2.6.16.29 kernel?
i wanted to use some matches, but i am only getting following message:
iptables: No chain/target/match by that name
for unclean
and
iptables v1.3.6: Couldn't load match
'random':/usr/local/lib/iptables/libipt_random.so: cannot open shared
object file: No such file or directory
for random, psd, osf, and others
because auf this i checked netfilter.org and got the newest
version(1.3.6) and checked my kernel for support of that match. But
there is no option to enable in my kernel configuration.
That is why i got pom from the ftp, patch-o-matic-ng-20061003.
but that did give me the option to install that patches.
I looked at iptable sources and saw that there is the C-file for random
(and so on), but no .o or .so file. Only unclean had them.
So here is my question again, how do i get random psd and so on to work?
I think it isn't in my kernel, and i have to get it in there, but how?
patch-o-matic doesn't offer it!

Regards and thanks, Thomas

