From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: Using MARK and TOS to route traffic through different interfaces to the same destination
Date: Thu, 11 Dec 2008 14:15:35 +0100
Message-ID: <145d4e1a0812110515j30341cc0s438505a5e3785f74@mail.gmail.com>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>
	 <1228998831.22977.9.camel@enterprise.ims-firmen.de>
	 <49410A7C.6010501@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=RF+prSfUy8Px/3XFWxPh/e0bnwcHM3+fk3d2IbGzmIA=;
        b=hfqlTMa3jjHm8EPCrq5g+dBhYVc2jhh4xlyLF5Ax5hUscgSVyOG1ACF8REBLK1hRml
         S8k1/M+2U9Tj1vewsvdZlU4Jj+tMByhWy1vOlY/yi59k8RWfls4sVzTFppbJrjZsTyXI
         kjlvRQh/p+VZG8FjPlgras/dKR0j5QCPRkh3g=
In-Reply-To: <49410A7C.6010501@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi,

2008/12/11 Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:
> Hello,
>
> Thomas Jacob a =E9crit :
>>
>> On Thu, 2008-12-11 at 13:18 +0100, Javier G=E1lvez Guerrero wrote:
>>>
>>> I need to route packets through different interfaces (let them be a=
th0
>>> and eth0) depending on the application source port, so I thought us=
ing
>>> TOS or MARK targets of iptables would be helpful.
>>>
>>> Anyway, as I try configure it to mark the traffic and updating the
>>> routing tables through many different ways, I can't get it working =
so
>>> the packets are always sent through the "default" interface in the
>>> main routing table.
>>>
>>> For example, if I use MARK I configure it this way:
>>>
>>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60301 -j MARK --se=
t-mark
>>> 1
>>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60302 -j MARK --se=
t-mark
>>> 2
>
> These rules match the destination port. Replace --dport with --sport =
to
> match the source port.

Sorry, 60301 and 60302 are both destination port. I made a mistake
when explaining it. I need to route packets depending on the
DESTINATION port. The two interfaces (eth0 and ath0) are binded to
different IP addresses both in the same range of the router and the
destination host (192.168.0.0/24).

Then, any idea?

Thank you for your help,
Javi

>
>> AFAIK, locally generated packets are routed before they are sent to
>> netfilter, so setting fwmarks there to influence routing is pointles=
s.
>
> A rerouting happens after the OUTPUT chains in order to take into acc=
ount
> destination NAT and marks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
