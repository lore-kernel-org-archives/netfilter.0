From: Fabrice MARIE <fabrice-marie-sec@ifrance.com>
Subject: Re: iptables -m time does not func.
Date: Fri, 1 Nov 2002 23:40:53 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211012340.54769.fabrice-marie-sec@ifrance.com>
References: <E187by8-0007J9-00@kashyyyk.netfilter.org>
Reply-To: fabrice-marie-sec@ifrance.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E187by8-0007J9-00@kashyyyk.netfilter.org>
Content-Disposition: inline
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
To: Torsten Puls <toto@pumpum.de>, IP <netfilter@lists.netfilter.org>


Hello,

On Friday 01 November 2002 21:36, Torsten Puls wrote:
> Hello
> My Problem
> After input of dis order I get the following error message:
> iptables -A INPUT -m time --timestart 08:00 --timestop 16:00 --days Mon -j ACCEPT
> iptables: No chain/target/match by that name
> Why?

Works Fine For Me. Just to check with you.. did you follow properly the steps given in
the netfilter-extensions-HOWTO ? (since the time match is still an extension
for the moment, and is not merged in the official kernel yet..)
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html
or in German :
http://www.netfilter.org/documentation/HOWTO/de/netfilter-extensions-HOWTO.html

Then, you should be able to see the ipt_time module :
# ll /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ipt_time*
-rw-r--r--    1 root     root         2.9K Sep 18 16:20 /lib/modules/2.4.19/kernel/net/ipv4/netfilter/ipt_time.o
and the userspace pair :
# ll /usr/local/lib/iptables/libipt_time.so 
-rwxr-xr-x    1 root     root         6.5K Aug 20 18:14 /usr/local/lib/iptables/libipt_time.so*
Can you see them ?

If you cannot see either of them, it means you either forgot to recompile
your kernel, or you forgot to recompile the iptables userspace part.
Finally, if you want to use the time match or any other path-o-matic patch,
make sure you are not using your distro's iptables package, as they will
clash with the hand-installed iptables. (typically, if you use RedHat, you'd have to
# rpm -e iptables --no-deps
first, before you install you own version of iptables).

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

