From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables ERROR
Date: Thu, 25 Jun 2009 17:11:28 +0200 (CEST)
Message-ID: <alpine.LSU.2.00.0906251710030.20659@fbirervta.pbzchgretzou.qr>
References: <1245934611.4518.58.camel@ripper.synapse.com> <1245938452.4518.63.camel@ripper.synapse.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1245938452.4518.63.camel@ripper.synapse.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ritesh Majumdar <r.majumdar@globallogic.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Thursday 2009-06-25 16:00, Ritesh Majumdar wrote:

>Hello,
>
>As per my earlier mail.
>
>Here is error I get on my /var/log/messages.
>
>kernel: ip_tables: set match: invalid size 96 != 32

This could be related to http://markmail.org/message/dijxb6i6325t6hge
So be sure to use ipset 3.0 (it's out now) with iptables 1.4.4.

