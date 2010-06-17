From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: match many protocol in a rule
Date: Thu, 17 Jun 2010 23:07:33 +0000
Message-ID: <AANLkTinVb4YBnyfJJN6JFA4U9TDDonG2Drmtz-yjMIOV@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=tboMC2bijsjie1jWJMDekRG7sSu7M+gh+G4By/aNG0A=;
        b=j/QM4Ata31dIh3EYwczt+Frg1ag9Bt/v22TB+IsJlfJdywmV01qlzNe1bbrJ3NXjHb
         ep4poH5XSSId9B8ugicg5/d0j4Nuhn0w6xbWGZ6v5RxUNFtKYvYWZfTO2bd1ILoBOVOV
         2NAUY7sW8tl3Ej107xCNijz/S5nMbIOT0Eu10=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all how could i much many protocole in a rule.
I've tried iptable -A INPUT -p tcp,upd --dport 508 -j ACCEPT
but i got error message : iptables v1.4.4: unknown protocol `udp,tcp' specified

regards.
