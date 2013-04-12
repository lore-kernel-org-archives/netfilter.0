From: Alex Flex <aflexzor@gmail.com>
Subject: =?UTF-8?B?UmU6IERST1BJTkcgSUNNUCBhbmQgc3RpbGwgZ2V0dGluZyBrZXJuZWw=?=
 =?UTF-8?B?IG1lc3NhZ2VzIG9mIGljbXAgdHJhZmZpYz/igI8=?=
Date: Fri, 12 Apr 2013 17:10:23 -0600
Message-ID: <5168945F.5060308@gmail.com>
References: <51630743.2020404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=a+XYgJMkUG0aSHxnxPKrYz+sDgsYLR1gvnsolVx4uCg=;
        b=N/AdScCtnWSOguZkIO1qVf4UPewwPwDZGmU6I3maODJz7xMX7jReEtmIZD4CEKH/q0
         e2PknDWbjsNZ8NKATqxrArYjzwxV0Whr3e+gdGbkP/06XuUxUVin+lay4EQEHKtAjy95
         bG9s21auUFRFkpA0TQMnxzY0vRtP7fwUC2+dUurq3oaqZIuD4RgiFyTE6e7zwY43MM3L
         sN1ZQxZF6Z4dr4QDGKbgxMn5G00ja4FrH6RFPECeb4kwiBTQVd6WBGRS3ApG7HgQANWi
         sYHcREBb3MsPn36XhPBvetHYCjlClnCPZb7pCLJAe0RhsFkGjJpTSCP8kMvXSm+VHasf
         ythQ==
In-Reply-To: <51630743.2020404@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello...

I have not recieved a response, maybe my question was a bit messy if it 
was I apologize for that..

In concrete anybody know what is the difference in utilizing iptables to 
DROP all ICMP, vrs using sysctl to ignore all ICMP ?

Does it make sense I was droping all ICMP in iptables  but still 
recieving messages in syslog that ICMP redirect packets where getting 
ignored every now and then (by that time i had not used sysctl, but i 
was recommended to do so hence my question)

Thanks guys

Alex


