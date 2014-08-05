From: Matteo Croce <technoboy85@gmail.com>
Subject: nftables dnat not working
Date: Tue, 5 Aug 2014 10:14:27 +0200
Message-ID: <CAFnufp1PoD3=rg2xTykR7ejw2mA3ceZuTwaZv6fKNCXuyKmO2Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=7KTib6kxX5M1D40VUyOmPrN2TeEe38t3cNxAf1sP3YA=;
        b=MaNTtHkNA74pcv7NjSuX5SPvvUUSV/EtChYcuemSbBUBdz2vPEiPv+RRVB8gUOqvEN
         CgOAdPCQ/0RJUItq132T/bCSq8AehdAvBD+C1h2X2IOD8L5Dx1vuixelZc7lXB3IFzGf
         KfObJic2qOFvHMRD2sTLxcGOmSGOcDbHCJN9IiRI+iH0NSjW8zJT66RwaTU7VbKx0pks
         BXEQl1WMeMn33MrfmzTZHO11gE1PUwZOCeK7AwajTow3vfzFu6gYXaqbopkjCM4Ia0Nq
         pEwGcFCzSBDAw/CA+htnKbbgoUeaBKqmqKGm9cIsm1GHo0oPUad+jBlKlDlkTHLw63ov
         r9dg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi,

I'm using nftables on a vanilla 3.16 kernel and nft 0.3.
I want to do port forwarding for TCP port 51413 to host 192.168.0.20 and
I've configured my firewall like this:


table ip nat {
        chain post {
                 type nat hook postrouting priority 0;
                 ip saddr 192.168.0.0/24 oif eth0 snat 192.168.1.2
        }

        chain pre {
                 type nat hook prerouting priority 0;
                 iif eth0 tcp dport 51413 dnat 192.168.0.20
        }
}


no filter chain at all.
from the router I can find the port open:

HPING 192.168.0.20 (br0 192.168.0.20): S set, 40 headers + 0 data bytes
len=44 ip=192.168.0.20 ttl=64 DF id=0 sport=51413 flags=SA seq=0
len=44 ip=192.168.0.20 ttl=64 DF id=0 sport=51413 flags=SA seq=1

from the outside is closed:

HPING 188.218.168.147 (eth0 188.218.168.147): S set, 40 headers + 0 data bytes
len=46 ip=188.218.168.147 ttl=51 DF id=39456 sport=51413 flags=RA seq=0
len=46 ip=188.218.168.147 ttl=51 DF id=39467 sport=51413 flags=RA seq=1

if I sniff in the LAN nothing gets forwarded

Cheers,
-- 
Matteo Croce
OpenWrt Developer
