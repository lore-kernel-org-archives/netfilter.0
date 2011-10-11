From: J Webster <jw.jwebster@gmail.com>
Subject: Re: masquerade error
Date: Tue, 11 Oct 2011 14:43:40 +0100
Message-ID: <4E94480C.4050604@googlemail.com>
References: <4E93E9B8.3010005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Eq97QP2O2fQYry88ObE1wbEihk1XeTFQ5GAcBc3Qn38=;
        b=C+GpObbWppkaydw6CVmzhvhg0L3Yd4nqyWVqdG6P8zXqCau265T2fnjaCeeVxULFQK
         SaOqHB+OtBXlMU4P5rK3ClYonrlW9x6N5MEK61zGThnrvTw/DG/6YGdik2IuWMNmGR+H
         g7d4iYWRW0Dy3WVTHMgmSKOxZiy+zJB+7K5JM=
In-Reply-To: <4E93E9B8.3010005@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

>  The problem here may be venet0 interface. As far as I know, there is no
>  support for "nat" tables on OpenVZ virtual network interfaces.

Thanks. If that is the case, then how do I postroute on a virtual network?

>  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
>  iptables: Unknown error 4294967295
>  [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24  -o venet0 -j MASQUERADE
>  iptables: Unknown error 4294967295
  

