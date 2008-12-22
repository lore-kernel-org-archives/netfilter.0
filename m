From: "Jianqing Zhang" <arrow.jianqing@gmail.com>
Subject: Add a rule to PREROUTING table
Date: Mon, 22 Dec 2008 15:44:35 -0600
Message-ID: <8a38e1330812221344l51472479s2ff1e57b4bee08b7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=2VUEatvMxSflAuzg8qg3ra7JL0bwgjjweOufOk0o6Ds=;
        b=ElB+DZjadQc9C7GfF57MhyRh/4Ys78qFt8agZa3MkMOP5vuVENgB3zQ3T5u8ogLZar
         X8/X2syyjjqCAXjUIZayLwWf1ounqztM8yGkeYchWlldZLjADH//s74VZnp4AZVOW0RF
         UBri+vP99hkUjnQO4sCoe8Krw8GZ7HBJDjgc4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

I add a rule to the chain of PREROUTING for the nat table as follows:

 iptables -t nat -I PREROUTING -p udp --dport 4309 -j NFQUEUE --queue-num 0

However, when I run "iptables -L ", I can see nothing under PREROUTING chain

...
Chain PREROUTING (0 references)
target     prot opt source               destination
...

Do miss something?

Thanks
