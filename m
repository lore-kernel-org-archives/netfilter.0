From: Karim Asif <karimas@kfupm.edu.sa>
Subject: Re: How to drop existing connections
Date: Mon, 07 Apr 2008 11:55:10 +0300
Message-ID: <006e01c8988d$16d2bee0$87035a0a@KarimAsif>
References: <156779.60553.qm@web65702.mail.ac4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Vitaly <vitaly_il@yahoo.com>, netfilter@vger.kernel.org

Using iptables?
just add a drop rule having src/dest ip addressess and ports and protocol on
top of other rules.

----- Original Message ----- 
From: "Vitaly" <vitaly_il@yahoo.com>
To: <netfilter@vger.kernel.org>
Sent: Monday, April 07, 2008 11:30 AM
Subject: How to drop existing connections


> I'd like to kill all existing connections to the
> specific IP/port. What is the simpliest way to do
> this?
>
> Thanks,
> Vitaly
>
>
> 
> ____________________________________________________________________________________
> You rock. That's why Blockbuster's offering you one month of Blockbuster 
> Total Access, No Cost.
> http://tc.deals.yahoo.com/tc/blockbuster/text5.com
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 

