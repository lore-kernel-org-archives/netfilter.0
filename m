From: "Jorge Agrelo" <jagrelo@novadevices.com>
Subject: Re: Limit module accept negation?
Date: Fri, 14 Jan 2005 09:36:11 -0500
Message-ID: <41E7928B.29373.52B9723@localhost>
References: <41E71E70.4080703@cookinglinux.org>
Reply-To: jagrelo@novadevices.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <41E71F62.30208@cookinglinux.org>
Content-description: Mail message body
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
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

Thanks Samuel, after I apply the patch, How look like the rule with 
limit to drop packets flowing above 1p/s

Regards

On 13 Jan 2005 at 20:24, Samuel Jean wrote:

> Samuel Jean wrote:
> > The patch below is against ipt_limit.c from 2.6.10. It's *untested* but 
> > reflects what I told you. It's just an exemple of how you can make
> > this module behaving the other way arround.
> > 
> 
> Doh! crapy patch. Attached good one. I hope.
> 




