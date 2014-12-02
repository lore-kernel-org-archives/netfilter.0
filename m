From: Jean-Philippe Menil <jpmenil@gmail.com>
Subject: nftables compatibility
Date: Tue, 02 Dec 2014 23:09:50 +0100
Message-ID: <547E38AE.6000909@gmail.com>
Reply-To: jpmenil@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=20DcG3kSr1ijNquJFmPX/bbCfOkxUwBPJU8Pr088/PE=;
        b=zz7l7hiDs7+AP3tAv93Afc7xwbmq2ogob4AwzgfrliFD14c9dKM+aKMDMPJvtz/gji
         3ci0J1JrhZgugBYpqaJmn6df5tgOqp66Y4K5ZqoHvttYqFfkjfv/xVFiYdf53U1eE1Wk
         xTAmGV2S66nKnLUjUwXXX4V3vKv6TQ/saqTSp783b9UZFIOgePbPFPRJdzVdqN0QI2MT
         JjvOsp6m5dM6w173G7167xq1QGGtdFwsX+wEYL5crSslb6FCiSQScu7ThLkOdmehFkts
         c6gPjdHeryfN2K4MccZA6xNfisqIZHPZwWD1IiZ9VraUNOiGcLQxmUN5WXE+7Vthk3yO
         Zojw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

while playing with nftables, i observe that my iptables masquerading do not
work anymore:

modprobe nft_nat
modprobe nft_chain_nat_ipv4
nft add table nat
nft add chain nat postrouting { type nat hook postrouting priority 0 \; }

^^ iptables nat stoped work here.

I'm sure i read that nftables and iptables  where compatible.

Can anyone point me what am i missing ?

(I'm on 3.17.4)

Best regards.
