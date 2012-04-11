From: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Subject: flushing & deleting non existing chains
Date: Tue, 10 Apr 2012 23:07:27 -0700 (PDT)
Message-ID: <1334124447.96679.YahooMailNeo@web125606.mail.ne1.yahoo.com>
Reply-To: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1334124447; bh=lqgZN7rao3frjWOInA/JagsV8iE8hxZt+DyAp4G59fk=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=Y0zYtTM96K4ITHd1CdJFe37tPsDBBgOKRoRiieXcassWkpQZqjfj2quduITxEQ7HF5JE3NzVAeX8qRHr/lOizmyFvxYq0WdzObukB9fyMrkT/LsRSMaFGKo8KeWhRD+pwp9fwH9sezi8uIQS6PRwMLC7Cq4ZEbgz8VuD4SKXw+A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

Hi

I was trying to flush a chain, delete all the rules and delete the chai=
n before creation of the chain.
This approach worked fine in iptables-1.4.0, but seems like in iptables=
-1.4.12.2, we cannot flush a non existing chain.
Is there any change in the expected behavior ?


Snippet below works fine in 1.4.0 (using iptables-restore), but complai=
ns in iptables-1.4.12.2


*filter
:FORWARD DROP [0:0]
-F chain_tun_0_
=A0-D FORWARD -o tun_0_+ -j chain_tun_0_
=A0-D FORWARD -i tun_0_+ -j chain_tun_0_
-X chain_tun_0_
:chain_tun_0_ - [0:0]
=A0-I chain_tun_0_ -j DROP
=A0-I FORWARD -i tun_0_+ -j chain_tun_0_
=A0-I FORWARD -o tun_0_+ -j chain_tun_0_
=A0-I chain_tun_0_ --protocol all -o tun_0_+=A0=A0=A0 -j ACCEPT
=A0-I chain_tun_0_ --protocol all -i tun_0_+=A0=A0=A0 -j ACCEPT
=A0-o ext0 -I chain_tun_0_ -j DROP
=A0-i ext0 -I chain_tun_0_ -j DROP
COMMIT


Regards,
Gopi

