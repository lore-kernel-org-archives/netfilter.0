From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Re: Port Forwarding Question
Date: Sun, 17 May 2009 14:54:10 -0700
Message-ID: <8ec0428d0905171454yd2919d0o90e6977d99d626ff@mail.gmail.com>
References: <8ec0428d0905061125n7aad6c74nc3b63bfedf890fa8@mail.gmail.com>
	 <4A045660.3070605@unipex.it>
	 <8ec0428d0905171444q4e8a75dj6e60bfbab93bc75d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=5RzXBTj5FogyATXdMJc1OZM2FCTdZety5Htdwf8KGSo=;
        b=GSvvsmLC/NlrJ5znSVoy9OwBLC8Nvqqf2TyatEgyjoh9FiwYq4tsHDIG6EU3u9CbiC
         0Q3YCxLLpzWO2TArHPSQ46hFcQwG4K0+KYVzl6M2feszuW2aedoUR0K8mHx1lxeaXXQg
         XliNTh7evLXLwsePf/ykhn835dZ2T/WdOXALY=
In-Reply-To: <8ec0428d0905171444q4e8a75dj6e60bfbab93bc75d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Fri, May 8, 2009 at 08:57, Michele Petrazzo - Unipex
<michele.petrazzo@unipex.it> wrote:
> Aaron Clausen wrote:
>>
>> =A0With the 3Com router, I can, from another internal computer,
>> access that server via the external interface (ie, by going
>> http://publicaddress). =A0When I throw in my Linux router, it does n=
ot
>> do that, and user's have to use the internal IP or host name to acce=
ss
>> the device.
>>
>
> What rules have you wrote?
> an
> iptables -t nat -A PREROUTING -s local_addrs/mask -d ip_addrs \
> =A0 =A0 =A0 =A0 -p tcp --dport http -j DNAT --to-destionation interna=
l_web
> and the respective
> iptables -t nat -A POSTROUTING -d internal_web -p tcp --dport http -j=
 SNAT
> --to-source gw_ip
>
> must to the trick.
>
> So the request stay inside the lan and there is no "loops"

How do write this if the WAN IP is supplied via DHCP?


--
Aaron Clausen
mightymartianca@gmail.com
