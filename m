From: "John Lister" <john.lister@kickstone.com>
Subject: Re: Checking line status
Date: Wed, 2 Sep 2009 14:54:02 +0100
Message-ID: <64CF729F020C4C79887C0B0AE51E0D8E@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com> <1251895652.23708.37.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org


>On Wed, 2009-09-02 at 10:23 +0100, John Lister wrote:
>> Hi, I have a multihomed machine to which i'd like to check the status of
>> each line periodically. I want to do this so that I can modify the 
>> iptables
>> rules and send new connections out over the active lines and restore 
>> service
>> when the line comes back up.
>>
>> I thought I could use ping with the -I option, but that doesn't seem to
>> work, it always uses the default route. However if I get rid of the 
>> default
>> route and modify the rules to match the packets I get a "network
>> unreachable" message without it ever hitting iptables. For example adding
>> something like this never gets matched for the ping.

>You need to ensure that your ping packets come from the right IP and get
>routed to the right interface. Useless comment maybe, but without
>you posting your details here it is difficult to say more specific
>things ;)

>Binding to the right IP is accomplished with ping -I <IP>, just as you
>do. But then you need some sort of route to send this packet to the
>right interface (-I has nothing to do with that). One way to achieve
>this could be using things like scapy where basically roll your own ping
>tool and just force the packet out on the right interface.

>Or you could use policy routing like this:

>/sbin/ip rule add from <Secondary Interface IP> pref 10000 table 100

>/sbin/ip route add default via <Secondary Next HOP IP> table 100


Cheers, that did the trick, didn't realise that was possible.. Just got to 
make sure all my other rules (both firewall and routing) are still working -


John


