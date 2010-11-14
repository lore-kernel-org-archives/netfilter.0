From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Sun, 14 Nov 2010 10:41:30 +0000
Message-ID: <4CDFBCDA.8050006@googlemail.com>
References: <4CB5C1C1.8060809@googlemail.com> <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr> <4CB9D437.2030902@googlemail.com> <alpine.LNX.2.01.1010161948580.29809@obet.zrqbmnf.qr> <4CB9E918.2040707@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ZG/oEdakaoTzV7kxbgsCLevp07wSym4eCN5Oz1E9bCI=;
        b=SbzXBrcPIqA/9XSrjfBJh3Rr/uA0B45P9Nhg6sZkM562COqlezznlzBYCbBSPJnJat
         w9ZOyCr5eNw+Fw2V3bUgcVB0R+rE6THi1Pfjda/vWiGzKj+3cxixuVmlIs/ej7QPn4gp
         xIoOhfK/kuZZFMuJUzDaZSanCYln+F+QWtTG8=
In-Reply-To: <4CB9E918.2040707@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


>
>> ip6tables-save, or its respective v4 part.
>>   
> iptables-save | grep NOTRACK returns nothing, so I assume that I am 
> not using this.
Any ideas? The connection is definitely not tracked and could be seen 
with netstat from local to the remote point on the VPN.
