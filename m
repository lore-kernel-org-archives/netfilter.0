From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: allowing packets from dynamic-dns IP
Date: Sat, 26 Apr 2008 20:16:53 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804262016000.20150@fbirervta.pbzchgretzou.qr>
References: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yakov Lerner <iler.ml@gmail.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-04-26 18:34, Yakov Lerner wrote:

>How can I have a rule that's bound to a semi-dynamic external IP (IP changes
>several times a week) that's bound to known fixed domain name (dynamic-dns) ?
>
>Is there better solution than crontab-script, that every 10 minutes
>resolves this domain and reinstalls iptables rule if IP changed ?

The best solution is a script that runs after the interface
was brought up. Usually this is -- depending on distro --
in /etc/sysconfig/network/if-up.d/.

