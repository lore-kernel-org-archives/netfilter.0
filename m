From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: SNAT range does not use unique IP
Date: Mon, 16 Dec 2013 10:23:01 +0100
Message-ID: <52AEC675.4020702@plouf.fr.eu.org>
References: <e7ab2e194832d5b3253cf7d6cdde9f63@scarlet.be> <20131212223443.GA2211@home> <dbbe65eac46a94f6da1bf3b22ec75b34@scarlet.be> <20131213172115.GB3067@home> <b52fefde900473c435ec56a50c2f5242@scarlet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b52fefde900473c435ec56a50c2f5242@scarlet.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Igor S <nat4592@scarlet.be>
Cc: netfilter@vger.kernel.org

Igor S a =E9crit :
>=20
> Understood. But is it normal that NAT uses absolutely the same IP/por=
t=20
> combination for different source IP's?

Yes, as long as the destination address/port are different.
