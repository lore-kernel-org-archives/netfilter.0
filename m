From: Matt Killock <lists@killock.net>
Subject: RE: Iptables Reject with TCP Reset
Date: Wed, 11 Jan 2017 10:34:48 +0000
Message-ID: <b2b4cd74a6a03e24947c05646f5e8e76@killock.net>
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
 <97e9b02ea87a5c04a31f5be7ab26f2ff@killock.net>
 <e5943affc23440f3bcb33662ba18a82f@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=killock.net; s=mail;
        t=1484130888; bh=jNphw2xBT/VanMS5GB56IAx7Xp1Ups/B4TliAJupUWQ=;
        h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
        b=ZQy8bgepugKcI2znybo0y+ekYEmnml6ZdKVo+4TWATEAzoLwJo6wBcwiinzQh/sAt
         YQg8weW2+O2QVVkg6dll4y/aMhJRSHUILLm13vcvXjf2QJGsXH+5bAuaAnuk4L8atE
         T6gfGcy6F60yVNoD506aEhFdwuQoNbb9h8QfkG6c=
In-Reply-To: <e5943affc23440f3bcb33662ba18a82f@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Andr=C3=A9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>
Cc: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>, netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

On 2017-01-11 10:21, Andr=C3=A9 Paulsberg-Csibi wrote:
> From what you sent me directly , you also allowed this in the OUTPUT
> chain which makes no sense to me ...
> ... but it maybe that the rules set has somehow been "broken" and it
> is now causing un-intended packet handling .

You might need INPUT, OUTPUT & FORWARD policies all to be 'DROP' for=20
this behaviour.

I reproduced this at home using the below script (now corrected for=20
copy/paste errors)

It's very basic, and should allow you to telnet from an internal host to=20
the allowed HTTP site but refuse all other port 80's

I used tcpdump on the firewall to monitor the LAN interface.

--------------------------------------------------

A=3D'/sbin/iptables'
EXIF=3D'ppp0'
LANIF=3D'eth1'

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


--------------------------


Matt
