From: Matt Killock <lists@killock.net>
Subject: Re: Iptables Reject with TCP Reset
Date: Tue, 10 Jan 2017 19:29:40 +0000
Message-ID: <97e9b02ea87a5c04a31f5be7ab26f2ff@killock.net>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
 <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <19ab6efe-7891-3950-e468-11dd59e71246@familie-kuntze.de>
 <HK2PR0201MB212932A38853DB306E300014E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <4f4fa7f2-0f5f-ac04-4bc2-f10c455da613@familie-kuntze.de>
 <HK2PR0201MB212958238BE1225DA9B7FC09E8640@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <b7cce260df01445c8c387889d3b30114@CCDEX021.corp.corpcommon.com>
 <HK2PR0201MB21294E23EB7B6CFD0DE8D406E8670@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <20170110133221.560d3b6d@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=killock.net; s=mail;
        t=1484076580; bh=ODNDSXNOrdBeHyqsPpiAHjSS3nhDObvs4YbsXSkgyQk=;
        h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
        b=gOBdWnTCIi0WCNROc+Dyob+2rYy0bfbQlvPYe+v5xS2bKp73DILw83AoAYXwdiKsl
         T/93RZtKIjaUoFU+kV0WEU3U0s1yrOTcONE+rkUa7lbH0tdhC5rKchjPRde2nlcjTl
         0bYCd/RtAcp4jkNr3oo+6dstSXTy48ej4WNMO1eU=
In-Reply-To: <20170110133221.560d3b6d@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

> This doesn't make much sense. A RELATED packet is the first packet of
> a new conn that a helper has determined is related to an existing conn
> (e.g., the data conn of an FTP control session). Once a RELATED packet
> is replied to, the resulting conn is an ordinary, vanilla ESTABLISHED
> conn; specifically, the RELATED 'tag' is discarded. When a packet
> matches a "REJECT with TCP-Reset" rule, netfilter immediately sends a
> TCP RESET to the end that sent the packet.

Sounds nice in theory, but reality bites back. RELATED also applies to 
the TCP Reset packets to SYN packets.

I just tried this at home to confirm my findings.

Please review the below firewall script. It does not send the TCP RST 
packets unless you make one minor change: To add 'RELATED,' to the line 
underneath '#General State Matching'

Please note that it has the single state matching lines as recommended 
by various others on this list.





> It almost sounds like you built a nearly stateless firewall.

It's more or less like the below but duplicates ESTABLISHED everywhere

------------------------------

A='/sbin/iptables'
EXIF='ppp0'
LANIF='eth1'

#Clear
$A -F
$A -F INPUT
$A -F OUTPUT
$A -F FORWARD
$A -F -t mangle
$A -F -t nat
$A -X

#Setup policies
$A -P INPUT DROP
$A -P OUTPUT DROP
$A -P FORWARD DROP

echo "1" > /proc/sys/net/ipv4/ip_forward

# Some basics
# Accept loopback interface
$A -A INPUT -i lo -j ACCEPT
A='/sbin/iptables'
EXIF='ppp0'
LANIF='eth1'

#Clear
$A -F
$A -F INPUT
$A -F OUTPUT
$A -F FORWARD
$A -F -t mangle
$A -F -t nat
$A -X

#Setup policies
$A -P INPUT DROP
$A -P OUTPUT DROP
$A -P FORWARD DROP

echo "1" > /proc/sys/net/ipv4/ip_forward

# Some basics
# Accept loopback interface
$A -A INPUT -i lo -j ACCEPT
$A -A OUTPUT -o lo -j ACCEPT

# SSH from LAN
$A -A INPUT -i $LANIF -p tcp --dport 22 -j ACCEPT

#general NAT
$A -t nat -A POSTROUTING -o $EXIF -j MASQUERADE

#General State Matching
$A -A OUTPUT -m state --state ESTABLISHED -j ACCEPT
$A -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

#Allowed HTTP/HTTPS Sites
#bbc
$A -A FORWARD -i $LANIF -o $EXIF -d 212.58.244.22 -p tcp -m multiport 
--dports '80,443' -j ACCEPT

#Send RST to LAN for all other 80/443 connections
$A -A FORWARD -i $LANIF -p tcp -m multiport --dports '80,443' -j REJECT 
--reject-with tcp-reset


--------------------



Matt



