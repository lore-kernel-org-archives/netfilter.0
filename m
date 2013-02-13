From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Make packets go through when NFQUEUE app crashed
Date: Wed, 13 Feb 2013 19:24:53 +0800
Message-ID: <20130213112452.GA3197@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=lVX6DKpGRy+g9Ar/l7R9LpO9RO8F68rh7GChZ9EjAe8=;
        b=bKxV1kLloJD0fADYwoW76gzokMDcUmCl12KpxCvupynBDD7TVJArg0lN6VRD6Fa4bx
         5ypWopkb8Dm4vEb5tUkDBor7c6oWv9cp4MZc27aQdeG+/Pte+J5yQW6Od2Ce+BfaqPb/
         UMxVAIkL38V4dPwdSZD/DrMJCaQOItD+zIJUtsmz+J4sReg26BwvN22rQoFD9Gu+wva8
         rEebMca/mCAdv/Ty6Es63WqeWIy5dRpiG4tKsn7rSEpQ6fn5dHq11z/zEpELjXoNlGao
         OPkuqAndREIs2aeOTshO5gxsibiEkzkB9PkR52YOQirDgShOM5vAZDYx1mhTZYWh9kv+
         /qWg==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

I found that If the app that handles NFQUEUE crashed,
all packets goes through that queue got stuck.

Is there a way to prevent that from happening? 
I prefer to let ACCEPT all packets instead of blocking them, possible?

iptables -I INPUT -p icmp -j NFQUEUE --queue-num 0
# If no app handles that queue, no packets could go through

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
