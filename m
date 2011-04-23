From: jian Jiang <ottojiang@gmail.com>
Subject: about TEE and POSTROUTING
Date: Sun, 24 Apr 2011 00:07:18 +0800
Message-ID: <BANLkTimc=jBEcQuaUoUxrm0GJc09MPb9gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=eJRT5VonVV8BIDQNY/nHVK0wCtoq+nTyEVph+GWnTXk=;
        b=YTLZ7zhobFkXX3K32o4dqSAjEuScRmQ4EC/91IFLL80ScVFVMpMz4mSbpth2gbk8Ey
         wTzcGmAmPwGC0pPdlW0milU91TzidY6Mu4xxrQ3XOjQTWqKZlZnX/nNb5Otx4xutgAPD
         0HgQYEGPVda+kBuMtVsx8R6UoFXAQTudWofNY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I want to copy all incoming packets of eth0 and send over eth1,  I
wrote rule like that:

1. iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.10.10.1

then I added another rule:

2. iptables -t mangle -A POSTROUTING -o eth1 -j DROP

to capture copied packets.

From iptables's count information, I saw packets are copied by rule1,
but did not
match rule2. But I have checked by tcpdump, copied packets indeed sent out
by eth1.

My problem is  that packets copied by TEE do not  go through POSTROUTING?
or is my understanding wrong?

thanks.

-Jiang
