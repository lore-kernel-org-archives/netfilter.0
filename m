From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: Current CVS version doesn't compile
Date: Fri, 14 Jun 2002 12:12:32 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206141212.32617.fabrice@celestix.com>
References: <002201c202cc$32e7ef40$f3c4b5cb@k768>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002201c202cc$32e7ef40$f3c4b5cb@k768>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Takuya Satoh <taka0038@yahoo.com>, netfilter@lists.samba.org


Hello,

On Friday 24 May 2002 10:39, Takuya Satoh wrote:
> iptables-1.2.6a-cvs020520:
> cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
> -DNETFILTER_VERSIO N=\"1.2.7\"  -fPIC -o extensions/libipt_REJECT_sh.o -c
> extensions/libipt_REJECT.c
> extensions/libipt_REJECT.c: In function `init':
> extensions/libipt_REJECT.c:92: structure has no member named
> `fake_source_address'

Seems like you didn't apply properly the extra/ipt_REJECT-fake-source.patch
or maybe you have kernel-header package installed, the ipt_REJECT.h from kernel-header
gets included rather than the /usr/src/linux/include/netfilter_ipv4/ipt_REJECT.h
It works fine for me.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

