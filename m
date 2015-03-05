From: Sebastian =?ISO-8859-1?Q?P=F6hn?= <sebastian.poehn@gmail.com>
Subject: Re: packet marking
Date: Thu, 05 Mar 2015 20:44:13 +0100
Message-ID: <1425584653.3192.3.camel@gmail.com>
References: <54F78167.6070104@computerisms.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=FxAfGDlrQ6PDJc2/FUpiL+KnkLfjoDQZ0C/642d1WIE=;
        b=MdYwKDnBkE+I5QEkAdNY1g3O/vgmoya6SegGyVsebB5LlmWqbpdWfeUWh37l2VABVX
         Qx5O9IDAHKGcUsAICHshcZKVkIbwfqF/MHXf+8fsZodL2cqlxy8bj/PhePwiko/U+WqP
         5A1X8sxAFAih2chMRsbTwreVGnU+jDOkgRJlA4UlAQE0gPHWx0xARiWlbR7UB6a20eWD
         k4IvCRoNl1MJJK4DA1maccs91dW9EFnMXUcRt3vgJu78w+2p6k+bs21vgP4Pn2d1DJuv
         q3Kj9T2WuAX2Ai6bMxqajkVF/Y+E4EquBaz1Goo6+ByQZ+xCPbzdNxZW+qK4WqJKTuId
         nqpg==
In-Reply-To: <54F78167.6070104@computerisms.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

Is there a reason to use decimal numbers? 0x1E and 0x28 are quite
complex marks to set. Maybe use 0x30 and 0x40 instead.

Is there any other place where marking is done?

Why not providing us with a full iptables-save output?

On Mi, 2015-03-04 at 14:04 -0800, Bob Miller wrote:
> I have been reading man pages and googling and I am not finding 
> understanding.  maybe somebody can explain:
> 
> under my mangle table (using iptables-restore to load):
> 
> -A PREROUTING -p udp -m udp --dport 4500 -j MARK --set-mark 30
> -A PREROUTING -s 192.168.171.0/24 -m mark ! --mark 30 -j MARK --set-mark 40
> -A PREROUTING -m mark --mark 30 -j LOG --log-prefix vpnX30
> -A PREROUTING -m mark --mark 40 -j LOG --log-prefix vpnX40
> 
> This logs packets with both marks.
> 
> If I change the LOG target to POSTROUTING, like so:
> 
> -A POSTROUTING -m mark --mark 30 -j LOG --log-prefix vpnX30
> -A POSTROUTING -m mark --mark 40 -j LOG --log-prefix vpnX40
> 
> only packets with the mark 40 are logged.  I think it should log both.
> 
> If I consult the nfpacket flow chart, nat/PREROUTING comes after 
> mangle/PREROUTING, and I cannot log packets with a mark of 30 there either.
> 
> Traffic keeps flowing, so the packets themselves are not being dropped, 
> but the mark apparently is not passed from the initial chain. Everything 
> I have read indicates it should be.  what could I have done (or not 
> done) to make this happen?  Or better yet, what should I be reading that 
> would explain this?  I get the feeling I am overlooking something really 
> obvious...


