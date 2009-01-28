From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: nth match extension (was: Blocking outgoing 802.11 ACKs)
Date: Wed, 28 Jan 2009 15:05:21 +0200
Message-ID: <d39744a20901280505t47499c4v3ad1e05b75d5bf4a@mail.gmail.com>
References: <441977.39906.qm@web31604.mail.mud.yahoo.com>
	 <d39744a20901280329y4a2edc9yc0f7c59eb86c4bbc@mail.gmail.com>
	 <49804E2E.30604@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0iH2Az3ETJkmILi244kGDjEXN2BxB3CV+dcU+LTCU/Y=;
        b=D/fMmLpyOL8vjmEKtxPSSPMIKM6Y+en7KmLN4F5u2SghAsJEi8+mPVglLOJOmwF+mV
         vWFHCk8xs6Hrsp7cfPS3M2UeLIHAo1Emy0sXPUNdfz6DxCqbJ4ooKCsVxfTJL3NQWZs0
         00yHs3wmuUO12/RGm55ph+/keqo3n4wUA0Teo=
In-Reply-To: <49804E2E.30604@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thanks for the clarification!

On Wed, Jan 28, 2009 at 2:23 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Ivan Petrushev a =E9crit :
>>
>> iptables has "nth" match extension that matches every n-th packet.
>
> Be aware that "nth" was in the patch-o-matic and was never included i=
n the
> standard kernel. It has been superseded by the "statistic" match adde=
d in
> kernel 2.6.18 and iptables 1.3.6.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
