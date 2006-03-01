From: Philip Craig <philipc@snapgear.com>
Subject: Re: Problem with CONNMARK
Date: Wed, 01 Mar 2006 14:17:33 +1000
Message-ID: <4405205D.9020803@snapgear.com>
References: <200603010355.51074.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200603010355.51074.tommy@svearike.sytes.net>
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
To: Tommy W <tommy@svearike.sytes.net>
Cc: netfilter@lists.netfilter.org

On 03/01/2006 12:55 PM, Tommy W wrote:
> # iptables -A PREROUTING -t mangle -i eth4  -j CONNMARK --restore-mark
> iptables: No chain/target/match by that name
> 
> What's missing ?
> I do HAVE the module libipt_CONNMARK.so

It looks like your userspace iptables supports it,
but it is not enabled in your kernel.
Note that /usr/local/lib/iptables/libipt_CONNMARK.so is not
a kernel module.


