From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: patch-o-matic and userpace
Date: Fri, 21 Feb 2003 16:58:41 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302211658.41402.fabrice@netfilter.org>
References: <5.2.0.9.2.20030220121447.01c5bbb0@172.26.0.8>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.2.20030220121447.01c5bbb0@172.26.0.8>
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
To: Luis Miguel Cruz Miranda <luismi@b2bi.es>, netfilter@lists.netfilter.org

On Thursday 20 February 2003 19:18, Luis Miguel Cruz Miranda wrote:
> Hi all again,
> I am trying to use the patch called
> 'userspace/ipt_REJECT-fake-source.patch' As I read, if I use that patch I
> need to recompile iptables user programs.
> The problems is that I can't use that patch because I don't know have any
> idea how to patch iptables source code.
> I have this tree:
> |-- iptables-1.2.7a
> |   |-- extensions
> |   |-- include
> |   |   |-- libippool
> |   |   |-- libipq
> |   |   |-- libiptc
> |   |   |-- libipulog
> |   |   `-- linux
> |   |       |-- netfilter_ipv4
> |   |       `-- netfilter_ipv6
> |   |-- ippool
> |   |-- libipq
> |   |-- libiptc
> |   `-- libipulog
> |-- patch-o-matic -> patch-o-matic-20030218
> |-- patch-o-matic-20030218
> |   |-- base
> |   |-- broken
> |   |-- extra
> |   |-- not-accepted
> |   |-- obsolete
> |   |-- oldnat
> |   |-- optimizations
> |   |-- pending
> |   |-- submitted
> |   `-- userspace
> `-- userspace -> iptables-1.2.7a
> Is it correct to patch iptables-1.2.7a?

Should be correct. Then you
# cd patch-o-matic
# ./runme userspace/ipt_REJECT-fake-source.patch
if the patch tells you it applied correctly then
you need to recompile your kernel then
# cd ../userspace
# make all install

reboot with your clean kernel. If the patch doesn't apply for some reason,
let me know.

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

