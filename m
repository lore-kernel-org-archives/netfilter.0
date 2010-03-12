From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: iptables NATed or not NATed
Date: Fri, 12 Mar 2010 14:49:14 +0530
Message-ID: <cfeab66d1003120119v77a51eeavb7dc286f5966cd39@mail.gmail.com>
References: <4B989616.7000904@perfaction.net>
	 <4B9954FE.5030904@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=sxnqUqb+rN1n8i8BEK2DZTGBpPEywhSGEG+LK+Rcag0=;
        b=ShdV+EXepQ7W/T6VaQ3gy4xy+yi37bDLhvzWlV1Tlj6da3uGCknrGgbfxtyO172CZC
         KC4460bC6DJSSwb5hdcCMFGdgsezeqM52iSAlSl2X++LRUghHzRg/rGxrGNlWSQfx76k
         QC8BI/Yhr9cicEHsd9VPMRgArEIetxoc6l8UY=
In-Reply-To: <4B9954FE.5030904@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Check the state of those packets. Usually, packets which skip NAT are
> those classified in the INVALID state by the connection tracking.

A new packet ( not -syn packet ) would be treated as  INVALID ? . We
can see this packet in NAT table ?

Thanks,
Ratheesh



On Fri, Mar 12, 2010 at 2:09 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Patrick Chemla a =E9crit :
>>
>> It works, but with tcpdump I have recorded packets on outgoing
>> interfaces where addresses are NOT NATed, means, packets issued from
>> internal servers on eth0, are routed to default route eth2 with ther=
e
>> internal address 10.0.0.xx.
>>
>> It is very strange because it is a small percentage of packets, not =
all
>> the packets from a specific server, directed to the same port than
>> others who are routed and NATed the right way, at the same time.
>
> Check the state of those packets. Usually, packets which skip NAT are
> those classified in the INVALID state by the connection tracking.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
