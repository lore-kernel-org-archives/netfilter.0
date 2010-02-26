From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Port Scanning: Is there a difference between stateful INVALID 
	filtering and stateless TCP flag filtering?
Date: Fri, 26 Feb 2010 12:22:22 +0530
Message-ID: <cfeab66d1002252252o3086bcf3l4be45bc4472239c1@mail.gmail.com>
References: <ac5c74141002240018pd69e696vce194ed87e90b643@mail.gmail.com>
	 <4B8509B6.7000408@chello.at> <4B850B88.1070702@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=WyHhFwWqsajoig9tnj+/Aa9OnaEb9iAThxozhay1ZWs=;
        b=d4x0doxDBb+3UNDQJGjMmXptf3s6XQt4RoEojfpk3t//UYh4rt9srjFvjJ54XoTVek
         3DLBbNUTT4ooLBhPqP2644iDqvtga056lRbfulwusWksLFgdiR2LSHbzLy82E5ltU4pT
         xsyACrKNqNlX0DnvojmAjB/+l4oHfg2FDbVF0=
In-Reply-To: <4B850B88.1070702@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

awesome document .

On Wed, Feb 24, 2010 at 4:50 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> On 24.02.2010 12:14, netfilter-owner@vger.kernel.org wrote:
>> On 24.02.2010 09:18, netfilter-owner@vger.kernel.org wrote:
>>> Hello everyone,
>>>
>
>>
>> iptables -I INPUT -m state --state INVALID -j LOG
>> iptables -I INPUT -m state --state INVALID -j DROP
> just the other way round...
>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
