From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: move rule to a position
Date: Thu, 17 Jun 2010 08:26:18 +0000
Message-ID: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=Z/M14pOLHw1pqPFP4aTh5GEKSMFclXyAvCKNfAzJWXE=;
        b=Y7JgIF2ie8sSwm+uPHYs2k2ioNyK2OzYTKamOma+1rbYVVFsgIlc7AbCRHsxiFBOEI
         ZSZD6n44AG8Q1Y1U9FzsTpkOBiAIcJbqfFEW6QBRms46TJasaVynoOxw/2I8Cvc2YThj
         Eo67GSwQbC/lwIvbAGabir0t6Ac6w5cC9vEXM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, all i'd like to move rule to a position.
ex: i've these rules :
1- iptable -A -p TCP --dport 80 -j ACCEPT
2- iptable -A -p TCP --dport 21 -j ACCEPT
3- iptable -A -p UDP --dport 53 -j ACCEPT

after executing these command is there a mean to move rule at
position 3 to position 1 ?
So that the rule at 1 could go to 2 and 2 to 3.

Someone has allready done that ? plz Help.
regards.
