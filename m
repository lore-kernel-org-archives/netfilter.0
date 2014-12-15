From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Issue with specifying interface/NIC name with drop packets rule
Date: Sun, 14 Dec 2014 23:33:27 -0500
Message-ID: <201412142333.27783.neal.p.murphy@alum.wpi.edu>
References: <CAHRwiV37vEOmsFThw+Hhfjqb1SA05aZEUGBm1JQEB+-2WfnWWQ@mail.gmail.com> <201412131513.30049.neal.p.murphy@alum.wpi.edu> <CALPbv1-meQ1Nv3LLTaHa4W192K0AUAdnSEsSLBjAhaC65e6STA@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv1-meQ1Nv3LLTaHa4W192K0AUAdnSEsSLBjAhaC65e6STA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sunday, December 14, 2014 10:49:53 PM Vijay Viswanathan wrote:
> From:
> http://www.netfilter.org/documentation/FAQ/netfilter-faq-4.html#ss4.5
> http://www.bani.com.br/2012/05/programmatically-managing-iptables-rules-in-
> c-iptc/
> 
> 4.5 Is there an C/C++ API for adding/removing rules?
> 
> The answer unfortunately is: No.
> 
> Now you might think 'but what about libiptc?'. As has been pointed out
> numerous times on the mailinglist(s), libiptc was _NEVER_ meant to be
> used as a public interface. We don't guarantee a stable interface, and
> it is planned to remove it in the next incarnation of linux packet
> filtering. libiptc is way too low-layer to be used reasonably anyway.
> 
> We are well aware that there is a fundamental lack for such an API,
> and we are working on improving that situation. Until then, it is
> recommended to either use system() or open a pipe into stdin of
> iptables-restore. The latter will give you a way better performance.

In other words, if you want custom program control, hack iptables or mimic 
what iptables does. This is what Smoothwall did and I'm sure miniupnpd did.

It wasn't too hard to update ipbatch from iptables 1.3.8 to 1.4.14. And 
ipbatch turned out to be about 5% more efficient than iptables-restore. Shoot, 
it was almost as difficult to figure out how to fix the GNU C++ syntax changes 
between v3.5 and v4.7.

Just because something *shouldn't* be done doesn't mean that it *can't* be 
done.

N

> 
> On Sat, Dec 13, 2014 at 12:13 PM, Neal Murphy
> 
> <neal.p.murphy@alum.wpi.edu> wrote:
> > On Tuesday, November 25, 2014 12:45:35 PM Vijay Viswanathan wrote:
> >> ya,
> >> I faced same issue, the ipt library cannot be used directly. They
> >> warned in the Readme.
> > 
> > This doesn't really make sense; iptables itself has to use the lib
> > directly. Miniupnpd and Smoothwall's ipbatch both use the lib directly.
> > 
> > N
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
