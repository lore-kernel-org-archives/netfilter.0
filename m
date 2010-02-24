From: MargoAndTodd <margoandtodd@gmail.com>
Subject: ip_conntrack_ftp not loading
Date: Wed, 24 Feb 2010 13:08:41 -0800
Message-ID: <4B859559.8030209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=q2ILHwML734xtZvxX5kKMPpzHizYVK2/x3w5SuhbhaE=;
        b=VS8zj92s49WCblDMhXnCH32NnKPa+NRC5QxbbV4bmqJB3K22/chxCkOHOEr16uKfyT
         NGOE52ERZ7H7FnmEICsAiPA11UY2JiAkhDJh8/NuVljifymaQgPjVsiz5xTV5TRjnnBR
         /zyz0DGivuyO2St2gw0jlOuIOjfsNEU397mbA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

This is really messing up my passive mode ftp rules.

I am using 64 bit CenOS 5.4 (Red Hat Enterprise Linux clone)
and iptables-1.3.5-5.3.el5_4.1

In /etc/sysconfig/iptables-config, I have

IPTABLES_MODULES="ip_conntrack_netbios_ns ip_conntrack_ftp"

Problem:

    # lsmod | grep -i ip_conntrack_ftp

return nothing.  ("ip_conntrack_netbios_ns" does not show
up either.)

Stopping and starting iptables does not help.  Rebooting does
not help.  In my /etc/rc.d/rc.local, to get ip_conntrack_ftp
to show up on lsmod, I had to add:

/sbin/modprobe ip_conntrack_ftp

I do not have this problem on my 32 bit machine.

Is this a bug? and is it time to report it to Red Hat?

Many thanks,
-T



