From: "ron lai" <ronlai@cs.stanford.edu>
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 2.6.22.6
Date: Mon, 5 Nov 2007 08:36:13 -0800
Message-ID: <001c01c81fc9$fb5a0f10$6500a8c0@ronPc>
References: <001601c81ccc$682bb4a0$bb0b10ac@FireEye.com> <472EF88E.8030006@ufomechanic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Amin Azez <azez@ufomechanic.net>
Cc: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

The problem happens in both SNAT only and SNAT+DNAT cases.

Ron
----- Original Message ----- 
From: "Amin Azez" <azez@ufomechanic.net>
To: "Ron Lai" <ronlai@cs.stanford.edu>
Cc: "Patrick McHardy" <kaber@trash.net>; <netfilter@vger.kernel.org>; 
<netfilter-devel@vger.kernel.org>
Sent: Monday, November 05, 2007 3:03 AM
Subject: Re: Fw: Problems with nf_nat_ftp.ko and nf_conntrack_ftp.ko in 
2.6.22.6


> Are you doing SNAT and DNAT on the same connection?
>
> Sam
>
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 

