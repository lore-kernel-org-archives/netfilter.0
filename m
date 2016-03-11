From: Sebastian Damm <damm@sipgate.de>
Subject: Re: "Operation not permitted" from nf_conntrack under high UDP load
Date: Fri, 11 Mar 2016 16:47:12 +0100
Message-ID: <CABkWSFzN3OAoSfMH4msfP+ZdYg_HqkkB4kZLtfAf_idr3EiRmg@mail.gmail.com>
References: <CABkWSFxpuoGST0CuSrYKb15dOixPvJ0aCzQof2A7aXqY_06_PA@mail.gmail.com>
 <56D90832.7020009@hallowe.lt> <CABkWSFwxnoM7kHAKApPi=xEJ4zhPmuGTwsj=BzdsRL=D+hZ+cw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sipgate-de.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=RBQFY5z2vdJ0+3Q3lQK9pNmNrChYlKWMCzNzifnC5gE=;
        b=Uwj5fvIxAIBZz4wMvDxQPV+GpArYAQbS9HMIoB1sqBEE0qsUsAcpqmQXJHbdRiVkJZ
         ucNQXjbRZ//MnpNmt7697HbR2D0KaX62xhoDeNs6MdQHLdjwRKFzoM96osicb3msngGU
         OglAH02UiyWTWRw6t49k5MHt2vJ27j/TjWp0KkrfYlbPk0mKWABzc/IlyhVtHqw196UF
         7cG4/cKnC+pWJ44iQSyuYoLD1Zgu48ptt9Fg9RJnAiPehEUsTn+6Ho0iCs7YiNR6cVd8
         /ilnUUzdgNSGd8v7oEHi1R6ml2MsyAMQ63lUZvIFqmPHBAzTnpozD0YAM/d82VoismzL
         JNtg==
In-Reply-To: <CABkWSFwxnoM7kHAKApPi=xEJ4zhPmuGTwsj=BzdsRL=D+hZ+cw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

just to close this one, after a lot of debugging we found the cause
for this issue. When this error occurs, the SIP server is sending out
two packets to the same destination (IP:port) at roughly the same
time. This causes a race condition in nf_conntrack when inserting a
new tuple into the conntrack table, leading to one of the two packets
getting rejected by the kernel.

Looks like there is no other solution for this problem than building a
stateless firewall and unloading the nf_conntrack module.

Best Regards,
Sebastian
