From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools fails to compile
Date: Mon, 04 Jun 2007 16:12:31 +0200
Message-ID: <46641DCF.10005@netfilter.org>
References: <20070602103248.62320224@snoopy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070602103248.62320224@snoopy>
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
To: t@tomdeb.org
Cc: netfilter@lists.netfilter.org

t@tomdeb.org wrote:
> Hi,
> 
> I am trying to compile conntrack-tools on centos5. After
> successfully built and installed rpms of libnfnetlink and
> libnetfilter_conntrack, I get the following error when making
> conntrack_tools:
> 
> In file included from /usr/include/sys/uio.h:24,
>                  from /usr/include/sys/socket.h:27,
>                  from /usr/include/libnfnetlink/libnfnetlink.h:19,
>                  from proxy.c:19:
> /usr/include/sys/types.h:62: error: conflicting types for 'dev_t'
> /usr/include/linux/types.h:13: error: previous declaration of 'dev_t'

This problem was already fixed. Are you using lastest versions of
libnfnetlink and libnetfilter_conntrack?

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

