From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: Identifiying and modifying packets
Date: Thu, 26 Mar 2009 20:23:32 +0100
Message-ID: <49CBD634.4000203@gmail.com>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=qYjcfdRS6BXHUc9+Amkd9qq/zIyrUirKCU44Wwn0wVg=;
        b=YR0tPSMNrWukpYSzT3Mlhn3hFm2BpJ4SRq9l50TW7NroEMoozuZxwo91LGfNRRkp+9
         EpZ73tuVx8tk0wqnXVYDaKhzqEVMrpJ99hO+as68xLJWPFxFckwhTupLo7UQ66I1qIDU
         m3xQWOpq2ug2zF1aSWOoESCYZbbBKQpYgtfK4=
In-Reply-To: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: aragonx@dcsnow.com
Cc: netfilter@vger.kernel.org

Hi,
> Can someone tell me what tools I could use to examine outbound packet data
> for the usernames and modify it if it matches a list of accounts we want
> to block?
>
>   
I suggest writing your own netfilter-module that does the packet 
inspection, and if a packet matches you can simply return NF_DROP to 
instruct the kernel to drop the packet. A good tutorial/book is 
available here: http://jengelh.medozas.de/

Maybe you can do something similar with libpcap, but I am not sure if 
you can drop packets.

-Kristian
