From: Ted Kaczmarek <tedkaz@gmail.com>
Subject: Iptables with tproxy 4 support
Date: Thu, 14 Aug 2008 15:27:18 -0400
Message-ID: <A04C0873-3C03-466B-9B4D-D8420AF29956@gmail.com>
Mime-Version: 1.0 (Apple Message framework v928.1)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to
         :content-type:content-transfer-encoding:mime-version:subject:date
         :x-mailer;
        bh=3gFOFDRx+AKGhjvtR4+sgtw243vLUgvOtP/uHfjpHLk=;
        b=xP5KyknNtFCLQ1pQ0zhMslcjoAMAaVy+KaIGQOmKpMKFtcP+9LXZ0TbfVgKS0ZltFN
         nVGqx5Qcjy8ou2RQqNhKeYYNdiYkwA9r95oZvj4gAoloEVYYI+Kc+cX1kpJKf24c5UMy
         lvMfIV/1ceJhSGzYO+rwpuNmA4OSq6jdI3++g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Trying to get a tproxy4 going on Fedora 9.

Got the kernel and tproxy modules built, built iptables 1.4 against  
this kernel source but iptables is not recognizing "-t proxy".

I am using 2.6.25.11 with the iptables 1.4 and tproxy- 
iptables-1.4.0-20080521-113954-1211362794.patch.

It appears to build ok. I edited the spec file from the src rpm, added  
this patch to the patch list, edited the KERNEL_DIR and KERNEL_OUTPUT  
to point to the 2.6.25.11, and  and did and rpmbuid -ba and
appeared to go ok.

The modules nf_tproxy_core and xt_TPROXY load fine.

Any suggestions on where I am going wrong?

Regards,
Ted
