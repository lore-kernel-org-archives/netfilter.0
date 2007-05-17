From: "Benjamin RIOU" <pandolphe@pandolphe-vision.net>
Subject: Re: iptables doesn't keep chain list after reboot
Date: Thu, 17 May 2007 17:00:50 +0200
Message-ID: <28c01a080705170800h1904d631p14d88cd8aa46599f@mail.gmail.com>
References: <b6d73fa90705170741o690baad4u9b37ff8b51cf530a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=q/xoWEYjV8qwTc8FZGXEo7bCQwpUj7/Xv8hM0sTT84N9vYZyQLMMl3Nqpw8kl8IBfDID3+WAt/D5B5dNTF4vBCLDkycRvDzKSuXD1ZhObKPdH+TODF2/UAxzR3caehdv0xsz+dFMRJGCAJXyuO9LVz/y8MzIsJ0ftGDSLYWFpFE=
In-Reply-To: <b6d73fa90705170741o690baad4u9b37ff8b51cf530a@mail.gmail.com>
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

> Is there something to do?
>
Hi.

You can use iptables-save to save your iptables configuration ,
and use iptables-restore to restore it.

You can add this command to your /etc/rc.local to see them restored at
every boot.

++
Ben

