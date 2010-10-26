From: Wei Huang <daviseago@gmail.com>
Subject: Process iptables hook functions at IP layer with 'bridge-nf-call-iptables"
 enabled
Date: Tue, 26 Oct 2010 13:38:33 +0800
Message-ID: <AANLkTimFED68sGH=3Uh801y_kdGuEX+2Sa-=XMSfnP=V@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=YsA6NBCltgF3r/ISY41DL+3g914y8Qj1cWG3NH12ryU=;
        b=UyW2qTbl0jKoM5uZOhE27nA65oUhECTir0kPrRZUiWuDrv7PKTzvKqU2fZsMpJR25V
         F9WNSyulG+PLXWBhC3jrHutoTQfAp8VQDq8zaKTY9+JweS6SGFNW7vz4f9545Tc4wXis
         bmFmUBjtbHL0o8Qx7CQZdFTS3TZmpuUt2Ip/Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm writing a kernel module with a netfilter hook functions at
NF_IP_PRE_ROUTING of PF_INET. This is supposed to be processed at IP
layer. However, when using ebtables' bridge-nf and enable
"/proc/sys/net/bridge/bridge-nf-call-iptables", my hook function will
be processed at link layer.

The page http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html#section3 says:
"For IP packets that get into contact with the bridging code, the
br-nf code will decide in which place in the network code the iptables
chains will be traversed. Obviously, it is guaranteed that no chain is
traversed twice by the same packet."
Does this mean the iptables are handled at bridge-nf (NF_HOOK in
br_nf_pre_routing()), and ignored at NF_HOOK in ip_rcv()?

If the IP pakcets will be passed up to IP layer anyway, will it be
better for bridge-nf not to call iptable hook functions, but to let
the packets be processed at IP layer? How could I do that? I could not
disable "/proc/sys/net/bridge/bridge-nf-call-iptables" to achieve
this, because if I disable it, all packets directly bridged (those not
up to layer3) will not be processed by iptables rules.

Thanks for your help,
HUANG Wei
