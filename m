From: Mike <mikef1007@gmail.com>
Subject: Re: Ports
Date: Thu, 20 Nov 2008 10:24:55 -0800
Message-ID: <d006ee070811201024x23f6fa88l20edfab22ef20e2f@mail.gmail.com>
References: <d006ee070811192334o159d28b2mc48713998e423f13@mail.gmail.com>
	 <20081120122753.606233a2@nacelle.mxtelecom.com>
	 <d006ee070811201000k7684ffaah4851e687dc3942d4@mail.gmail.com>
	 <20081120180728.23e681bf@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=aF0Wi3j+i0zsUQoiUExVnUKH2VBL4vE57PJTHlCujw8=;
        b=sIuAsaj9/ARKJlavPIQZZ2RwPTJIg+Ps4KhGWVuLy5RrbYTCp8Zg/AFRfK7A/aglA6
         VIDzrpvTfqSWpOYF7yud4SHhSTYbi1oZJNZGCiHsR4cykY1SaY2lPxrmEZ1XvQFbzHbs
         Rw6VxCf4XGSObA8n2rnKg+t7dfKoqeRahft0Y=
In-Reply-To: <20081120180728.23e681bf@nacelle.mxtelecom.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Evans <paul@mxtelecom.com>
Cc: netfilter@vger.kernel.org

On Thu, Nov 20, 2008 at 10:07 AM, Paul Evans <paul@mxtelecom.com> wrote:
> On Thu, 20 Nov 2008 10:00:20 -0800
> Mike <mikef1007@gmail.com> wrote:
>
>>  iptables -t nat -A PREROUTING -p tcp --dport X -j REDIRECT
>> --to-ports Y
>>
>> I ssh from another box, into the box I issued the above iptable
>> tcpdump only showed traffic on port X and nothing on port Y
>
> That sounds correct. tcpdump watches very close to the "wire"; that is,
> what comes in/goes out over ethernet or PPP or whatever the link uses.
> For incoming traffic it will see before nat has rewritten the packets.
>
> Try watching the -i lo interface, instead of eth/ppp/whatever

Tried '-i lo', nothing showed up.

I rechecked my ports, tried again, tcpdump'd X and Y,  ssh'd from
another box and it WORKED!

Thats good and all,  but when I iptables -F , shouldn't I stop seeing
traffic on my redirect port?  Am I missing something else?

thanks,
Mike
