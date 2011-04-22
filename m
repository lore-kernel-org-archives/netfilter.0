From: Lu Brian <lyt0112@gmail.com>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Fri, 22 Apr 2011 18:05:02 +0800
Message-ID: <BANLkTinxiLGDYfa+aLV=0XcVbP1W+XhRgw@mail.gmail.com>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
	<alpine.LNX.2.01.1104211240100.5504@obet.zrqbmnf.qr>
	<BANLkTimY9isyFhAH_ESgfzxo8MWV4HDcoQ@mail.gmail.com>
	<alpine.LNX.2.01.1104221122240.21484@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=POoGIyhiX/a42y7nUgyVtWFzEhT3PNkjRJ0FAAO/89A=;
        b=Qw7NahJ9ZXlQL4oBvUA0/AJd1LPZ6YFLp/drigh3Iw9U2Kk0kEvfJEfY+ziqvt4N2w
         u5fG6fBrcwWpVihVuT+BRk7IK3DCHxdUtecmzl7+21+lH/zXHfUpjEsmoq2kzrQqPgbm
         FO7ErPHHrcnUinwkp40QSI56CZ7zV8KhoAoY4=
In-Reply-To: <alpine.LNX.2.01.1104221122240.21484@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

if u nslookup www.facebook.com,you can get different resolved ip
almost every time.
Many webs use this kind of wrr dns reply method. It means I need to
find out all of the resolved ip manually and then add rules for all of
the resolved ips...

2011/4/22 Jan Engelhardt <jengelh@medozas.de>:
>
> On Friday 2011-04-22 09:19, Lu Brian wrote:
>>
>>when i type the command :
>>[root@localhost ~]# iptables -t nat -A POSTROUTING -s 192.168.3.0/24
>>-d www.facebook.com -j SNAT --to-source 192.168.3.254
>>
>>I can only get 1 new rule for the domain www.facebook.com
>
> And why is that a problem? facebook.com resolves to only one address.
>
