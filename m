From: Saikiran Madugula <hummerbliss@gmail.com>
Subject: Re: ipt ROUTE extension
Date: Thu, 15 Oct 2009 10:35:39 +0100
Message-ID: <4AD6ECEB.20505@gmail.com>
References: <9041a1390910141008v26bb354idfcffb173ac87110@mail.gmail.com> 	<4AD642C3.2070900@gmail.com> <9041a1390910150206x1a715060j4b017bc43669cf05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=+U8xPcdmw1e+w4ugKoXaMP6BbQAnV+1uIGDsmIMHtGE=;
        b=OVYLdW1NLEesawhDkjgDT5aY8kuRaG6PvFDDg8uEmnzjm38aQcIZihKCCdatYhmSrc
         YvjQ+iZKPOKpqfF6bBqDWM2ltKMc6k//6VToLRdfteaKZuZjX7PNww2b5nW6Pjm5MeUk
         alByRP5qI8knb20SBQT2aS2YIXWRK0agUoFZE=
In-Reply-To: <9041a1390910150206x1a715060j4b017bc43669cf05@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mallika Gautam <mallika.gautam@gmail.com>
Cc: netfilter@vger.kernel.org

Mallika Gautam wrote:
> On Wed, Oct 14, 2009 at 10:29 PM, Saikiran Madugula
> <hummerbliss@gmail.com> wrote:
>> Mallika Gautam wrote:
>>> Hi,
>>>
>>> I am trying to find ipt_ROUTE patch for kernel 2.6.20 version. Can any
>>> one kindly point me to the site.
>>>
>> AFAIK its been replaced with xt_TEE (http://xtables-addons.sourceforge.net/).
>>
> Thanks for your response.
> I did check the addons releases but I could not find ROUTE target there.
> Last I know was that it was in experimental state. Does anyone know if
> it has been removed completely. Any pointer will be of help.

http://www.gossamer-threads.com/lists/iptables/devel/68870.
