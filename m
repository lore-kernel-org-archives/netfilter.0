From: lu zhongda <luzhongda@gmail.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Sat, 26 Nov 2011 19:30:49 +0800
Message-ID: <4ED0CDE9.1060902@gmail.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <jal9sa$t42$1@dough.gmane.org> <4ECF299D.9040005@gmail.com> <janteh$3ui$1@dough.gmane.org> <4ECF9C17.80804@gmail.com> <4ECFF405.8080904@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=d6UVcmLsW4K5uCnLlZiZHNzeVxGrxBl/0Pa1Tkxoarw=;
        b=N/3lJwFAUm93BYD+0aw+VniYNwL5ato6q9bCtjyFwXNIZR6PsBs474mgLVmPVuLCXe
         L/cLPd4jgpf8QpWcamS6dHYV28AfwjVnuFeT8TATbuy2aR15u95zW8H8Xe1mKtsg/K0f
         xWVGM/GC2a+B8sYvOz79OjBJfsI3MdEy54qUU=
In-Reply-To: <4ECFF405.8080904@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Haxby <john.haxby@oracle.com>
Cc: "Brian J. Murrell" <brian@interlinx.bc.ca>, netfilter@vger.kernel.org

John:
     Thanks greatly for your suggest.

On 2011-11-26 4:01, John Haxby wrote:
> On 25 Nov 2011, at 13:45, lu zhongda wrote:
>
>> We supply java application server product to our customer.
>>     The application server supplies jdbc connection pool functionality
>> to deployed web application.
>>     The jdbc connection pool usually keeps a fixed count of physical
>> connections to database which are socket connections.
>>     The support staff reflected that the connections in the connection
>> pool were dropped by firewall after 30mins to become idle under
>> customer environment .
>>     I can't get clear information whether the firewall product is iptables.
>
> This is quite common.
>
> A lot of home routers (certainly the Netgear ones) use iptables and will
> drop idle connections after some configurable time.  Cisco routers that
> track connections (for NAT or otherwise) will typically drop idle
> connections after some configurable interval (I think the first time I
> came across this in about 2001 it was 30 minutes).
>
> If you're affected by this then you need something that will keep the
> connection alive.   In your case you need a no-op to keep the connection
> alive.  Either that or drop your idle connections before the router does
> it for you.
>
> jch
>

