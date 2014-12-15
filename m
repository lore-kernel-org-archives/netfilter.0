From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: Re: Issue with specifying interface/NIC name with drop packets rule
Date: Sun, 14 Dec 2014 19:49:53 -0800
Message-ID: <CALPbv1-meQ1Nv3LLTaHa4W192K0AUAdnSEsSLBjAhaC65e6STA@mail.gmail.com>
References: <CAHRwiV37vEOmsFThw+Hhfjqb1SA05aZEUGBm1JQEB+-2WfnWWQ@mail.gmail.com>
	<CAHRwiV0AxxPXj7OW=V4_SLKKXirdDpb5mQj1eV4Pjia9JzHTBQ@mail.gmail.com>
	<CALPbv19G704czh3jKZmRpEgfdd65wxHsNpje=5n_UCr7qOOxsQ@mail.gmail.com>
	<201412131513.30049.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=WPIRdj95K+F9UFrUFNqkwOT6rKb1q31Jdw2C+d6LHzM=;
        b=cTSizdRFuUdktkTQ3sj2kcAJbydF2SnsROM3p+hYYDpvDrVK6KLXkG6KTTTaLWnSAM
         EwjrvS2yzSEkXQdk/Lbiyi8NXtvdpFJ0rTPntfXjJXpx/cCbdP0IA+6vNU8zVpO51WIj
         7Pv9l7CJvBECG5g3e1kVHZBYNXJrHJjoZ/anS5iV2qXtMMJ/tP6q04JvSC3NvLzmxusr
         t1RkHkmVCeMMaqDYHvbe13RpdJunXaivdG4QOT4BrG0h9i6SdxbjeZFbQa60xPqlzd21
         WM+2YTm3xYNh2sYj4KsOxUg2aR5Jns61i4F0QJCug4r5iPM9LxzHpKH7uT/teyRYfCxJ
         VlPQ==
In-Reply-To: <201412131513.30049.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: neal.p.murphy@alum.wpi.edu
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

From:
http://www.netfilter.org/documentation/FAQ/netfilter-faq-4.html#ss4.5
http://www.bani.com.br/2012/05/programmatically-managing-iptables-rules-in-c-iptc/

4.5 Is there an C/C++ API for adding/removing rules?

The answer unfortunately is: No.

Now you might think 'but what about libiptc?'. As has been pointed out
numerous times on the mailinglist(s), libiptc was _NEVER_ meant to be
used as a public interface. We don't guarantee a stable interface, and
it is planned to remove it in the next incarnation of linux packet
filtering. libiptc is way too low-layer to be used reasonably anyway.

We are well aware that there is a fundamental lack for such an API,
and we are working on improving that situation. Until then, it is
recommended to either use system() or open a pipe into stdin of
iptables-restore. The latter will give you a way better performance.

On Sat, Dec 13, 2014 at 12:13 PM, Neal Murphy
<neal.p.murphy@alum.wpi.edu> wrote:
> On Tuesday, November 25, 2014 12:45:35 PM Vijay Viswanathan wrote:
>> ya,
>> I faced same issue, the ipt library cannot be used directly. They
>> warned in the Readme.
>
> This doesn't really make sense; iptables itself has to use the lib directly.
> Miniupnpd and Smoothwall's ipbatch both use the lib directly.
>
> N
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
