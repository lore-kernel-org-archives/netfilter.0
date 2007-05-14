From: Denis <denismpa@gmail.com>
Subject: Re: Two internet connection in a gateway server howto.
Date: Mon, 14 May 2007 09:43:50 -0300
Message-ID: <e9aeeef80705140543m26923580xafbde16351798149@mail.gmail.com>
References: <4642B121.30308@ditro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=rTEesYax94pJrCRtBKMcWz5tdovimA0rt5JfiuZ1fY29cMYpZmSzDUNU8yYihfrPupsYua6KeS5Feb0YvDEFn/50x9YIkVNkHTAmB07uYYFJYsFZ4ORTohKc0Dn7+Wq3Kv5gepl6SaPqAE6S2sb7ylB3Jm3agp5KxZ8/KpGhunI=
In-Reply-To: <4642B121.30308@ditro.com>
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
To: netfilter@lists.netfilter.org

U can manage that using iptables fwmark and ip route2


Denis Anjos.


2007/5/10, BipinDas <bipindas.k@ditro.com>:
> Dear List,
>
> I do have a Gateway server with two NIC and one internet connection. One
> network card is with Public ip of the internet and the other with
> private ip of Local LAN. I had manage this with IPFORWARD and iptables
> rule. This machine is running on Debian sarge. Now company would like to
> take another internet connection for redundancy. And I would like to
> terminate this connection on this same machine. Is it possible,How can I
> do this,Please help.
> Please forgive me,if I made a wrong post here.
>
> Faithfully
> BipinDas K.
>
>
>

