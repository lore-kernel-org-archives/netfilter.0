From: Matt Hakim <thepigs@gmail.com>
Subject: fwmark & iptables
Date: Thu, 28 Jan 2010 21:37:44 +1100
Message-ID: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=B8FnGKWrFKUWoi2EbePX20yKEgwph//nq2Ogebh/LI0=;
        b=G2F07qpxrW6+aBzmYIU/iKiVK5osGbCGV44O42o/dlD9P8K3rXph1vaKEG0B4zyPkC
         cYwLRMKrPcgae+ihqDLnGU1HhMYpw19erfwM6XUHIR+pwfV2BUTEUzB+74hY+j6+baag
         OrdjwL6CSgmGlvymMDIxMdwZwJWE//iTrRo5Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I want to mark packets for a particular user (iptables -t mangle -A
OUTPUT -mowner --uid-owner rtorrent -j MARK --set-mark 1), and then
route these packets to a VPN (ip rule add fwmark 1 lookup 200; ip
route add default dev ppp0 table 200). Unfortunately, after I do this
tcpdump shows that the default interfaces source address is being put
out on the ppp0 link which I don't understand, as I would have
expected the ppp0 interface address to be the source address. Anyway
it fails.
Without using MARK and ip routing based on destination works OK though
(from all to 66.102.11.104 lookup 200; ip route add default dev ppp0
table 200).
Any tips? I'll hack around in the source now see what i can find.
Thanks,
Matt
