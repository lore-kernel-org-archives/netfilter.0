From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: allowing packets from dynamic-dns IP
Date: Sun, 27 Apr 2008 00:23:09 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804270022280.20150@fbirervta.pbzchgretzou.qr>
References: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com> <f36b08ee0804261302ubcc568fyab0d42e5645e3eab@mail.gmail.com> <4813A7B2.8020401@usa.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4813A7B2.8020401@usa.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Cepek <josh.cepek@usa.net>
Cc: Yakov Lerner <iler.ml@gmail.com>, netfilter@vger.kernel.org


On Sunday 2008-04-27 00:07, Josh Cepek wrote:
> Yakov Lerner wrote:
>>
>> I need to setup iptables on system A to drop packets from all IPs
>> except packets coming from system B. System B has dynamic IP
>> (dynip.sh).  B's DNS name is known but B's IP is not fixed. What
>> are my options to setup iptables on A ?
>
> iptables only deals with IP addresses, although it will convert a
> DNS name in the command to an IP (or series of IP's if the lookup
> returns multiple A records.)

iptables will error out if it resolves to more than one and the
specific option (= most) only takes one.
