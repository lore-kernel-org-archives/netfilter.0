From: Michael Hakimi <yalakvar@gmail.com>
Subject: iptables - Problem with NFQUEUE target from a specific interface
Date: Wed, 23 Jun 2010 10:58:34 +0300
Message-ID: <AANLkTinQALL2BWpwsajmzngGgYvWC6qQZXZZQAgqAGpT@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=/JQCsU30rR75kmS9gbc034dJXxX36R/iNwEehru2Hxo=;
        b=UYN503roWQ2Tgb5PoD8O0Tk1wV/j8rE3si+HhDuZ6DZm3l/Dcd/FpLU8ukJPOBZn/x
         nWeMVN78eYbZ3CPX23XmFIpbMHxe7yNax9HF/vhJWKc8t0l2/98BYS2gphGyqEINJNOW
         7AItZJol1bAWJuGrWykLYxz5GoxJVyScZBiM4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I am using libnetfilter_queue in order to manipulate incoming traffic.
In order to transfer  all the incoming traffic to my queue I set this
rule in iptables:
iptables -t raw -A PREROUTING -p ALL -j NFQUEUE --queue-num 22

The above rule seems to work fine. The problem is when I want to
transfer only the incoming traffic that came from a specific interface
to my queue. To do so I set this rule:
iptables -t raw -A PREROUTING -p ALL -i eth0 -j NFQUEUE --queue-num 22

The problem is that my queue doesn't receive anything.
Thx in advance for any help.

Regards,
Mickey
