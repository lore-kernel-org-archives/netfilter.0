From: J Webster <jw.jwebster@gmail.com>
Subject: Re: masquerade error
Date: Wed, 12 Oct 2011 19:18:10 +0100
Message-ID: <4E95D9E2.4010002@gmail.com>
References: <4E93E9B8.3010005@gmail.com> <4E94480C.4050604@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=M00Zut1+kQtsTj3hC39i4nCnDZ2BI7M/+i29ZwjgugQ=;
        b=QQkIK7aEitNO0K8heoCxz8+0hU29kQ0BVsDSK4zKonitX7uSTWz/Tt1RfpMgE71/H/
         H8GFR6/vCJs8aJrJArfcynsbWAIJ/i3PALOPDLDctLT7CJdtrVAxTJnT7N7sWosHeY2I
         Q964Uvws7+99Urj1vrbC1Iodi2qQCJFgEZO88=
In-Reply-To: <4E94480C.4050604@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

>  The problem here may be venet0 interface. As far as I know, there is no
>  support for "nat" tables on OpenVZ virtual network interfaces.

Thanks. If that is the case, then how do I postroute on a virtual network?

  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  
-o venet0 -j MASQUERADE
  iptables: Unknown error 4294967295
  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  
-o venet0 -j MASQUERADE
  iptables: Unknown error 4294967295
