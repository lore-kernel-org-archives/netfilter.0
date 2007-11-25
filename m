From: "ash sids" <toashwinisidhu@googlemail.com>
Subject: Remote X not working through IPTABLES
Date: Sun, 25 Nov 2007 11:38:30 -0800
Message-ID: <898d8f300711251138w9f36e7cgcf8ef0eb5d9c739f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=u+aX7jAoCLdRn7fEIQyVKM4LoNvOtIF73aBrPxj3QTQ=;
        b=rtICdUSFc1byK5TGjshy+NmklOe4eSHdrDw/yzgmFzArCAaw2W5FbgOIe58+Yc/Z+ouOLURiBEQFUXEbxIZN8d1D9XJEql+VLeeHjAcc/wP86WqZ64K5hhOvGiBZhe7XZopTHxUq3m/m+bDIjSANP3gTeW6mCD1mFCIbjD+f4uY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

HI

I have a debian system (192.168.200.4), the firewall on that as is shown ...
I am trying to run xclock from  192.168.200.2 using putty and  XMING
...strangley enough with the following set up; xclock fails to start .
As soon I change the policy on INPUT chain to ACCEPT , xclock starts working...

Anybody would have any idea why this is happening...

# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     0    --  192.168.200.2        anywhere
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     0    --  192.168.200.4        anywhere
ACCEPT     0    --  anywhere             anywhere            state
RELATED,ESTABLISHED

thanks
ash
