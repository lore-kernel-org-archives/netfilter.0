From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Kernel-2-6 and iptables issue
Date: Wed, 8 Aug 2007 21:48:08 +0200
Message-ID: <1814bfe70708081248o7f369e8ha842d591e55826db@mail.gmail.com>
References: <46B9C8A9.6010805@intv.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=DX20AfHlhbRtO0Jy7CMDFRkOumeRmv0Ckaby8jBCHbpDHO6upQJrJgf8tl3Qlh1ARHtgz1840Zr4BPS5be85KZmihgMQd2aVdxjzI5Ua35DXlzzG3c0X1B/KlrnLoEumU7XnQc7AV0/au7Zkzq8wrL8KIyQQG4tYDj8FDVDC6GY=
In-Reply-To: <46B9C8A9.6010805@intv.cz>
Content-Disposition: inline
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
To: Hrad Miroslav <m.hrad@intv.cz>
Cc: netfilter@lists.netfilter.org

Hi,
Hi,

I do not understant why you are using kernel+iptables ....etc...

You should include support for iptables in kernel there is I think in
networking options. After kernel compilation ( with iptables support )
you will have iptables packet included and be able to make iptables
rules. patch-o-matic is neccessary when you want to add some features
into iptables that is not yet included in kernel version and then you
patch kernel ( adding that feature to iptables ).
For example, for  L-7 filtering you will need ( AFAIK ) to patch
kernel to add that feature. Google for " patching kernel " and you
will find a lot of links with detailed informations.
In following link is example how is patched kernel to add geiop
feature to iptables
http://www.debian-administration.org/articles/518

With regards

Elvir Kuric

PS: Sorry, I forgot to " reply to all " in prior mail :)

On 8/8/07, Hrad Miroslav <m.hrad@intv.cz> wrote:
> Hi
> I would like to have one questionregarding to the compilation of the
> linux-kernel (2.6) and iptables.
>
> I need to run a firewall within the linux box, which could support at
> least ipp2p filtering, l7-layer filtering, connlimit, quota, tarpit,
> ip_mark.
>
> I would like to know which version of the kernel, iptables,
> patch-o-magic and other patchs to use to make compilation of the kernel
> and iptables without any errors.
>
> I have aleady tried to use kernels and iptables of many versions but the
> compilation of kernel was broken with some errors.
>
> For instance I used this packages:
> linux-2.6.16.27.tar.bz2
> iptables-1.3.5.tar.bz2
> patch-o-matic-ng-20060626.tar.bz2
> patch-o-matic-ng-20060511.tar.bz2
>
> linux-2.6.16-imq2.diff
> iptables-1.3.0-imq1.diff
> esfq-2.6.15.1.tar.gz
>
> netfilter-layer7-v2.2.tar.gz
> l7-protocols-2006-05-21.tar.gz
>
> - but without success. (there was incompatibily pointer with connlimit
> and tarpit)
>
>
> Please, can you tell me which version can I use for proper kernel
> compilation ?
>
> Thanks
>
> Regards
>
> Miroslav
>
>

