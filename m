From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: Beginner Question on restricting traffic within the same subnet.
Date: Mon, 2 Nov 2009 17:02:15 +0000
Message-ID: <ac5c74140911020902s71f6660cl28e7f3d8a436afa8@mail.gmail.com>
References: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>
	 <4AEF0003.5060404@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=iZPJzYsyaiVC+qsJQo+u58AcwA8xdHKlTszPKGhDZEA=;
        b=HLTba4cfv+N0wf4G/AeotVNp+fI5WIpo6d9hULcDNyUpfS8s+/D1q8AMH+fPKa+j0i
         yzWckCuop4gLLzefoQZanMwj6SP9D+/6P5i800qezsSFiFvURVYiPiltMpC/zicCIQQa
         r6CBBRKmW5megU99O8by8cvLBSSeRux4rSLfw=
In-Reply-To: <4AEF0003.5060404@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

On Mon, Nov 2, 2009 at 3:51 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> paddy joesoap a =E9crit :
>>
>> Normally I think of firewalls as controlling packet flows that pass
>> through it (for example:Internet to Intranet).
>>
>> Can netfilter also control traffic on the same subnet?
>
> Yes, if the traffic passes through it. This can be done by setting up=
 a
> filtering bridge using bridge-nf : the IP packets in bridged ethernet
> frames will be filtered by iptables rules.

I need to do some reading here. So thanks for this. But once I form a
"bridge", I can then apply standard iptables rules, right? Will it
only inspect packets at layer 2 and not layer 3,4 and 7? Again, I
better read about the area before posing such questions.

>
>> Suppose I had the following set up:
>> Internal Machines 1,2 and 3 are on the same subnet governed by the
>> netfilter firewall.
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0---------- Machine1
>> Internet ------ Netfilter Firewall ---------- Machine2
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0---------- Machine3
>
> Does the Firewall bridge Machine1-3 together (and thus have a separat=
e
> ethernet interface for each one) or is there an ethernet switch betwe=
en
> them ? A switch won't pass the traffic between Machine1-3 to the Fire=
wall.

I was thinking of a typical SOHO router (combined switch, routing, nat
and firewall) or a simple standalone linux box that has a switch (even
outdated hub!) connected to it and then the 3 machines on the far side
of the switch.

This is currently just a hypothetical question.

I presumed that given a firewall can examine packets from the internal
network outbound, that it can also examine packets that are never
routed externally.

Maybe, for example, I have a laptop, a server and printer in my
network. Perhaps only the laptop can print and access the server. The
printer cannot communicate with the server.

Now, I know I can install netfilter locally on the server and even TCP
wrapper but I am interested to know from a security in depth point of
view, if a firewall also control access amongst machines/systems on
the same network? (filter by ip addresses on the same subnet. I
presume the firewall machine needs also be a router).



> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
