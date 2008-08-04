From: "Shawn Fitzgerald" <sargon97@gmail.com>
Subject: Re: Setting up a proxy with iptables
Date: Mon, 4 Aug 2008 14:06:25 -0700
Message-ID: <50805eb10808041406x545a5ed1q6da8302370a0accb@mail.gmail.com>
References: <K4YPNL$F8087895A3C60C84D241022EEA93B6DB@libero.it>
	 <48941506.6080409@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=TaWC5Ydz5RYcsEtx7C0RDAGnxkScK5ZkTJxDa1CVLkg=;
        b=oA72/lUldPw097IB3g4yxVyQ/wbgG0peseH1Rc6dV2FhxEsXwep6HEh2l3edVdmfTH
         t4lRHEuTUDnCWU4GY3OZ1cMqEoEFY8xIbY81dhG97548Yy2HVFtKYKrnfKaHF90HWMqY
         xTxf2YMa/1epl3yUqgs738HzyTrImguw9Jv/k=
In-Reply-To: <48941506.6080409@unipex.it>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: "linuxmc@libero.it" <linuxmc@libero.it>, netfilter <netfilter@vger.kernel.org>

I did an iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-ports 8080 and nothing. Just to make sure the firewall
was up I entered iptables -A OUTPUT -j DROP and it did block all
outbound traffic.

What am I missing here?

Cheers, Shawn

On Sat, Aug 2, 2008 at 1:04 AM, Michele Petrazzo - Unipex srl
<michele.petrazzo@unipex.it> wrote:
> linuxmc@libero.it wrote:
>>
>> Hi, have you try with a rule like
>>
>> $IPTABLES -t nat -A PREROUTING  -p tcp -m tcp   --dport 80 -j DNAT
>> --to-destination 82.109.120.222:8080
>>
>> ?
>>
>> Best regards ! Marco
>>
>
> Should be better the redirect target:
>
> $IPTABLES -t nat -A PREROUTING -i $INTERNAL -p tcp --dport 80 -j REDIRECT
> --to-ports $PROXY_PORT
> $IPTABLES -t nat -A PREROUTING -i $INTERNAL -p tcp --dport 443 -j REDIRECT
> --to-ports $PROXY_PORT
>
>
> Ciao,
> MIchele
>
