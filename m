From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Forward Chain: is Inbound traffic on eth0 not also Outbound 
	depending on your view?
Date: Sun, 8 Nov 2009 15:21:15 +0100
Message-ID: <33be4bb30911080621w42e006a3n2f228f77699a277e@mail.gmail.com>
References: <ac5c74140911080311g21df128fte32b05d90b233a33@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=cO6ICIFERvG13IQM58dJ+cVHjIQQelLD0pkHVMXIg5U=;
        b=cFNxjY8VZTwLf6qaDc8C0RYcxDNOXGKnRFSLYs6MOw4neGk2UeasHSARgjNh1y5qot
         +hdJa3LQYGGkDb2dFAq7C+Oa9gzpuX81OpZxps4d16ipbS/cbWUjYGCGtwg3OEXvm9iQ
         a3HSpTZ8soW6nozNS9nmK/ZH/hLHEzwo5j6ac=
In-Reply-To: <ac5c74140911080311g21df128fte32b05d90b233a33@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

You seem to be over-thinking in the wrong direction. :)

iptables by itself is not concerned with what you as administrator
consider "outbound" or "inbound" traffic to/from your "network".

-i <interfacename> simply mean: match traffic arriving to this machine
on this interface.
-o <interfacename> simply mean: match traffic that the routing system
says will leave this machine via this interface.

These are from the perspective of the firewall itself. What inbound
and outbound means with respect to your client machines is a different
thing.

Provided that you have no other interfaces the two rules you've
specified actually both match the same traffic: Packets arriving on
eth0 and being routed to the subnet on eth1. However, none of those
rules will match traffic arriving on eth1 (from your clients), heading
for the external network.

/Oskar


2009/11/8 paddy joesoap <paddyjoesoap@gmail.com>:
> Dear Experts
>
> I am curious to know more about what FORWARD chain inbound and
> outbound actually mean.
>
> Example firewall set-up below:
>
> Internet --- Firewall --- PC
>
> Firewall has 2 interfaces: eth0 =3D External and eth1 =3D Internal
>
> From what I can gather from the Netfilter website, all I need to do i=
s
> create are inbound and outbound rules on the FORWARD chain.
>
> To allow inbound Internet access, I specify:
>
> FORWARD -i eth0
>
> To allow outbound PC access, I specify:
>
> FORWARD -o eth1
>
> The question is from whose perspective do you view what is inbound an=
d
> what is outbound?
>
> For example, in the case of the Internet client, traffic flowing
> towards the firewall is indeed Inbound so naturally "FORWARD -i eth0"
> is required. However, isn't it also Outbound on eth1, given that it
> leaves interface eth1 to get to PC?
>
> Similarly, clients on the internal network think of their traffic as
> being outbound only, but when traffic is being "forwarded" from eth1
> to eth0 heading for the Internet, isn't that traffic classed as
> Inbound on eth0?
>
> Do I need to create rules for this scenario also or is Netfilter
> handling these implied situations?
>
> Beginner questions so apologies in advance.
> Paddy.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
