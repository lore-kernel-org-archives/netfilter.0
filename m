From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Fri, 22 Apr 2011 12:08:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104221207560.24740@obet.zrqbmnf.qr>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu> <alpine.LNX.2.01.1104211240100.5504@obet.zrqbmnf.qr> <BANLkTimY9isyFhAH_ESgfzxo8MWV4HDcoQ@mail.gmail.com> <alpine.LNX.2.01.1104221122240.21484@obet.zrqbmnf.qr>
 <BANLkTinxiLGDYfa+aLV=0XcVbP1W+XhRgw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTinxiLGDYfa+aLV=0XcVbP1W+XhRgw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lu Brian <lyt0112@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 2011-04-22 12:05, Lu Brian wrote:

>if u nslookup www.facebook.com,you can get different resolved ip
>almost every time.

But you get only one, and that is what counts. And from that you cannot 
make an assessment how many more addresses they potentially have.

>Many webs use this kind of wrr dns reply method. It means I need to
>find out all of the resolved ip manually and then add rules for all of
>the resolved ips...
