From: Autocad Learner <learn.autocad@yahoo.com>
Subject: [MASQUERADE] Not changing to new source ip address when dynamically assigned in ppp link
Date: Mon, 18 Jul 2011 02:39:36 -0700 (PDT)
Message-ID: <1310981976.47646.YahooMailNeo@web121603.mail.ne1.yahoo.com>
Reply-To: Autocad Learner <learn.autocad@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1310981976; bh=+1C3l49f4+oND9szhi7qnLloKF2a2++9ZZe8YTx0X1A=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=3TL9v63qHNhfaKs1DDF9VreOU/pK69RedXWiEsXw1GacEH9VSlg91vh0b7PrGmB96R+LENBmjnrbtjgKe5JzKeN7gbm0suyxF4bWeurhFz5ZZs54xAQ69RL7NIb6pEN9IBc8FqUPT8NgHBpsUXNSI12KLt7GaAsogMDV01ejFxI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

We are using linux Red Hat version RHEL 2.6.9-5.EL =A0and iptables vers=
ion 1.2.11-3.1.RHEL4 as Source System. The source ip address is assigne=
d dynamically via ppp link over eth0 interface.=A0

When the link goes down and comes back, we get a new ip address and it =
is evident in the ppp0 interface. But the packets going out of our syst=
em still uses the old ip address.

Is there a way we can force change the ip address?

Thanks...
yas=A0
