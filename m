From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Double stack IPv4&&IPv6 for a firewall
Date: Sat, 25 Aug 2012 23:38:10 -0400
Message-ID: <306406300a671d4e33566184738d9563@linuxwall.info>
References: <50375A06.6000808@cica.es>
 <1345818598.2977.265.camel@denise.theartistscloset.com>
 <alpine.LNX.2.01.1208241640240.16184@frira.zrqbmnf.qr>
 <CAPfcJatemcsT5PK+m8__xhB7gBRinAuq2wNX_g93CQrSmvtDhQ@mail.gmail.com>
 <alpine.LNX.2.01.1208250137290.30075@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxwall.info;
	s=samchiel; t=1345952290;
	bh=u+WyMAl5ucqU0kO9Lekv9rw0pRrFfyc9+VHIMyqvuqA=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=AhfXqS5pg9UAJSyyiScjHlqLO8xC4b0siCMHT7rjdmOMQwcHB7ND3+8okQCzmTO/0
	 Xe8jHcYWZMMJXEXbJzgfF+66SeoBm3RGu8OdCC4uJk1boeWWbJ1Oa6a+FG1N4cGqfH
	 4a5B4qSSFNTa6HldnVr9Bjz+12bY3ctOebKmscEw=
In-Reply-To: <alpine.LNX.2.01.1208250137290.30075@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2012-08-24 19:46, Jan Engelhardt wrote:
> On Friday 2012-08-24 23:12, Arturo Borrero wrote:

>>You usally set your ruleset in this way:
>>
>>$IPT -A INPUT -i $IF -s $INTERNET -d $MYSERVER -p tcp --sport 1024: 
>> --dport
>>$SSH_PORT -j ACCEPT
>
> If you begin with something like this, no wonder it's all going slow,
> because you are needlessy reloading all the damn rules.
> That's why smart people use iptables-restore.
>

Oh, only about ~2000 times faster in my tests :p
http://www.slideshare.net/slideshow/embed_code/14051936?startSlide=22


-- 
Julien Vehent - http://jve.linuxwal.info
