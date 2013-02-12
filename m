From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: --and-mark while matching?
Date: Tue, 12 Feb 2013 17:47:23 +0800
Message-ID: <20130212094723.GB20707@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=8H0eK3weFFw9MIImQPk0SjZSjbWSlRO1/YPK8j2LfbY=;
        b=JfzL6/xYu1u7FuY3KQy08cXASd7pp4HlLxXN/rWsLFNLM1jXyR/K9BIcLcTiG9kIYI
         L/AVtIeyxWnXYRwh4ZFI5th0tnkot+0Arm549ar2cAzWdX7IMKaUSY8PMLGrHbvQarCX
         K7K2Ibkecvjtbah9PAPFr2To3IN5LqMcZHDS1AkwnhqgN4J5mVHHUyuQjY92IIpJ5888
         koiPay5cT40Nv3X42S6LNe4fnhVPxFC34ho5Y5Hvhs1mv8UoKWlPhfnBsX34fQ41I0Q0
         IppbAJg9v2xbQ8NWkz+/13BKBXSZe3RfV9D5zR00hUaLpNieYxWyMeXi/VX6PdwUnHJC
         nyRw==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

Looks like the mark module doesn't support "and" matching mechanism,

iptables -I INPUT -m mark --and-mark 0x20 -j REJECT

I want to match the packet when the mark has all bit of 0x20 set,
possible? 

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
