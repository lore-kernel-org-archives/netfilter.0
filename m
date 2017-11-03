From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Traffic shaping with nftables maps and tc
Date: Fri, 3 Nov 2017 11:48:01 +0100
Message-ID: <CAOkSjBh8H2tn6noj9BrbGcwdk4nnjZxm-4TiTVyhm+jciSYCew@mail.gmail.com>
References: <62018f4d1c124ef84a7bd2281b1b2dcc@spoje.net> <392d67152072ea965fd56fbe6efefab7@spoje.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <392d67152072ea965fd56fbe6efefab7@spoje.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Mudrunka <mudrunka@spoje.net>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Try this:

meta priority set ip daddr map { 1.1.1.2 : 2:2222, 1.1.1.3 : 3:3333 }
