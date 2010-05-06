From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: AH and ESP nat-ing
Date: Thu, 6 May 2010 22:25:41 +0530
Message-ID: <AANLkTilqPXXeMhbUgoicPIUlrNH6BnbYBfNL7WhyHuGH@mail.gmail.com>
References: <AANLkTikuASq3YbwsJNj8KWrwd7avNYwL9aYYhtjoF-ip@mail.gmail.com>
	 <alpine.LSU.2.01.1005061706150.32238@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=gA803LO6Z7BspsYSSDSl7y5q0n2Pf/rr4kQ3RPZMTrk=;
        b=JQxKPMYvPIH+SfIpyWD8AKHjqUJkti3b0zlP+RiEOj+XTMdK+45Q2Qh+fzxAANYI/z
         VEjUmWSTZZ16Ru0oNPyhsYcun1hPHdmQ/BmeOd+dtRUpJYafG3ZLCOot3M75YZBLkaDx
         ES8QnDnV8UeCrKLCa4xGDr3+d04YCTPPEtujc=
In-Reply-To: <alpine.LSU.2.01.1005061706150.32238@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Thu, May 6, 2010 at 8:36 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> On Thursday 2010-05-06 16:08, ratheesh k wrote:
>
>>I googled and found that =A0AH protocol pkt cannot be NATed =A0, And =
ESP
>>protocol pkt =A0NATing wont work in =A0some use cases .
>>
>>Is this problem is solved in newer kernels ?
>
> This is not a kernel problem.
>
>>Is there any ALG for nating this packets =A0?
>
> No, it's cryptographically signed, so any modification would be visib=
le.
>


I am able to establish pptp/ipsec connection  from my client machine
,connected to a  Router (broadcom ) . it doesnt have any  debug
terminal .
Could you tell me , how this is possible  ?

Thanks,
Ratheesh.
