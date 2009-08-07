From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: types of NAT with netfilter
Date: Fri, 7 Aug 2009 16:52:32 +0530
Message-ID: <cfeab66d0908070422i40b6efb9x901d3d839a6fee03@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=7ReLU1CIRYmiTzuSyplFxW3BBbo8KqaK3RZhrr3iLqo=;
        b=h+10jv9ECec9UjAOn2t3dFg90ysBYaevpnZ4bCi3gyaAoY0478DOOggG8BP9h8w143
         ee4rGFUAbJepKMQpWVs4Z875V7EkVMvSBpQcVd4UKZqQHwGal/f01twNlOQE9yySOCKj
         kbvS7Q6Vop9y4RChjbrwhOWpo/rG5egD4NK8s=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi ,

 I have a linux router with  only one rule

  iptables -t nat -A POSTROUTING -i eth0 -o eth1 -j MASQUERADE


 What i understood is (by googling net ) is that  adding this will
give symmetric nat support to my router , is it true  ???.



 1. To have  " full cone nat" support  what should i do ??  Is it same
as DMZ configuration ??

 2 . restricted nat and port restricted nat cannot be implemented
using iptables ???

 3 . i installed windows STUC and tested . Test results show it is a
portrestricted nat ... But if i make default policy for wan INPUT and
wan PREROUING as REJECT , test  got failed ??? is it iptables
dependend ??

Thanks,
Ratheesh
