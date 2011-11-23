From: lu zhongda <luzhongda@gmail.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Wed, 23 Nov 2011 18:48:16 +0800
Message-ID: <4ECCCF70.1080701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=QaXwMRklzJ6qA+o8wFVit/LGaKvpQJYU2Njjjm4+BUw=;
        b=CJqHz2fXhqwRY4M/NZyxhmt5vdEklGirAKzsJOs/X9cjY24gGvp7eKGl4o9pBjS87X
         apj1RoDuTOK9PjbKonFQby76e3Vu89MYK7PomVtT2NX+k7LixxBPdA85B0H/mIRUzfQ9
         chZ/Vjz2S7Zu5/1U+o3ibKP71NjzsavRGAuoE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Lloyd Standish:
     Thanks for your feedback greatly.
     I felt the scenario you described is not really what I want to know.

     I want to know if there is any way to set up iptables so
     that it will drop a connection after that connection has been idle 
for a specified period of time?

    I have tried connection tracking function of iptables, however it 
seems not work for my case.
    I wonder whether there are some other means to achieve this.
    Thanks.

    Best Regards.

 > Follows:
 >      Does anyone know about how to drop an idle connection when timeouts?
 >      Thanks for any feedback in advance.
 > Best Regards.
 > Lu Zhongda
 >

+ I think you are referring to what is called "dead gateway detection."  
There are patches for current kernels to allow netfilter to do this 
(http://www.ssi.bg/~ja/#routes).


