From: FiloSottile <filosottile.wiki@gmail.com>
Subject: Re: Iptables without ipt_state using xt_state
Date: Wed, 13 Jan 2010 13:50:05 +0100
Message-ID: <4B4DC17D.2010200@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=4vnKLIxms2C4LYu9c8LGbuJ/wh0LBTVh3qc64IISiD4=;
        b=n1jXenF8wcz+xn4lhw6hgEZhQgLnhaRFtI1e0o8vgouY2cvp7RLzezb/cySFGG+ED+
         z2NITySdPTXMbcq2umIRBFXVzyK/954hGWv4ME5bdvR7svvdV+6AgiDkTh/7DQsvEvjB
         VcyCiAaDs3SkWIGHxikg1O9zyIN8LUixw8ATY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I cannot verify if the module is loaded from the config, but if it is
loaded the command

# iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

should work...
So, if don't have that module loaded, how can i do to get a firewall
configured?

Thank you

-- 
Filippo Valsorda                             FiloSottile@WikiMedia
Linux registered user #492189        Ubuntu registered user #27865
PADI Rescue Diver #0907EL9205    DAN ADV O2 Provider + BLS #281664
www.filosottile.info                      GPG 01A82A13@pgp.mit.edu
Key fingerprint 94B6 85B2 AE48 1C47 BD4D  DC5B 16F3 ADA6 01A8 2A13

