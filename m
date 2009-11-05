From: "JR" <jdnromao@gmail.com>
Subject: Re: HTTP Access Blocked After iptables Update
Date: Thu, 5 Nov 2009 02:44:33 +0100
Message-ID: <70F6FAA583BB477999AA7E5BEB0A5F38@RomoPC>
References: <9A16A4503EA74DCAAF2C8A53A0DBF60F@RomoPC> <200911032206.18489.fakessh@fakessh.eu> <C387A75055774404B36410B61AF40D41@RomoPC> <4AF15D02.1080201@gmail.com>
Reply-To: "JR" <jdnromao@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:reply-to:from:to
         :cc:references:in-reply-to:subject:date:organization:mime-version
         :content-type:content-transfer-encoding:x-priority:x-msmail-priority
         :importance:x-mailer:x-mimeole;
        bh=oQgLVQjPuOMUW82f9E5UxxbZMIpAA1PmDoFeCkrF5Pk=;
        b=wVvD2zeRw/IgYv3VThH4YLm/PicKtFMLzu0WJWUoZnKM7Pi0fz0L6ikwRdLqPrlO5h
         Y2fvwpFNayj2hwGaZSSeYwWaewxtAdRaAW6U0Q8qKq6cCyqCtm+rkvVvU81piLFcM4v/
         wnTGzy2NGQFWJjTRCCFECmEzzkHhWuGONfBtM=
In-Reply-To: <4AF15D02.1080201@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Saikiran Madugula <hummerbliss@gmail.com>
Cc: fakessh@fakessh.eu, netfilter@vger.kernel.org

Hi, thank you very much for your reply!

No, I think not, but here is a part of the config

# Default firewall configuration:
IPTABLES_MODULES=""
IPTABLES_MODULES_UNLOAD="yes"
IPTABLES_SAVE_ON_STOP="no"
IPTABLES_SAVE_ON_RESTART="no"
IPTABLES_SAVE_COUNTER="no"
IPTABLES_STATUS_NUMERIC="yes"


Should I made any changes??

Thank you in advance!!

--------------------------------------------------
From: "Saikiran Madugula" <hummerbliss@gmail.com>
Sent: Wednesday, November 04, 2009 11:52 AM
To: "JR" <jdnromao@gmail.com>
Cc: <fakessh@fakessh.eu>; <netfilter@vger.kernel.org>
Subject: Re: HTTP Access Blocked After iptables Update

> JR wrote:
>> Hello again.
>>
>> Can someone please help me on this?
>>
>> After server reboot all sites are on, and iptables is running. However if 
>> I
>> restart iptables (service iptables restart) all sites become unavailable.
>>
>> And in "top", (after the iptables restart) all I see is root processes.
>> I've
>> updated kernel, may be related to it?
>>
>> What can be the cause?
>>
>> Any help will be very appreciated!! Thank you!
>>
> Shot in the dark, when you do iptables restart does it do iptables-save 
> and
> iptables-restore ? Check in . 

