From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: Strange behavior with ipset not matching on public range
Date: Mon, 27 May 2013 16:44:56 +0200
Message-ID: <1369665896.4058.29.camel@BEWS005.euractiv.com>
References: <1369662135.4058.24.camel@BEWS005.euractiv.com>
	 <alpine.DEB.2.00.1305271548390.11760@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:x-mailer:mime-version:content-transfer-encoding;
        bh=bs7gbTEo/zeP2SBfZvt2uf4127x8NB4i0KTEFjbH66Y=;
        b=z/ifTnvd/dIym+n3JCp6xRRl7YerBkMbHhuN1EpAl0rmdhrCUgLwEhL2indw5Z1uOH
         pluCi/xw1euFo/ZM8RWY4sXVa2709QnLhDx22ovd8Z+ro74ixhomz/aH/GXJnIbCz6fZ
         10U63hO5DUz5X9pASU+X2wWmbzSQYg0CcGpfluatjprIVC4GDrSRHjsJVe5fOxL1zAaW
         xc0GUgqI4nLATaVvgeEMxPV1rKs0c6JK9wxj9/tmR3VPPUTxTubFzOlvDny9wq/L9UIS
         p+hZxyJFSsjPJmDLBqtULtuk3Pwus9m279q0KgTSYN3ez0EkCOfc3Dqiybi+AxpIrkZ/
         DBaQ==
In-Reply-To: <alpine.DEB.2.00.1305271548390.11760@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> 
> What is your ipset version? You should post iptables rules in 
> iptables-save format...

# ipset -V
ipset v6.12.1, protocol version: 6

And here are the rules corresponding to my previous iptables output:

-A FW_OUT -p icmp -j CTRLOUT
-A FW_OUT -m set --match-set fw_iface_all src,dst  -j FW_OUT_common   # Match
-A FW_OUT -m set --match-set fw_iface_pub src,dst  -j FW_OUT_pub      # No match
-A FW_OUT -o eth1 -s 217.x.x.122/32 -d any/0 -j FW_OUT_pub            # Match
-A FW_OUT -m set --match-set fw_iface_priv src,dst -j FW_OUT_priv     # Match
-A FW_OUT -m comment --comment "EOF" -j DROP

> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary


