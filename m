From: Alexandre Moore <alexandre.j.moore@gmail.com>
Subject: [Kernel 2.6.26][rtp/rtcp]
Date: Mon, 16 Jan 2012 11:40:17 +0100
Message-ID: <4F13FE91.1070205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=eEJ70QAUtSVqPYeyl30PRxNI8mgOYStSNz8EHDTIEt8=;
        b=jbPfneCBkSBt0bNqfX+4QMYa3jjruCutD0KLaaODomu5Sat1WdvxIShIr4QGBAiGGi
         XH0XvCa4IhI24cDVDc+qCfnpTbz2xLcOD4BHzU7up4M4q9KhRrkrPNcYYpngX+Lpa9XY
         VQg0T9LLUh67RAdB5s8hkzTRPr9NjWJiqy+sg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello there,

I am currently working on a linux kernel 2.6.26 box with linked to 
multiple ISP (so one or more ethernet connections) and specific ones for 
VoIP usage.
What i want is to restrict SIP rtp/rtcp to specific interfaces 
(load-balance) and I can only use iptables rules kernel modules or hack 
the kernel itself (for resource purposes).
My problem is that I have two different servers for sip rtp (port 5060) 
and sip rtcp (random port 10k+).
So when the rtcp connection is established, it is not related/expected 
to the rtp and I can't track it with iptables. (callback 
ip_nat_sip_expected in net/ipv4/netfilter/nf_nat_sip.c is not called).

box ----- > rtp server xxx.xxx.xxx.1
        \-----> rtcp server xxx.xxx.xxx.2


I am doing it wrong ?
Is there a kernel module that I missed ?
is this kind of trivia is dealt differently with more recent kernels ? 
(maybe i can convince my boss to upgrade).

Regards.

(French IT dev here, so sorry if english is a bit awkward).

-- 
Alexandre Moore
http://alexandremoore.com

