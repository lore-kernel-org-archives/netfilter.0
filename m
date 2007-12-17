From: "Srinivas Murthy" <codevana@gmail.com>
Subject: redirected port
Date: Mon, 17 Dec 2007 10:28:32 -0800
Message-ID: <df1bdeb10712171028i152d5566k96fc5cc36f27dbdc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=METPTfMOEfEz81fq6yHxU0V3eBukJDWudZ3snioGAM4=;
        b=lDJdQDbjaNmOpkpU7lnRvKHq/1pglNoklGdXsAUOcV2vCal3b2WIXX4bqe3k/qNmYW8+MvAujV5Ytk3Ut4ITEoSMvk3zceZZEmPHHjawMknzvFW+OeYMfF8aCc88NQ0qgah7WrDuSBSak2EHGUgAihDdMRTAV5F7In3o/NCHePY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
  Given an skb, I need to apply the NAT rules and get the redirected
port etc. With ipchain, the ip_fw_ctl()
http://lxr.linux.no/linux-bk+v2.6.10/+code=ip_fw_ctl was providing
this in the kernel space.

 Can you guys send me some pointers on how I can do this using iptables?

Thanks.
