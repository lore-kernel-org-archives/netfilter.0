From: Andy Theuninck <gohanman@gmail.com>
Subject: --iif argument unrecognized by iptables
Date: Sun, 25 Jan 2009 17:59:57 -0600
Message-ID: <f8a02f3e0901251559q6324e3faqc75af6d16eba8038@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=CORHOaeSXnvEcAO3WZHwZz+juPnpzsqB/Sml8SS5gbU=;
        b=G1Kjosv/bPpgyMUx5V95Xr68lfQdyk/M/s5dO/PY+bnbkkeYwPI/Up5bayEDHh8oMv
         Gg4IuE3KrIBSZP0x6mrjpmce5XPmjkmc0/Z1o857bEZjopJOMvu4HQO4mGn83d7LXGmi
         UHedgXL109J7VxtXjRPeMdVoUUObPjoG/yK0A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm running into a fairly odd issue. I want to redirect certain
incoming packets to a different interface. I'm trying to do this using
the ROUTE target in the mangle table, but for some reason it doesn't
work. Here's what I'm seeing:

# iptables -t mangle -A INPUT -d 192.168.1.2 -s !
192.168.1.0/255.255.255.0 -p udp --dport 500 -j ROUTE --iif eth0:1
iptables v1.3.5: Unknown arg `--iif'
Try `iptables -h' or 'iptables --help' for more information.

I'm a bit baffled. I can't find anything in the man page that I'm
missing. It seems like this *should* work.
