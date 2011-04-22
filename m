From: Lu Brian <lyt0112@gmail.com>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Fri, 22 Apr 2011 18:35:54 +0800
Message-ID: <BANLkTimJC8HmC1ffQ8R7EYhVOayznZ70XA@mail.gmail.com>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
	<alpine.LNX.2.01.1104211240100.5504@obet.zrqbmnf.qr>
	<BANLkTimY9isyFhAH_ESgfzxo8MWV4HDcoQ@mail.gmail.com>
	<alpine.LNX.2.01.1104221122240.21484@obet.zrqbmnf.qr>
	<BANLkTinxiLGDYfa+aLV=0XcVbP1W+XhRgw@mail.gmail.com>
	<alpine.LNX.2.01.1104221207560.24740@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=Gfgc6KjUIQoLeSU1COA0UHXww9TfYBdXsiHiJ25sGC4=;
        b=dmVCrhC49WfptMs6J7LW8HLvl61iD5sn00a4+14KtUII9iSkwGPruhP60cFdGAaErS
         zKhq3O15PBjPbyW7NUiWk8Vzlz5w+A8rvLEbl6Sf5Ag4B1S6qQbU3xOY7C7WdD2UPJJ5
         ditM0+wd+MqTlAm34t8BP5V9QYyQyWeVlqEW0=
In-Reply-To: <alpine.LNX.2.01.1104221207560.24740@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

yes,..this is the problem ...

2011/4/22 Jan Engelhardt <jengelh@medozas.de>:
> On Friday 2011-04-22 12:05, Lu Brian wrote:
>
>>if u nslookup www.facebook.com,you can get different resolved ip
>>almost every time.
>
> But you get only one, and that is what counts. And from that you cannot
> make an assessment how many more addresses they potentially have.
>
>>Many webs use this kind of wrr dns reply method. It means I need to
>>find out all of the resolved ip manually and then add rules for all of
>>the resolved ips...
>
