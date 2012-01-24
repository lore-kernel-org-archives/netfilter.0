From: Aleksey Kashin <aleksey.kashin@gmail.com>
Subject: [xtables-addons] problem with TEE and Debian Lenny (Unknown arg (null))
Date: Tue, 24 Jan 2012 23:24:57 +0600
Message-ID: <CAPJYFP-XLLoupqx9t9+C98S887Hr7yDe-oZ0--2fHOcFzOM1hg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=GctEjCoBAevTAPrgkmOaMmz699f2jpWLCrZtVA0OOIY=;
        b=wiuh+PhHSeDbuBILBToI1X2C7UPax3tBJcZBRCE85u15QojDLSsmKYVuC1knM8bkYP
         NB0nmM6vCak6DgXbqg79ZrArTvpSceIkHLHIw2peHckxiKAJAqlkKEQeupJs0xB0Sfpw
         qBxjXSgW7rMkPrcoNQylpPcdqlNybqIydhPAs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

I'm using Debian Lenny amd64. I need clone traffic to another server.
I'm trying to use TEE module from xtables-addons, but I've got this
error:
# modprobe xt_TEE
# iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.99.2.37
iptables v1.4.2: Unknown arg `(null)'
Try `iptables -h' or 'iptables --help' for more information.

What does it mean? Can anyone help me with this problem?

I use the following software:
- Debian Lenny amd64 5.0.8 with 2.6.26-2-vserver-amd64 kernel
- iptables - 1.4.2-6
- xtables-addons-common - 1.26-2
- xtables-addons-modules-2.6.26-2-vserver-amd64 - 1.26-2+2.6.26-27

# lsmod |grep xt_TEE
xt_TEE                  7856  0

# modinfo modinfo xt_TEE
modinfo: could not find module modinfo
filename:
/lib/modules/2.6.26-2-vserver-amd64/extra/xtables-addons/xt_TEE.ko
alias:          ip6t_TEE
alias:          ipt_TEE
license:        GPL
description:    Xtables: Reroute packet copy
author:         Jan Engelhardt <jengelh@medozas.de>
author:         Sebastian Cla?en <sebastian.classen@freenet.ag>
depends:        compat_xtables,nf_conntrack
vermagic:       2.6.26-2-vserver-amd64 SMP mod_unload modversions

Thank you.
-- 
With Best Regards,
Aleksey Kashin
