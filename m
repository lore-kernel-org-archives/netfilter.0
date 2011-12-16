From: Mickey Nordstrom <mickey.nordstrom@gmail.com>
Subject: Are iptables or ipset file capabilities aware?
Date: Fri, 16 Dec 2011 12:04:00 +0100
Message-ID: <4EEB25A0.1090706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=q4JIs2sxjM+WdIvDWya4w7K0XyGODz+bVa33IPqVpuU=;
        b=MIntH+IpPkkUi8HNKT1HA0AMpx3lp+5b1MQ4pPDa5faf8Lk85BCVYAddILt5B/B3p7
         sEbcwcmtxGYwdjIRPx4FZo4SsbBF6/RG8b277JmdW8RyWrxxpbZDvaNIYCmithSpXM+m
         x2OuWAPOv5kuJgcLo4cjSjrf2jZBinDnudTug=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm trying to devise a scheme where I need to give an unpriviliged user the ability
to add ip addresses to a blocklist used by iptables. Sudo is not an option in
this case.

I have understood that I should be able to do this with the CAP_NET_ADMIN
capability but so far during my testing with ipset 4.5 I have not been successful.

Could anyone please tell me if these utilities are in fact capabilities aware and
if not, if there are any plans to implement it?

Cheers,
/Mikael

