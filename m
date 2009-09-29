From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: SSH Port Forwarding with iptables
Date: Tue, 29 Sep 2009 18:16:50 +0200
Message-ID: <4AC232F2.6050401@freemail.hu>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Bill Hendrickson <wjhendrickson@gmail.com>

Hi!

You did not told but I assume that the Internal server's default gw is 
the firewall.
I think you need the following rule to get it work:

$IPT -t nat -A POSTROUTING -j SNAT -o $EXT_IFACE --to-source $EXT_IP

Swifty


