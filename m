From: Greg Folkert <greg@donor.com>
Subject: PCI Compliance, gee fun.
Date: Tue, 13 Nov 2012 11:18:55 -0500
Message-ID: <1352823535.12211.20.camel@maxime.gregfolkert.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=donor.com; s=google;
        h=message-id:subject:from:to:date:organization:content-type:x-mailer
         :mime-version:content-transfer-encoding;
        bh=8gDNfNBHETNWe1hgZhwpa4lWWuPMnNigbWqaQPiCao4=;
        b=LtaykujCwp7Al8o0QzDfl4I6luCgAlID64KBGVXFOuBQg3LZBto5RDYU0+m24b7rtU
         mOv8VrWrAdFymIAdwB5/vXIFnSuB6nz18cE/m3CA71khlAv1y0FRT2psX6G1xwZO5Cqu
         bs1I5Lzw8E7nQcJ9hBZBV7cL4x32jZDfV9Spo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hello,

I'm being told by my PCI QSA that IPTables supports DNS Names in kernel.
He is forcing me to use "DNS Names" in my "iptables-restore" formatted
save file. I am using a Fedora (FC2) based Firewall (with some updated
packages to fix things)... its quite Old... (which they also don't like)
using IPTables v1.2.9.

The problem is, IPTables only deals with "IP Addresses" in its structure
and doesn't have "dynamic" IP resolution and only resolves on
"runtime/load". Now if I use "iptables-save" the file format does NOT in
fact use DNS and only dumps the IP Address.

What I need is the actual documentation that seems TERRIBLY hard to find
on this very subject...

He is also claiming that other firewalls solutions (aka Proprietary, aka
Cisco) "dynamically" resolve rules... which I believe is incorrect, as
well.

Please point me at some place I can find "authoritative" documentation
for this situation for me to either "suck it up" or to give him direct
docs for him to include in our Audit.

Thanks. Hopefully I have stated the issue well enough.
-- 
greg folkert - systems administration and support
web:    donor.com
email:  greg@donor.com
phone:  877-751-3300 x416
direct: 616-328-6449 (direct dial and fax)
"If the only prayer you ever say in your entire life is thank you, it
will be enough."
    -- Meister Eckhart

