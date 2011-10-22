From: Azerty Ytreza <007liamg007@gmail.com>
Subject: Re: Problem with log which are corrupted and need help with hitcount
 and FORWARD rules
Date: Sat, 22 Oct 2011 17:11:32 +0200
Message-ID: <CACMGiwaJ69TsOb6gVH_GXLk09yKhxqLExa_s-NXhG8d9M2z7hQ@mail.gmail.com>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
	<1319289600.26402.6260.camel@andybev-desktop>
	<CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
	<1319293517.26402.6312.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=g4UPar7cxGHBGqN/1ESdw/yfXD2zEUXDBTr4v/g8vsY=;
        b=ej5iG2tDDDY0wJSU4A0i4NyjgHhRKdO/j7G+2OkgvspZ3k1kzWWw1OcRN9OoZECWkA
         jLY0M5697LZaRB6WclyyIHiOVaX9jx9y42D27X+1WV2Z50dy/+FKkkLIlVIkrjS6IHGC
         aDchXXf6r5CuaFgmVh84OWSfEF7z3JORRwjx4=
In-Reply-To: <1319293517.26402.6312.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Just mean gateway/firewall server that all the traffic passes through.

No doesn't work ... The port is blocked when I try these rules (copy
of the INPUT rules) :

iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
NEW -m recent --set
iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
NEW -m recent --update --seconds 600 --hitcount 1 -j DROP
iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
NEW,ESTABLISHED -j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp --dport 443 -j
DNAT --to-destination 192.168.1.2:443

If I try that, the port is always open and hitcount doesn't work :

iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
NEW -m recent --set
iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
NEW -m recent --update --seconds 600 --hitcount 1 -j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp --dport 443 -j
DNAT --to-destination 192.168.1.2:443

Thank you for the picture ! It's very interesting :)

And sorry but I have never user mailing list. I don't known how it's
work exactly :(
I put in copy this time :)


Thank you for your help !

On 10/22/11, Andrew Beverley <andy@andybev.com> wrote:
> On Sat, 2011-10-22 at 16:14 +0200, Azerty Ytreza wrote:
>> "What exactly are you trying to achieve? If you're changing to a FORWARD
>> rule then I assume that you are trying to adapt your rules in order to
>> block connections destined for a remote server, rather than the local
>> host?"
>>
>> I want to limit the number of connections which passtrough the host.
>
> Okay, in which case you do want FORWARD.
>
>> Yes, I can block that on the remote server but I prefer on the local
>> if it's possible.
>
> Do you really mean "local" (in which case you want OUTPUT) or do you
> just mean on your gateway/firewall server that all the traffic passes
> through?
>
>>
>> "Do you really mean UDP?"
>>
>> No, it's an error sorry. I have copy/paste other rules and adapt rules
>> but forget to change udp to tcp.
>
> Okay, so it's working now?
>
>> "You've got a mixture of INPUT and FORWARD. Is that what you want?
>> Remember that packets will never transverse both the INPUT and FORWARD
>> chains."
>>
>> The port 443 is blocked by default it's for that which I open and
>> after redirect. If I made only a FORWARD it's open directly the port
>> without INPUT rules ?
>
> It depends where you're blocking it. What's the default FORWARD rule?
> ACCEPT?
>
> The bottom line is that you need all your rules in FORWARD *or* INPUT. A
> picture paints a thousand words:
>
> http://jengelh.medozas.de/images/nf-packet-flow.png
>
> Or for a simpler (out of date) version:
>
> http://www.docum.org/docum.org/kptd/
>
>>
>>
>> Thank you for your response !
>
> No problem, but please put your responses in-line to the original email
> rather than copying and pasting to the top! Oh, and copy the list as
> well.
>
> Andy
>
>
>
