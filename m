From: Amish <anon.amish@gmail.com>
Subject: delete matching rule like it can be done in case of iptables
Date: Sun, 5 Dec 2021 17:25:29 +0530
Message-ID: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to
         :content-language:content-transfer-encoding;
        bh=Z9mgsmA4kPn8GcGNNXDbhMGXNMSOb0ZYpNLrk4boL0o=;
        b=eZCtR2AiJZG/pLOT+3Ji7Jnpcvlmj6PjZWjShtgIJclrlw7wlvXrvXpXYY7nuR9BBn
         8C4eMYbj4lBPO62aFdEOgkeYlRbPrI1+t+ON6yOSfxDOkX385r1UoTX3OXvJSsESg1ND
         AQhTbbVTd3dnjDjlnttcLm4oQTGXEoBkDShlh0l6YgH+SSMiecUsMdE8D79rPRLgkMQq
         pwSMvdAQR0oUKcR4ScevpY5Z9w5VaCzuDOlYEaXFaCLLY14fZ+i4JZez0gDyB1uTHLKy
         whIW+aKozCuEJ75sIqC/Kasp8HEaANiUdN45+P6nCFTiTGksf1z3cazULy9Esei4L/hn
         1zJg==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

nftables wiki [1] mentions this:

 > Note: There are plans to support rule deletion by passing:
 > % nft delete rule filter output ip saddr 192.168.1.1 counter

Any idea when will this happen? Because I thought it was very important 
feature. (unless I missed an alternate way to do it)

I want to migrate from iptables to nftables (from many years) but 
deleting a rule via script is not as easy as in case of iptables.

Obtaining the handle first and then deleting it is difficult 
programmatically.

Why is it difficult for nftables to find and delete matching rule?

Is there any ETA for this because its a roadblock for migrating my scripts.

Thank you,

Amish.

[1] 
https://wiki.nftables.org/wiki-nftables/index.php/Simple_rule_management#Removing_rules
