From: "Rio Martin." <rio@martin.mu>
Subject: Re: string match
Date: Fri, 3 Sep 2004 13:13:35 +0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409031313.35772.rio@martin.mu>
References: <Pine.GSO.4.60.0409021351530.17248@positron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.60.0409021351530.17248@positron>
Content-Disposition: inline
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

On 02 September 2004 pm 21:01, Marcelo Eller de Amorim - CAT wrote:
> Hi!
> I would like to know how to use the STRING MATCH module under kernel
> 2.6.x, I tried to use the patch-o-matic-ng and this patch said that this
> module is already applied, but when I access the configuration menu of the
> kernel, this module does not appear to be selected.
> I set the configuration menu to show all the option including the
> (EXPERIMENTAL) ones, but it does not take effect.
> I'm suspecting that this module isn't compile on the kernel anymore
> becouse the iptables-2.6.11 has this module inside it, but I tried to use
> it without success.
> I'm using the SuSE 9.1 | Kernel 2.6.4-52-default | iptables-2.6.9
> Any help would be usefull.
> Thanks



Try it on latest kernel of 2.4.xx first, 
Because i've tried many patches of POM didnt work with 2.6 kernel.

- Rio.Martin -

