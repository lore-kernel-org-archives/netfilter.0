From: "Charles M. Romestant F." <cromestant@gmail.com>
Subject: Re: C code rule modifying
Date: Mon, 21 Apr 2008 21:03:30 -0430
Message-ID: <F124820A-A657-48D2-8670-A52F58493AE6@gmail.com>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com> <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr> <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com> <002501c8a416$78a11ec0$8119fea9@MingChing>
Mime-Version: 1.0 (iPhone Mail 4A93)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:references:message-id:from:to:in-reply-to:content-type:x-mailer:mime-version:subject:content-transfer-encoding:date:cc;
        bh=ASM8P9IlBE899rYZGQlpA1gmk82Si/SSxPaGC5GuxZk=;
        b=d5FV3h5hsaBkvuzeFSNBItxZei+0YkHp68Yazldqhup+pAxD6tmMHU7Vx/zYDzg/ExXHiiZmCDGxqi4MqTSvMS5cEnn8+xNE+hFrAOr+2kmSR/l0FxwXAQjvdHvaNBQZxvelpb5xz48o5tFc0bIHSC/ychomU2OhYxLOjReuxto=
In-Reply-To: <002501c8a416$78a11ec0$8119fea9@MingChing>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: "<netfilter@vger.kernel.org>" <netfilter@vger.kernel.org>

Actually no compile errors whatsoever.  Not at computer at the momment  
so can't  try the character w.
Ming original email was for advice on how to change the rules, it did  
spin off to a debug my code post,I apologize. Thank you all for the help

Sent from my iPhone.

On Apr 21, 2008, at 20:46, "Ming-Ching Tiew"  
<mingching.tiew@redtone.com> wrote:

> Charles Romestant wrote:
>> Ok im trying to add the rule to a table named charz, here is the code
>> :
>>
>> char *command;
>>        FILE *fp = popen("/sbin/iptables",'w');
>>        if (fp==NULL){
>>        printf("\nerror opening pipe\n");
>>        return -1;
>>        }else{
>>        sprintf(command,"-A charz -p tcp --dport %s --source %s -j
>> %s\0",port,currentIp,action2);
>>        printf("\n\n\n%s\n\n\n",command);
>>        fwrite(command,strlen(command),1,fp);
>>        pclose(fp);
>>
>>
>
> Oh my, this is not netfilter at all ! Please post it to C programming
> for beginners please ! There are quite a few bugs in these few lines,
> the compiler would already have warned you !
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"  
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
