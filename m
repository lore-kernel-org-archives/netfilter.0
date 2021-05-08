From: Carsten <abcdmail@freenet.de>
Subject: Forcing SNAT to preserve the original source port
Date: Sat, 8 May 2021 18:24:03 +0200
Message-ID: <9e5f3488-63b5-c745-8ff1-7266b6b56cc3@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
         s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=cUGE11/wUHPevXqId30eyNlWk91Wd/Slo09mzKkW0VY=; b=CVjykkqXScU4e031DmxgWqwwv0
        j+mI13k/mf13EFDW9rqCujqxRKkOHpXKaS9hDpPFt/JDQP/VddWOKITUf0Lxtmnd1PayNTvSLjoCx
        tcLudUph+KNK9ETj7RV6ZQVKvgIhNdl5Jwt2xSD1rvFdVPNwQ8AzP0HSTjdKCjVWv2kZazPQFpTnS
        7uctOCATunNZ1IAhlpeB/xNYUoJ5A/JLgkWX1/BR1ELKELDzJKGiLKElZEqYFumFcbf1XQWf3qbsk
        T5JyiZKmGRHtBWYp0kO4aDyiT087A6nyQW4zSS6+utW7VCs4Nv+hVNCg8Wqxkn87D5FO/mWjBy/au
        CD 
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hello!

I have the need to ensure for a few ports on an outgoing connection from one source LAN IP address to one source WAN IP address, that a few source ports (10000:10031) have to be SNATed 
*unchanged* to WAN source IP / source port.

At first I used

iptables -t nat -I POSTROUTING -p udp -s 192.168.45.10 --sport 10000:10031 -d 219.0.0.0/16 -j SNAT --to-source 13.14.15.16

Unfortunately, the source port changed from e.g. 10000 to 1024. This breaks the functionality of the application. I need it to be the same source port on the WAN as on the LAN side.

One workaround is, to create dedicated entries for each port to enforce the correct handling:

iptables -t nat -I POSTROUTING -p udp -s LAN_IP --sport 10000 -d 219.0.0.0/16 -j SNAT --to-source 13.14.15.16:10000
...
That's working fine.


Another way seems to work, too (at least, I didn't see any other mappings until now):

iptables -t nat -I POSTROUTING -p udp -s LAN_IP --sport 10000:10031 -d 219.0.0.0/16 -j SNAT --to-source 13.14.15.16:10000-10031

Is it by accident or is it quasi guaranteed, because there is only one application, which uses this local IP for outbound connections and this process manages the used local ports itself (so 
there can't be any overlapping).

Or is there a better way to force SNAT to preserve the source port?


Thanks,
Carsten
