From: Daniel 'NebuchadnezzaR' Dehennin <nebuchadnezzar@nerim.net>
Subject: Re: problem with p-o-m...
Date: Thu, 17 Jul 2003 16:59:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87k7ah6vx1.fsf@zion.matrix>
References: <001e01c34c70$b8f4b980$1a00a8c0@mj>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c34c70$b8f4b980$1a00a8c0@mj> (slackware9@tlen.pl's
 message of "Thu, 17 Jul 2003 16:35:51 +0200")
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

"marekjs" <slackware9@tlen.pl> writes:

>    -/pending/40_nf-log (ipv4 and ipv6 too)

Looking into pending I found :
- 40_nf-log.patch : ipv4 patch
- 40_nf-log.patch.help : p-o-m help
- 40_nf-log.patch.ipv6 : ipv6 patch
- 40_nf-log.patch.ipv6.depend
- 40_nf-log.patch.ipv6.help
- 40_nf-log.patch.userspace : patch to userspace//extensions/libipt_ULOG.c

For me the 40_nf-log doen't apply by when I make patch my kernel
source by hand with the 40_nf-log.path and the ipv6 one in dry-run
mode, everything seems to be correct.

I suppose it come from the userspace patch, which should be in
userspace directory, isn't it ?

-- 
Daniel 'NebuchadnezzaR' Dehennin


