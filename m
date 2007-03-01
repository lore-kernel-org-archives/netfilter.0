From: "=?ISO-8859-1?Q?Boutin_Ma=EBl?=" <mael.boutin@gmail.com>
Subject: Re: Re IPv6 MARK support
Date: Thu, 1 Mar 2007 22:31:06 +0100
Message-ID: <2acb06d50703011331h3c842350t5dfcba190a904d52@mail.gmail.com>
References: <200702281053.l1SArNIC025800@toshiba.co.jp>
	<200702281136.l1SBaJLe019021@toshiba.co.jp>
	<2acb06d50702280353q10529555vebd20e93ee7040e1@mail.gmail.com>
	<200702281238.l1SCcE4F016826@toshiba.co.jp>
	<2acb06d50703010232k64325368l2cfab895b460c9b7@mail.gmail.com>
	<2acb06d50703010305u3bc7a1d9h862b8d01bed685c4@mail.gmail.com>
	<45E6EEA9.4050009@plouf.fr.eu.org> <45E6F45B.4090509@caf.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=ISyn1a6r/dBGIrswDMxP8QSygHu0IZ0bzFV4mzK6XKRb/koY0ChgaErocHzQsZ1G50FPBShxAWdqP4d51FVI47ms0WF8a2t5zxJXjwIIHrr+M9gqlu3f8vQJ9JQWi2X5Yo790cHCvSVj3uXdEr6sgkJOaPNIDvCdvEpPq/S2UGY=
In-Reply-To: <45E6F45B.4090509@caf.com.tr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eray Aslan <eray.aslan@caf.com.tr>
Cc: netfilter@lists.netfilter.org

Ok... Well i will see what we can do

Thank you evrybody for ur help and particularly Yasuyuki for his patch

On 3/1/07, Eray Aslan <eray.aslan@caf.com.tr> wrote:
> Pascal Hambourg wrote:
>  >> and
> >> not the IPv6 adress of the default route. Is it possible on PREROUTING
> >> hook to change the IPv6 address of the outgoing packets ?
> >
> > I'm afraid not. This is not even possible in IPv4. It is possible to NAT
> > the IPv4 source address in the POSTROUTING chain, but there is no such
> > support for IPv6 NAT (and don't think there will ever be any).
>
> I remember reading a comment for such a request from a member of the
> core team (think it was Harald Welte).  The comment was  "over my dead
> body".  So yeah it is a pretty safe bet that it won't happen.
>
> --
> Eray
>
>


-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq'|dc

