From: Jason Opperisano <opie@817west.com>
Subject: Re: Cannot use iptable extensions
Date: Mon, 20 Sep 2004 10:36:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095690990.1898.41.camel@wolfpack.ljm.dom>
References: <20040920082059.57559.qmail@web805.mail.yahoo.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040920082059.57559.qmail@web805.mail.yahoo.co.jp>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-09-20 at 04:20, d l wrote:
> Hi,
> I am using vanilla Fedora Core 2, without configuring
> firewall in anaconda during initial install.
> 
> Simple rules seems to works with built in modules. e.g. 
> iptables -A INPUT -p ICMP -j DROP
> 
> However when I tried to use extension modules like
> <connlimit> and <owner>, iptables always gives me error.
> 
> For <owner>:
> iptables -m owner --help
> .......
> OWNER match v1.2.9 options:
> [!] --uid-owner userid     Match local uid
> [!] --gid-owner groupid    Match local gid
> [!] --pid-owner processid  Match local pid
> [!] --sid-owner sessionid  Match local sid
> [!] --cmd-owner name       Match local command name
> 
> # iptables -A INPUT -m owner --cmd-owner mlnet -j test
> iptables: Invalid argument

the owner match is only valid in the OUTPUT chain, for what should be
obvious reasons, but may not be...

refer to:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

for more information.

> # iptables -m owner --cmd-owner
> iptables v1.2.9: Unknown arg `--cmd-owner'
> Try `iptables -h' or 'iptables --help' for more
> information.

this is simply an invalid commmand, as you have no -[AID] specified...

man iptables
if you don't understand my comment.

> And similar results with <connlimit> extension.
> 
> There are corresponding so files in /lib/iptables for that
> 2 extensions.
> /lib/iptables/libipt_connlimit.so
> /lib/iptables/libipt_owner.so

those are the libraries for the "iptables" command itself.  i doubt that
FC2 has the connlimit kernel module compiled by default.  if it does:

ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/*connlimit*

will return something along the lines of:

ipt_connlimit.o

my money is on the fact that it isn't there.

> So what is wrong with my iptables? It looks like that it
> didn't load the extensions properly to me.
> 
> Any help is appreciated.

if you need additional extensions beyond what your distribution
provides, read:

http://netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.html

and have at it.

not to assume anything--but i'll go ahead and answer your next post now:

after you patch & recompile your kernel--you must recompile your
"iptables" userland package for everything to work properly.

-j

-- 
Jason Opperisano <opie@817west.com>


