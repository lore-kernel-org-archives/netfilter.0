From: Alessandro Vesely <vesely@tana.it>
Subject: Re: [Help] Allow website using iptables
Date: Mon, 4 May 2020 10:43:15 +0200
Message-ID: <968b51ba-41c2-518f-6019-9912fb408f68@tana.it>
References: <CAByCkvqDvxqzkCvt+J9tJatSk3K-TW2gAENojtnG7PvWKqO0YA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1588581796; bh=QCt4f6jae/C1nTrx6Gwx2cEsuhIsdUgCsyNcYwGSkqs=;
        l=1794; h=To:References:From:Date:In-Reply-To;
        b=BmmwoAB1X7HTIpmvIkVevSu6Yzrm0SnK6TH6k11SeMUSstFXrdPYKUsqQV0vYd5L/
         Z1Jh5E6AVqVzlXjx7sKUbuFhlsCVGWV6Lf87kNqv/RulxlWXvXngxYzrYN5gehh2YF
         M6nzt0iXC2TJhyDoDJmoi6ANf4uwuWM+6gAcvz0wgunb7Bg6R3EA6+jF4SYZD
In-Reply-To: <CAByCkvqDvxqzkCvt+J9tJatSk3K-TW2gAENojtnG7PvWKqO0YA@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?U8ahbiDEkOG7lw==?= <sondd1096@gmail.com>, netfilter@vger.kernel.org

Hi,

On 04/05/2020 08:53, Sơn Đỗ wrote:
> I have a Linux router and using iptables 1.4 to configure the firewall.
> 
> And I want to permit a device to access a certain website with a
> domain name and block other websites. So I have use some cmds in
> iptables below:
> 
> 
> 
> iptables -N allow_chain
> iptables -A FORWARD -j allow_chain
> iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -m string --algo bm --string youtube -j ACCEPT
> iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -j DROP
> 
> 
> In this case, I want computer with MAC address 11:22:33:44:55:66
> connected to my Linux router can only access the youtube.


Quite problematic, as it has to be able to access a name server to get the
target IP, at least.  If you mean youtube.com, access to a number of ancillary
Javascript providers (google.com, gstatic.com, and the like) may also have to
be granted.

For a different approach, censorship is often applied by controlling the DNS
resolver.  See:
https://en.wikipedia.org/wiki/Internet_censorship#Content_suppression_methods


> But the result was not my expectation, after I apply those rules , my
> computer cannot access to youtube and other web also, it drop all internet 
> connection.

I guess that depends on the default policy (iptables -P) you set.  The rules
quoted above only affect packets matching the given mac-source.


> In my understanding, the rule with ACCEPT target was not apply even the
> package match with the condition, and all packages are handled in the rule
> with DROP target.

I don't think that /every/ packet will contain that string.  Typically, a
"Host: youtube.com", header field will only appear in one of the first packets
after the TCP handshake.


HTH

Ale
-- 

























