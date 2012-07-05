From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: What is localnet?
Date: Thu, 5 Jul 2012 21:06:13 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207052105540.20003@frira.zrqbmnf.qr>
References: <CAHEKYV6iST2_rFqaEUibAZqGG2jwUhMHUP3ve7xro-UgjrtTNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHEKYV6iST2_rFqaEUibAZqGG2jwUhMHUP3ve7xro-UgjrtTNw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauricio Tavares <raubvogel@gmail.com>
Cc: Netfilter <netfilter@vger.kernel.org>


On Thursday 2012-07-05 20:03, Mauricio Tavares wrote:
>iptables -L -t nat
>Chain PREROUTING (policy ACCEPT)
>target     prot opt source               destination
>FORWARDS   all  --  anywhere             firewall.fake.domain.com
>SUBNETFWD  all  --  192.168.42.0/24      firewall.fake.domain.com
>SUBNETFWD  all  --  localnet/24          firewall.fake.domain.com
>SUBNETFWD  all  --  192.168.22.0/24      firewall.fake.domain.com
>
>and yet the other two subnets are fine. Why does it want to make
>10.0.0.0/24 localnet?

Because you have defined it that way in /etc/networks?
