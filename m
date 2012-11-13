From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: Re: VoIP conntrack issue
Date: Tue, 13 Nov 2012 22:42:34 +1100
Message-ID: <CABY2qi86ntiYHDzaSeyEwy8vVSy8z8gc+uc8B8EANvya7m6f8w@mail.gmail.com>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
 <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
 <50A213B1.4050601@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=FqdkbM1jks7lYK9+CZTwHh0tPowBO4vV60fm+gxis3s=;
        b=skXOpBQnShk6LlaJmF/sAfTe+2d7uFGOhTJqMwprJ3ZvNHCh568reNnoMVYk21taZc
         ghQQtfG7CRAMHQCU/TQI8jh74GtOWH+pNEu+oj2l24aKOpZB5mAMzdoLXx2esQ0X/xYU
         fZ5jWA8GG7ZHKLDGQG6bS6ELVB2vrYE1RHQQ8fGVICqf4BtpUIZ3xrfVp0Ax2Z+v5MX4
         c45cAtdgR8colSVozX79DThflvYHgsbsRXd7Hbq2YaIFd9qvhSyrzLg4o0YpyQv8ZgPT
         UlWu8/0ijtxUVe0Ajhry3WUADFFfZPDi3QZ0QIElOtxKI0WMYgskxsT+pJM1LXmI7Az+
         zCvA==
In-Reply-To: <50A213B1.4050601@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

Hi Eliezer,

I think your comment is a bit offensive, yes I understand how NAT
works, and yes I know what STUN does,
but in this case it is the NAT firewall who does some unneeded Port map=
ping!

Setup:
External IP: 114.XX.234.123
Local Network : 192.168.1.0/24 -> Internal VoIP Phone: 192.168.1.38
STUN Server: 216.93.246.14
Asterisk Server: 122.XX.115.203
VoIP-PSTN Provider: 62.52.147.185

And what I do is:
Call a number on my Asterisk Server, who then reroutes the call / the
RTP stream directly to my VoIP Phone.
(I tried directmedia and directrtpsetup, both do not work, because
netfilter/conntrack does a port mapping.)

I though you might be able to read this out of my first email, but to
be honest, it was very hard to read,
that's why I shortened the conntrack -E log and made it a bit more
readable, and attach it here:
-----------------------------------------------------------------------=
----------------------------------------------------------------
# Here is the STUN-Part
[NEW] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:3478 ->
114.XX.234.123:44608
[NEW] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:3478 ->
114.XX.234.123:57890
[UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:3478
-> 114.XX.234.123:44608 [ASSURED]
[UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:3478
-> 114.XX.234.123:57890 [ASSURED]
# STUN ended - Two connections assureds, ports: 44608 and 57890

# Now we try to connect to the VoIP Server source port 44608 and 57890
( this might be some ICE related thing, I cannot explain, why my
client does it, but that's actually not the problem.
[NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |
114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
[NEW] 192.168.1.38:57890 -> 122.XX.115.203:10021 |
122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
# !!!!!!! Look here !!!!!!! That's where it starts! Why do we have a
port mapping here???
[NEW] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
# And from that point on it goes down the drain!
# Se the port mapping to port 1030!!!???!!!! Why?!
[UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
122.XX.115.203:10020 -> 114.XX.234.123:1030
[UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
# The connection is assured, because Asterisk is basically listening
to everything on that port and changes the port it send the data back
# But my VoIP Provider is not that intelligent. :-((( See the following
[NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  | 62.52.147.185:35642
->114.XX.234.123:1030 [UNREPLIED]
[NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
[NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
[NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 | 62.52.147.185:35643
-> 114.XX.234.123:57890 [UNREPLIED]
-----------------------------------------------------------------------=
--------------------------------------------------------------
As you can see, half way through ( Underneath my !!!!!!!! comment)
conntrack/netfilter, linux does a port mapping, and does not use the
internal port 44608, but mapps the port to port 1030, for whatever
reason.
I am pretty sure this port-mapping is unneeded, and it messes up my
VoIP calls, as the providers are thinking my external port is 44608
(that's the port the device uses), but linux maps it to port 1030.
Can anyone technically explain to me why conntrack/netfilter does
this? Why can't netfilter just do a second mapping (first mapping was
the one from the STUN connection, line 3)?

This is not a symmetrical NAT!

And please I do my best to explain this, if you need more info or you
don't understand my explanation, I am willing to give more detailed
info, or explain it in a different way, but don't be offensive,
please.

Thanks.

On Tue, Nov 13, 2012 at 8:32 PM, Eliezer Croitoru <eliezer@ngtech.co.il=
> wrote:
> On 11/13/2012 5:20 AM, J=C3=B6rn Krebs wrote:
>>
>> Not really, as I use the devices behind the firewall, in many
>> networks, so I need one setup that works.
>>
>> But to be honest, I don't like to start this discussion:
>> My question is, why can netfilter not reuse the same port?
>> The host inside the firewall is the same, so why can't linux manage =
a
>> port mapping, which says: If a UDP packet comes from host A to us,
>> port 1234, AND host B, port 1234, map both to internal host Int1?
>> (under the assumption, that Int1 tried to establish the connection
>> with Host A and B first).
>>
>> The point is: There is NO port mapping clash, why is netfilter
>> creating one? and does a port remap? (For UDP ... TCP is different.)
>
> Are you sure you understand NAT stun and how port prediction works??
> Try to talk IP and ports in a diagram that will make sense to the eye
> please.
>
> Regards,
> Eliezer



--=20
Bye Bye, J=C3=B6rn Krebs
--------------------------------------------
64 Queen St., Blackstone 4304
Phone: +61731363381
Mobile: +61431068955
Telefon: +495516345347
