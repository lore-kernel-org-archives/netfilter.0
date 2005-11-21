From: Philip Craig <philipc@snapgear.com>
Subject: Re: Fix For: conntrack: error while loading shared
 libraries:	libnetfilter_conntrack.so.1:
 cannot open shared object file:	No such file or directory
Date: Mon, 21 Nov 2005 11:12:51 +1000
Message-ID: <43811F13.10802@snapgear.com>
References: <1b6df0140511181228m2a336caex7e673252d9ff365d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1b6df0140511181228m2a336caex7e673252d9ff365d@mail.gmail.com>
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
To: Marcus Aurelius <hellou@gmail.com>
Cc: netfilter@lists.netfilter.org

On 11/19/2005 06:28 AM, Marcus Aurelius wrote:
>  is the conntrack-0.99 Makefile the entry libdir = ${exec_prefix}/lib
> seemed ok, so I don't know why conntrack would not see /usr/local/lib,
> any ideas?

Does your /etc/ld.so.conf contain /usr/local/lib?

