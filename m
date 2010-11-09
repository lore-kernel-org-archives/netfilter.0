From: Sumin Xia <xiasumin1984@gmail.com>
Subject: How to transfer a IP packet based on ebtables and iptables?
Date: Tue, 9 Nov 2010 13:56:36 -0500
Message-ID: <B6443739-BE5C-44B0-916D-69C4764DBDF6@gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to
         :content-type:content-transfer-encoding:mime-version:subject:date
         :x-mailer;
        bh=c2jif0ROzoHvFm7U1T/9aRjNuta4IK9+Ld/iJ0hw+BI=;
        b=yG+1LaRR6JWvGha1P6oaqtspShAz7cb6Tmwb7bLdriAUGU/HtSXZZaz9R482jwunou
         7n94RU+G/x2/TDv8bcHIjiWoODTOzbaDfk4TsMvvSWdCyZ2S1WHNQqxIqqzSd8ekrsE1
         ZCVWi1Z+RC9lpcoEoDgDQUFC6NlmBxOR55O2U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hi every one,

According to my understanding, if I implement entables on my Linux  
system, a frame should be passed through ebtables modules. Then, if  
ebtables modules find the destination mac address of the frame is the  
local mac address, it will transfer the frame to layer-3, that is  
iptables, right?

Now I want to do a test, which modifies the destination mac address of  
a frame before sending it. Therefore, the frame will be forwarded to  
another destination instead of the real destination, while its  
destination ip address is still the real destination ip address. In  
this case, when the frame arrive at pseudo destination machine, will  
it be transfered to lay-3 of the system? If it is transfered to lqy-3  
of the system, the system will find the destination ip address is not  
local ip address. What will happen next? Drop the packet? or send an  
arp request to find the real destination mac address and forward it?

Thanks,

Sumin
