From: "Ivan Petrushev" <ivanatora@gmail.com>
Subject: Re: Mystics of packet forwarding
Date: Wed, 7 Jan 2009 17:52:23 +0200
Message-ID: <d39744a20901070752t45c57f98v51d04236bc81a5e8@mail.gmail.com>
References: <4963B3EB.6090806@arturaz.net> <496475AB.9040303@arturaz.net>
	 <4964C54E.8090607@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=z9E+hOvl7lPYdpF/sSf68ZZ2OfcYJoJBc39pnbTtrp0=;
        b=ZgKR3GRh52r4yCoFi/GmClANp4FnH2kKE+H0XNQ7m2YgTkym4xV8GMzHbyeJePMztC
         m+EFMnWzJHMO6cJo11+bpmjEw0QDQafrw8BB9JuYY4LjpNh7OoVuMNak5HZhitMnGCRk
         /NkIHaMo3pUvf7yZ9Hz7Hco86Q1d8uLVNS37s=
In-Reply-To: <4964C54E.8090607@chello.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: netfilter@vger.kernel.org

tcpdump could be a bit overwhelming with its mass of output information.
Maybe Wireshark?

If the case is virus/worm it could be doing port scans on the target
sites or something that not involve port 80.
Something just came in my mind. Remove all of the "gray" NAT rules and
start adding them one by one, removing the old ones. In every moment
there should be only 1 NAT rule. AND remove all Internet access except
for the "target" sites. That could be done with something like that:
iptables -t nat -A POSTROUTING -s XXX.XXX.XXX.XXX -d DIGG.COM -j SNAT
--to-source YYY.YYY.YYY.YYY
iptables -t nat -A POSTROUTING -s XXX.XXX.XXX.XXX -d YAHOO.COM -j SNAT
--to-source YYY.YYY.YYY.YYY
The YYY is ofcourse your external IP.
In that way that PC with IP XXX should have access only to digg.com
(it would be nice to resolve the host DIGG.COM and YAHOO.COM and use
every of its IPs if it has many)
What is the purpose of that: if at any point of the experiment you
notice potent use of bandwidth - that LAN host you are currently
adding is the one that is making things wrong. And since you have been
disabled all of regular Internet traffic (torrents, downloads, wgets,
www) there should be nothing generating traffic and it will be easier
to distinguish the virus host.

On Wed, Jan 7, 2009 at 5:07 PM, Mart Frauenlob <mart.frauenlob@chello.at> wrote:
> netfilter-owner@vger.kernel.org wrote:
>>
>> Ok, it seems that really - someone in LAN is attacking the internet.
>>
>> If I turn on forwarding for few users like me, some other
>> computer-literate friends - digg.com still works :))
>>
>> Now it's the question how do I catch bad guys? What should I look into?
>> Packet bursts? Lot's of new connections? Etc?
>>
>
> quick ways could be:
> iptraf (you could apply filters for specific traffic)
> iptstate (shows conntrack table)
> tcpdump (i.e. simple rule: tcpdump -n -i your_ext_iface tcp dst port 80)
>
> any of those tools could give you a quick picture of current connections
> (attempts).
>
> greets
>
> mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
