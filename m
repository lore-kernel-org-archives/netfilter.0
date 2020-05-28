From: "ad^2" <adsquaired@gmail.com>
Subject: Value too large for defined data type
Date: Thu, 28 May 2020 10:01:13 -0400
Message-ID: <CAPdGaa3Ewu9Ctw2bRMezh5Q=brcYbo3X9PGq7R2SjN6bT8zbuw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ME/PXf7kBJrHq2xrixcFWksclTwSTo6ljxddfsTXMvg=;
        b=FoljDATRQjT8N0mvK64XDJuSg8mNuY5v2Am09kJ6yJcgiMkgloJnQh5byaXgHhwG5X
         Q722EVXuMkIX/038tJtnQyjBdryt8BYy1u3e69iyqfIFRzzLM9C+vNUG87ekX61T0HHa
         yrMo4imLKglpCkvLC043kKjARrUgwwkt6NvKh9pNiNi7W+EhiBvnX42nXihQ6UjfWtMJ
         q6DE3drIJSNZWvHL1aTGzDaVNysn//3taLm4AHi5Ed2cOx3EQHO69ujwNMxi9/WinFgf
         TeBz+byFRGD94hNZj1NIETRTLtU9IJunlsUYr0g8tJtC3FMpiEBfHzdMqp9+hhVVyE3p
         ZJ5A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

DISTRIB_DESCRIPTION="Ubuntu 18.04.4 LTS"
nftables=0.9.4-1

Hello, I'm trying to manipulate a packet based on the domain in the
UDP message header.

./nft.conf:8:1-138: Error: Could not process rule: Value too large for
defined data type
add rule myrule prerouting nftrace set 1 meta l4proto udp udp dport 53
@th,160,200 0x086163636F756E747306676F6F676C6503636F6D00 dnat 8.8.8.8
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Hex = accounts.google.com

Looks like there is a limit on what can be searched.

Using something smaller works fine in nftables.

nft add rule myrule prerouting nftrace set 1 meta l4proto udp udp
dport 53 @th,160,120 0x03777777057961686f6f03636f6d00 dnat 8.8.8.8

Hex = www.yahoo.com

accounts.google.com works using iptables.

-A PREROUTING -s 192.168.254.225/32 -p udp -m string --hex-string
"|086163636F756E747306676F6F676C6503636F6D00|" --algo bm --from 40
--to 65 -m udp --dport 53 -j DNAT --to-destination 1.0.0.1

Thanks in advance.
