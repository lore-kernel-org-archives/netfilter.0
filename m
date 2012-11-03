From: Thomas Perl <th.perl@gmail.com>
Subject: Re: How to enable "bytes=" output in "conntrack -L" output
Date: Sat, 3 Nov 2012 13:04:04 +0100
Message-ID: <CA+uOhx6J==Bm_SggAm328X3j3NxD5p_vk1f3RaapiXZJ7XzN-Q@mail.gmail.com>
References: <CA+uOhx6tc0EZO8atcN+=vN_Buv_mWbOwNF+RM4wnr3PpYp6vrA@mail.gmail.com>
	<alpine.LNX.2.01.1211031259220.11582@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=jRD6RfrnHQDJcCsJXSbkTplnOkaN0Zovki6S7sqnjN8=;
        b=tp4EFqoPYmBWTh6JI+dzVoCZv596cpLvza2pvchCanb16qxGKtYurucgk0NnBXu4Dg
         sGluEtoqWZucXm6iwsMzLpRurXoh2HVdgA1eh1ptxbUW94zdBB6ffnI1/qUqHYvmSpIJ
         QhNI+Z5Jtz1Ttw24+nhSQ63fwx2aRiBZUqbaeYhRTGdK1HRqHdIEi52dQgxYJTi++6XF
         wB4thSSMNSfxA8X+f7b8ez9NHSkzrk7dEC9gKsRJxp77o1eNJJ6VRyrEVoF/V6o53w1f
         ByysOjKPrvb9ZRnp4Bs57sYhmvqe+0dBhgj4ZWmuxWP19l+SxcL2Z5mNQSq3HdaKrCOC
         T0PQ==
In-Reply-To: <alpine.LNX.2.01.1211031259220.11582@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org, Kamal Ahmed <kamal2222ahmed@yahoo.com>, =?ISO-8859-1?Q?Stefan_K=F6gl?= <stefan@skoegl.net>

2012/11/3 Jan Engelhardt <jengelh@inai.de>:
> On Saturday 2012-11-03 12:48, Thomas Perl wrote:
>>However, on my machine when running "conntrack -L" (as root), I do get
>>output, but without the "bytes=" part:
>>
>>tcp      6 ZZZZ ESTABLISHED src=X.X.X.X dst=Y.Y.Y.Y sport=XXX
>>dport=YYY src=X.X.X.X dst=Y.Y.Y.Y sport=XXX dport=YYY [ASSURED] mark=0
>>use=1
>
>         sysctl -w net.netfilter.nf_conntrack_acct=1


That's exactly what I was looking for, thanks a lot! :)

Thomas
