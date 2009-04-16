From: no doubt <hell.no.doubt@gmail.com>
Subject: Re: need help on *nat filter for multiple source IP
Date: Thu, 16 Apr 2009 16:38:47 +0800
Message-ID: <5a7ba2310904160138i57b8867ct9c4a2130e6ffebe1@mail.gmail.com>
References: <5a7ba2310904122005k6606f6falba0b74b118f42090@mail.gmail.com>
	 <49E2C80C.1030406@chello.at>
	 <5a7ba2310904151200m29b7c633g5f5326f00bc825b1@mail.gmail.com>
	 <49E64AC5.4050400@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Y1BGdiZNOl9YIhS4ZFMtB1tOmRiTEfV9o61DyzER/xk=;
        b=QIhbdEwcRx1I/Rw1Xgpcnyk4M+dM9eMufTECxoStn+V/525EI5QjSjA2iwfTq4izmz
         5SazRQCLYVBtSa11jfiSTPAytbYxbSwk/Y32R61dekxaqgmzpNtc8oiCQGBtTBFixTaO
         o7osBChcl0i/leghlFuFHuwYaQxV/IXz5gJFs=
In-Reply-To: <49E64AC5.4050400@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello Mart,
Yeah, I just tweak around your config.

Here they are..

iptables -t nat -n MY80FWD
iptables -A PREROUTING -s 192.168.4.20/32 -i eth2 -p tcp -m tcp
--dport 80 -j MY80FWD
iptables -A PREROUTING -s 192.168.4.10/32 -i eth2 -p tcp -m tcp
--dport 80 -j MY80FWD
iptables -A PREROUTING -s 192.168.4.100/32 -i eth2 -p tcp -m tcp
--dport 80 -j MY80FWD
iptables -A MY80FWD -p tcp -j DNAT --to-destination 192.168.3.10:80

iptables -A POSTROUTING -o ppp+ -j MASQUERADE


--khairul
