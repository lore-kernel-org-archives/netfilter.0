From: Martin Braun <yellowgoldmine@gmail.com>
Subject: Whitelist with domains that pulls stuff from other domains
Date: Mon, 21 Apr 2014 06:53:56 +0200
Message-ID: <CAFNm86RxdZW7d6PJAV5W+dTOwpK+-yzqqoWGRNFb3nEK2k6+zg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=YZ6jRG2l8+mxcljutKIqDgIY2J7MOlZ2sOSUnv7GNrY=;
        b=RTSEDNKL3wI7uuVxFgD2IOOvph11aZKd2+jDf2ufBLPSSzJShTaPAfSROjpuNzOC9C
         jF7HyhBY74dIH0yMCxKrOtFqCU91n/ghEjSmmxKNrolAXwnHK93XrzPheLfqVsByEPfJ
         waZ8q/cmbeG+18lh0jaZyIi6FqIsGOKrHvE3v10el2aAViEvbgqXlvCjz9a1jGuPjVhX
         AbjaUJg41OGnQYpRsh0cX37GuPWcrJnowu4wAO+IZ7KrB3zGZ7NGuhQ3NhgDPHrbtvAu
         K/Yrf+fA1uQiywSpR7NGmHzduMEWiJTyGyavZd3bjcJOS9tyH7/pRi3nTZG18LgQixW/
         i5vQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

I wanted to make a white list using the settings below.

<SNIP>
iptables -N wanout
iptables -I FORWARD -i `nvram get lan_ifname` -j wanout

iptables -I wanout -m mac --mac-source 01:26:f7:46:71:4b -j ACCEPT
iptables -I wanout -m mac --mac-source d2:37:b5:f2:39:f3 -j ACCEPT

iptables -I wanout -d gamepedia.com -j ACCEPT
iptables -I wanout -d toysrus.com -j ACCEPT

iptables -A wanout -j REJECT --reject-with icmp-proto-unreachable
</SNIP>

So the boxes with the MACs specified are exempt from blocking. The
domains "gamepedia.com" and "toysrus.com" are accesible to all.

But the problem is that those domains pulls stuff in from other
domains using <iframe> or something, which makes the IPTable block the
loading of the website to complete.

How do I deal with that in the best way? I don't want to look up
everything they pull in and white list that as well. Also it might
change.

Isn't there a way to say "accept all from this domain, even unrelated stuff"?

Kind regards.
