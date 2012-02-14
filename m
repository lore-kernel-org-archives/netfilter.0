From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Tue, 14 Feb 2012 11:18:20 -0600 (CST)
Message-ID: <13536083.3168.1329239900076.JavaMail.root@ixer.mx>
References: <20120211091326.GB6946@tosh.sltosis.org>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120211091326.GB6946@tosh.sltosis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: SamLT <sam@sltosis.org>
Cc: netfilter@vger.kernel.org, Andrew Beverley <andy@andybev.com>

>On Fri, Feb 10, 2012 at 08:05:47PM +0000, Andrew Beverley wrote:
>> On Fri, 2012-02-10 at 12:36 -0600, Enrique Huerta de la Fuente wrote:
>> > iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
>> >
>> > but it does not work.
>>
>> Are you *sure* it's not working?
>
>Sorry to jump in here, but, I agree with Enrique, could you show some
>tcpdump output or something?
>- Do the paquet go out from ppp0 without being MASQUERAD'ed?
>- Do they go out from an other interface?
- Does it look like they are being filtered? or REDIRECT'ed?
>>
>>
>> >
> > Any ideas?
>>
>> Upgrade maybe? As said previously, it's always worked for me.
>>
>> Andy


Hello Sam, this is my outputs:



