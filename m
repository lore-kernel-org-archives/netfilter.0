From: Sam Roberts <vieuxtech@gmail.com>
Subject: how do I find the supported targets for the raw table's PREROUTING chain?
Date: Tue, 14 Jun 2011 17:35:55 -0700
Message-ID: <BANLkTim=jr02N6izXOwMw+djtsvYahrwRw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=yhW1EPCu6Zlfwu9c8vpHbiUQ0TQEdE/naU15okLDLLc=;
        b=dpvcm3I6Iwap8u8gEWb01nOxBeE4gfc5mcrBmbFN6SyURouCnvUHQ4XF0OmzSDPeDL
         kUWXj1BD38LV1UIYQxdzKp9fcZjifBP8b8kwyOOEUDxizzZ1EYqeQCzZsmDIGLjlvgAf
         HAFH1KDZewpAC5hdRWgHvsNRU5xWV+EtsAEkM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Why would there be no chain/target for iptables -t raw -A PREROUTING -j CT?

It's almost like the CT or NOTRACK targets aren't built into the
kernel, how do I list what targets are supported?

Thanks,
Sam

This doesn't work:

root@x86-gaia:~# iptables -t raw -A PREROUTING -j NOTRACK
iptables: No chain/target/match by that name.

root@x86-gaia:~# iptables -t raw -A PREROUTING -j CT --notrack
iptables: No chain/target/match by that name.


But this does:

root@x86-gaia:~# iptables -t raw -A PREROUTING -j ACCEPT


My versions are:

Linux x86-gaia 2.6.39.1 #1 SMP Thu Jun 9 15:49:16 PDT 2011 i686 unknown

iptables v1.4.10
