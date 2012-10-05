From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Error while trying to compile libnetfilter_cttimeout 1.0.0
Date: Fri, 5 Oct 2012 16:14:14 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210051612250.6286@nerf07.vanv.qr>
References: <506EDBCB.6030703@morlix.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <506EDBCB.6030703@morlix.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: morlix <morlix@morlix.de>
Cc: netfilter@vger.kernel.org

On Friday 2012-10-05 15:08, morlix wrote:

>  CC     libnetfilter_cttimeout.lo
>libnetfilter_cttimeout.c:107: error: 'IPPROTO_DCCP' undeclared here (not
>in a function)
>libnetfilter_cttimeout.c:107: error: array index in initializer not of
>integer type
>libnetfilter_cttimeout.c:107: error: (near initialization for
>'timeout_protocol')
>libnetfilter_cttimeout.c:112: error: 'IPPROTO_UDPLITE' undeclared here
>(not in a function)

IPPROTO_DCCP and _UDPLITE are available since glibc-2.9.
