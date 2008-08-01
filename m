From: Shawn Fitzgerald <sargon97@gmail.com>
Subject: Setting up a proxy with iptables
Date: Fri, 1 Aug 2008 16:24:34 -0700
Message-ID: <9985EB74-27E3-42CA-B86C-36D895EE2A59@gmail.com>
Mime-Version: 1.0 (Apple Message framework v926)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to
         :content-type:content-transfer-encoding:mime-version:subject:date
         :x-mailer;
        bh=8/rv7fWtKZEuIQNCH7RoFdowh5Ke4FNbbbCj+kAIiJ8=;
        b=H3i7ISPEIIMm5ixl0B1QjWKTDBjKUqxBXVUK1x1/bFl+HnAJgiQv7gNPNXELRLRTR8
         msB9dcbj68s47Ykj7IeAzCAfhqW16R+VtkTxdHRIpuFJ1Bxlf2gWMSD1xRwEl8YEYn0G
         X2oA+57ae53XQjAiFZZEGm4PvrShqoTMMf6EY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hi,

I am trying to set up a proxy with iptables nothing seems to work. I  
would like to forward outbound traffic destined to port 80 on an  
external ip address to localhost port 8080.

Thanks in advance for the help.
