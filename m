From: Marco Padovan <evcz@evcz.tk>
Subject: ipt_SYNPROXY
Date: Sun, 18 Nov 2012 00:17:02 +0100
Message-ID: <50A81AEE.8000904@evcz.tk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :x-enigmail-version:openpgp:content-type:content-transfer-encoding;
        bh=FbNt0Bt/AvouFYTWzDieEBGTcAfqVsP0DwohknE/74I=;
        b=eoHuZKDGmpNC9o8Jmwdu7C3n0BRnfO2EaFqORmFYAgyK64JD6S+8RMcHtuoINfYe55
         uIy1kPYCEXuyA/oV/2q7HWwii0U3DMcIY0A3ZwZWomzF6rcoEPgvxRq0qTfDCqBXtMlf
         Wm6TT0GMDhCPMoe64ave5oInby9Wjl93HV+o0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I was searching around for an efficient synproxy implementation (to
filter incoming spoofed/reflected syn floods) and this one popped up:

https://github.com/xiaosuo/xiaosuo/tree/master/synproxy

anybody got a first hand experience on it?

Is there anything else similar?
