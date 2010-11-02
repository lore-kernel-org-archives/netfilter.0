From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE]: Release of iptables-1.4.10
Date: Tue, 02 Nov 2010 16:40:14 +0000
Message-ID: <4CD03EEE.5050900@googlemail.com>
References: <4CCAEB8A.5090504@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=/lBuWlg/8RVPYm0+8QKBfWGmZReTgWN4s9gfwj71zlo=;
        b=fFPHwxJjIC641Jlu8yVB4ewL8QHLbGdYR9axxZ0c1DeIwTb5FXWNNj3YpTLb3nDXBA
         taOHUXjgyRf/FjkzYwvfbwzjsJub9vcrDrB9SnBwnqbFAX8+KpTrRmfwu6Kq4k9PhSl8
         f31xNKf47ZgWlhFPaCYLY6vKKSmpbhhrVZ2j8=
In-Reply-To: <4CCAEB8A.5090504@trash.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


> The netfilter coreteam presents:
>
>     iptables version 1.4.10
>   
General question: Would it be safe to compile this (from source) and 
install it on my system which has the 2.6.16.60 kernel and iptables 
1.3.7 installed and running?

I am quite desperate to get ipset working on that machine and, as I 
understand it, I have a choice of either compiling the 1.3.7 version 
(adding kernel/include/linux/netfilter_ipv4/ip_set.h from ipset source 
tree to include/linux/netfilter_ipv4 prior to that) or compile the 
latest 1.4.10 version of iptables prior to compiling and installing ipset.

I just compiled both versions of iptables and did 'make' successfully, 
though I haven't yet made the install.

