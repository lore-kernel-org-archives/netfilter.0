From: Zagato <zagato.gekko@gmail.com>
Subject: Re: NAT for locahost to IP LAN for mail services
Date: Thu, 27 Nov 2008 19:27:27 -0500
Message-ID: <98028b00811271627n45966505pf4fcd3aed4814700@mail.gmail.com>
References: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com>
	 <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>
	 <492F3057.8010007@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=fnUiyaaBFbax6pASDqDFYcTlQbaz/MgG8AK94o6isjo=;
        b=Igg+8EQnn4HLaiTWANqR/KkTtVyPsDu2r174ECvpG111rA2xgPQAxhS3zsRc62C+z1
         urjOIpkyEYfkZSigO+e+9JhAOLW6LgPXho6oA4WFOH/16U6C/qFd47BT20ZJOLOK7d5y
         yfu070EF/dgtKTUb3gELTVL4dNiLiV5xqozog=
In-Reply-To: <492F3057.8010007@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Douh..... :(...
cant't i redirect the packect from 127.0.0.1 to 192.168.0.5 and then
192.168.0.3 ?... so 127.0.0.1 and 192.168.0.5 are in the same host and
0.3 its  another phisical PC.... this it's possible ?

Thanks :D !

Alan Jairo Acosta

On Thu, Nov 27, 2008 at 6:42 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Zagato a =E9crit :
>>
>> Hi.... im trying to forward the conecction to mail services like smt=
p(
>> port 25) from one pc to another, im using:
>>
>> _mail_services=3D25,110,143,995,993
>> _mailserver=3D192.168.0.3
>> iptables -t mangle -A ftolocal -p tcp -m multiport --destination-por=
ts
>> $_mail_services -j MARK --set-mark 1
>> iptables -t nat -A ftolocal -p tcp -m multiport --destination-ports
>> $_mail_services -j DNAT --to-destination 192.168.0.3
>>
>> where ftolocal its a chain name for mangle and nat...
>>
>> the ip addres source it's 192.168.0.5 and i want to send localhost
>> connections to 192.168.0.3...
>> when i use the lines above i can:
>> telnet 192.168.0.5 25
>> and it works... giving me:
>> Trying 192.168.0.5...
>> Connected to beta.gps.com.co (192.168.0.5).
>> Escape character is '^]'.
>> 220 alpha.gps.com.co ESMTP Postfix
>>
>> But when i use:
>> telnet localhost 25 or telnet 127.0.0.1 25 tha must be equal i get..
>> Trying 127.0.0.1...
>> and statys there forever.....
>
> The difference may lie in the source address. When you send a packet =
to a
> local address (127.0.0.0/8, 192.168.0.5) and don't set an explicit so=
urce
> address (with -b in telnet), the linux kernel selects the same local =
address
> for the source address. After matching the DNAT rule, packets are rer=
outed
> to the network interface through which the new destination can be rea=
ched
> instead of the loopback interface. However the kernel routing prohibi=
ts
> sending packets with a loopback address to a non loopback interface, =
i.e.
> outside the host. So packets with source address 192.168.0.5 are sent=
 out,
> but packets with source address 127.0.0.1 are discarded. An additiona=
l SNAT
> rule wouldn't help here because it would take place after the packet =
has
> been discarded.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
