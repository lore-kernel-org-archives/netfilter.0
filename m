From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: removing black listed ip
Date: Tue, 20 Apr 2010 08:16:15 +0530
Message-ID: <m2qcfeab66d1004191946g1a566eb8k7886cd56b6aa968c@mail.gmail.com>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>
	 <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>
	 <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>
	 <alpine.LSU.2.01.1004101938350.4171@obet.zrqbmnf.qr>
	 <n2jcfeab66d1004112324t35d8d49cx7eebfcfe88b4f461@mail.gmail.com>
	 <alpine.LSU.2.01.1004121427530.30496@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=obc8O1EqH0EsE4TCZc74/Tkxe74gPpC2yM/W2At+H/0=;
        b=YQR6VOrbmnc32fIIQGTVLVsTRcFAe/cPlPEhxMD9ZWhAXsElVeqA0CjV29VCYIkgBD
         Z0mhtPfGRcoYUDAhwSHrshczt3wnxBw3p9Pe/NXIghJHpMjpGzuDWNb3O8BGYH4TX1SS
         DiKFCk2YdjJkemCdI8MYAsj/UdD+XXsczpeCo=
In-Reply-To: <alpine.LSU.2.01.1004121427530.30496@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Mon, Apr 12, 2010 at 6:00 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Monday 2010-04-12 08:24, ratheesh k wrote:
>>On Sat, Apr 10, 2010 at 11:12 PM, Jan Engelhardt <jengelh@medozas.de>=
 wrote:
>>> On Saturday 2010-04-10 19:20, ratheesh k wrote:
>>>
>>>>> xt_recent works by comparing the difference between an entry's
>>>>> timestamps and the current time with the chosen --seconds paramet=
er.
>>>>
>>>>If an ip is black listed , when it will get removed
>>>
>>> It will not get removed. If you want any action, such as blacklisti=
ng,
>>> to stop after a given time, you use --seconds as I just told.
>>
>>if =A0number of ip balcklisted ip is more than =A0ip_list_tot , old
>>entries will be replaced by new ip addresses ? . { once list if full =
,
>>what will happen for new black listing }
>
> As I see it yes.
>

suppose one particular ip is blacklisted by accident ...I want to
remove the ip from black list . How can i do that ?
