From: xiegaofeng@grandcloud.cn
Subject: Re: Multicast does not work on ebtables
Date: Thu, 11 May 2017 15:01:06 +0800
Message-ID: <0f700380dcf7bbad5386b5e966643f87@grandcloud.cn>
References: <4289f9ef5464dbbcdaee38396ae06e5b@grandcloud.cn>
 <450a7935d46549e2a57147a7eead73be@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
dkim-signature: v=1; a=rsa-sha256; d=grandcloud.cn; s=mail;
        c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References;
        bh=yEMC/HHoyAt8LC1/xS5o3alt5uHFru+wjt8LqR0kBvo=;
        b=VyWKJ2sDfQqBqkjMlr6U/jYHvA66uAefzMHnTB1Lf7Rw3vRzBc+7+7I9ACVz4BiEk3FNK+8Ucm5VImWO7xXvzMIk+ApKEppg91Zsfija/sLmFjM5nEJKvhYJ9wvY5P1DgdI2F8qFJW4T+RLbJpc+hu46+1W1ocNmM2zs4VBo210=
In-Reply-To: <450a7935d46549e2a57147a7eead73be@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?UTF-8?Q?Andr=C3=A9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, Netfilter <netfilter@vger.kernel.org>

Sorry, it's my input error.

When hit the rules of tap1, I copied and pasted them for tap1 and tap2,
but forgot to modify them altogether.

In my last mail, there are three kinds of errors about ebtables rules.

1. It should be ebtables, not ebtalbes.

2. In the following rule, It should be -A, not -p.
ebtables -p tap2_OC --among-src 52:54:0:1:6c:c1=10.200.10.101 -j ACCEPT

3. In the FORWARD chain, it should be:

   ebtables -A FORWARD -i tap1 -j tap1_IC
   ebtables -A FORWARD -o tap1 -j tap1_OC

   ebtables -A FORWARD -i tap2 -j tap2_IC
   ebtables -A FORWARD -o tap2 -j tap2_OC

   ebtables -A FORWARD -i tap3 -j tap3_IC
   ebtables -A FORWARD -o tap3 -j tap3_OC

tap1_IC and tap1_OC are for tap1.
tap2_IC and tap2_OC are for tap2.
tap3_IC and tap3_OC are for tap3.

In my test, the Broadcast packets from VM1 won't enter into VM3,
but the Multicast packets from VM1 enter into VM3.

I don't known why.

