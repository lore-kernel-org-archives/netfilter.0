From: Azerty Ytreza <007liamg007@gmail.com>
Subject: Re: Problem with log which are corrupted and need help with hitcount
 and FORWARD rules
Date: Sun, 23 Oct 2011 23:04:00 +0200
Message-ID: <CACMGiwb5rPWYWLvK9zUT5As8ZjxhtVLkP8pbgVPqbA4sC4Q66g@mail.gmail.com>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
	<1319289600.26402.6260.camel@andybev-desktop>
	<CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
	<1319293517.26402.6312.camel@andybev-desktop>
	<CACMGiwaJ69TsOb6gVH_GXLk09yKhxqLExa_s-NXhG8d9M2z7hQ@mail.gmail.com>
	<1319297250.26402.6316.camel@andybev-desktop>
	<CACMGiwb3tXniJNt5vn6nBVqZjy8VUYWQkwg0GV=gVta5qzoaQw@mail.gmail.com>
	<1319299307.26402.6352.camel@andybev-desktop>
	<CACMGiwbCxg8a19r-wErFyh-KWDX9tx42GvFo20Pq2zF_Sr9cKg@mail.gmail.com>
	<1319377798.26402.6408.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=qWi37gXsTpY04gcJjfb6ZCzrh0QT+QmzB+JpWI/tKm0=;
        b=R+W8k2/b9Qs5yU8fdm5qdBGajSmeqfoBV9Jwme6foC2zyPdpT6sSsM3/9CAkvV0Po+
         QYkXdihdXPRhVCD1/Ha2kf5xljpZ93lpKo/TaKkytt6OPu/LYQoKyzGYlToQCdmz2POb
         Erf8vWAleebobXO00nlC/u8I635WX9619NrbA=
In-Reply-To: <1319377798.26402.6408.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

>> > Hitcount matches when the number of packets is greater than or *equal*,
>> > so defining a number of "1" will always match.
>>
>> I have try to increase that but it's the same thing.
>> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
>> NEW -m recent --update --seconds 600 --hitcount 10 -j DROP
>>
>> >
>> > Also, hitcount refers to number of packets, so you'll need a rule in
>> > there to only apply the DROP to NEW connections, otherwise you'll block
>> > a successful connection as soon as that number of packets has been sent.
>>
>> Yes, I have modified this rules by removing "NEW" but the port is
>> always blocked :(
>> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
>> RELATED,ESTABLISHED -j ACCEPT
>
> Can you re-post all the rules please so that we can have a look at them?

It's OK ! I have founded my error ...
Thank you for your help !

My big mistake it's with the INPUT rule followed by a FORWARD :(
I doesn't know that FORWARD open the port without INPUT.

Else the error was here : iptables -A FORWARD -i eth1 -p tcp -m tcp
--dport 443 -m state --state **NEW,**RELATED,ESTABLISHED -j ACCEPT


Else you have an idea for my corrupted log ?
It's probably linked to LXC but there is a way for check where come
the problem ?

>> > This website is quite good:
>> >
>> > http://thiemonagel.de/2006/02/preventing-brute-force-attacks-using-iptables-recent-matching/
>> >
>> > Although you'll have to change INPUT to FORWARD.
>> >
>>
>> This website use blacklist and name but it's the same no in my rules ?
>
> "Probably", although I've not looked closely. If you really have written
> equivalent rules then it should work okay. If you can re-post all your
> rules then we can check.
>
> Andy
>
>
>
