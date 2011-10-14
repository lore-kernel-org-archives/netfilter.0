From: J Webster <jw.jwebster@gmail.com>
Subject: Re: masquerade error
Date: Fri, 14 Oct 2011 10:57:40 +0100
Message-ID: <4E980794.7040906@googlemail.com>
References: <4E93E9B8.3010005@gmail.com> <4E94480C.4050604@googlemail.com>  <4E95D9E2.4010002@gmail.com>  <4E97E602.3000809@gmail.com>  <1318582536.3179.5.camel@ns014530.dcyb.net> <1318583118.3179.6.camel@ns014530.dcyb.net> <4E980738.5040202@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=8IGc4N5F6oPNBl7EYhld+UFuCRDOAgbphWeNr3i8ut0=;
        b=kYZke/fGUnLOdgNPXDSy3d66UW5EaI9b4sCI4a1k1IGBBjsUjJl1ffKK2m3Gm13Oi8
         kcPp82PBFBrv5rTbE6w2EvKeTWpveoLS9jwnMRprYiEkrwEnN/hvc3Vq+ohHj+hxzbol
         I5FMb/dZ9MkcF7ytBsF+0o5JKMvt0+U4/eeCY=
In-Reply-To: <4E980738.5040202@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>, netfilter@vger.kernel.org

The problem is that the connection comes from a VPN client so I do not 
usually know the external IP.
All I know is that they connect on the tun/vpn networks of 10.8.0.0/24 
and 172.16.0.0/24.
In the mangle section do I put:
*mangle
:PREROUTING ACCEPT [19588:10233482]
:INPUT ACCEPT [19588:10233482]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [18858:10334564]
-A POSTROUTING -s 10.8.0.0/255.255.255.0 -o venet0 -j SNAT --to-source 
xxx.xxx.xxx.xxx
-A POSTROUTING -s 172.16.0.0/255.255.255.0 -o venet0 -j SNAT --to-source 
xxx.xxx.xxx.xxx
:POSTROUTING ACCEPT [18858:10334564]
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [18851:10333352]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j 
ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 20 -m state --state NEW -j 
ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 21 -m state --state NEW -j 
ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 53 -m state --state NEW -j 
ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 53 -m state --state NEW -j 
ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 123 -m state --state NEW -j 
ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 8002 -m state --state NEW 
-j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 9001 -m state --state NEW 
-j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 80 -m state --state NEW -j 
ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 8080 -m state --state 
NEW,RELATED,ESTABLISHED -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 1935 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 1194 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 1194 -j ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT
*nat
:PREROUTING ACCEPT [1234:59200]
:POSTROUTING ACCEPT [338:21268]
:OUTPUT ACCEPT [338:21268]
COMMIT
 >
 >
 >
 > ow can I use SNAT and DNAT to route the traffic to my OpenVPN?
 >>> -j SNAT --to-source <internet_ip>
 >> To reply to self.. a better description here would be <external_ip>.
 >>
 >>> -j DNAT --to-destination <internal_ip>
 >>>
 >>> Please check the SNAT and DNAT targets with 'man iptables' for the
 >>> details.
 >>>
 >>>
 >>> --
 >>> Rob

