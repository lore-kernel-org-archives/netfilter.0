From: Philip Craig <philipc@snapgear.com>
Subject: Re: Can iptables be completly built as modules?
Date: Tue, 28 Feb 2006 10:39:21 +1000
Message-ID: <44039BB9.9040807@snapgear.com>
References: <194f62550602270124l29e96900u@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <194f62550602270124l29e96900u@mail.gmail.com>
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
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@lists.netfilter.org

On 02/27/2006 07:24 PM, Clemens Eisserer wrote:
> Hi there,
> 
> I am currently working to make my Nokia770 act as a Wlan-card, however
> the default kernel does not support iptables, so I would like to
> extend it only via modules, not by recompiling the whole kernel...
> 
> Now I downloaded their cross-compilation enviroment, but when I tried
> to select "advanced router" as "m" it was not possible :-/
> 
> Any ideas or can't this be archived without a complete recompilation?

"Advanced router" is not required for iptables. It also doesn't
generate any code; it just allows other options to be selected.
But Netfilter is required, and it cannot be built as a module.

