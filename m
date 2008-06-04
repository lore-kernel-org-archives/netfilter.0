From: "Knight Tiger" <caugar@gmail.com>
Subject: Re: Forwarding packets received on bridged interfaces -regarding
Date: Wed, 4 Jun 2008 11:22:03 -0700
Message-ID: <69fec4520806041122x2a953904ra259ed8ebfc44cf5@mail.gmail.com>
References: <69fec4520805281536t15dd5e5dq289799693263371b@mail.gmail.com>
	 <483E1DF2.3080304@riverviewtech.net>
	 <69fec4520805282155k441b60edo30a98bb26135df62@mail.gmail.com>
	 <483E3C6B.1030208@riverviewtech.net>
	 <69fec4520805301532n7f68fc9m9af29004f1514833@mail.gmail.com>
	 <48408645.7070902@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:subject
         :cc:in-reply-to:mime-version:content-type:content-transfer-encoding
         :content-disposition:references;
        bh=w9POydjjhEIns+JAf20wU26/bXckKqhDoA4SikK0P8s=;
        b=k8EBKRl3L3XsLNgNgSTve7YmfHaGqUQuAMCuum7lPKvS72m5UifsYKr+STrpJQ2coA
         Mmf8RB49fwnUfPTWMXBuiNmMejI7fPkTv2t7iUmCaQH5eF3Ab2o3TpW5DXk/f9WV+e6b
         psBlQsccbpaMqRQmgX0PXJwdDL1es5Nydu7JM=
In-Reply-To: <48408645.7070902@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

The wireless card is Intel PRO/Wireless 2200 BG and the driver is
obtained from  ipw2200.sourceforge.net.
I am running Fedora Core 5 on an IBM Thinkpad T43

I tried the same tests with a PCMCIA orinoco card (lucent) but that
failed as well. I tried a Cisco card but it was not detected. Proxim
failed the detection test as well.

Thanks !
Knight


On Fri, May 30, 2008 at 3:57 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 05/30/08 17:32, Knight Tiger wrote:
>>
>> I did the test on a desktop with two NICs and no iptables/ebtables
>> entries. The setup works great. Thanks. I expect the problem to be with the
>> wirless NIC (I use the Intel Linux drivers but apparently they are no good
>> for bridge settings).
>
> I wondered if such was not going to be the problem.  Can you replace the
> wireless card?
>
> For the record (and those searching the archive), what wireless card and
> driver(s) are you using?
>
>> Thanks again.
>
> *nod*
>
> Good luck.  :)
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
