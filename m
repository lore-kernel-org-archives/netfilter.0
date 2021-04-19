From: Tao Gong <gongtao0607@gmail.com>
Subject: conntrackd inverted NAT address, endianness issue?
Date: Mon, 19 Apr 2021 13:03:47 -0700
Message-ID: <CAOAu+xL2ao_r-FK=XYFR3PORvE-E7zLOx0giRGjbB1E5cpUhrw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=xz2EAzky4Bgx+VDSBTekAepNtf2axAq9gi+scPCmJtA=;
        b=A6I3lYAPKSW9Qtb0GM1Aq8s425MveeOt6rmF6poxGP2DM4Nn8qo0ObGjh2ilAPcZmG
         VwPYUiQKhyIyspStL4kI63LjGtAKeIyVU1IDoGyXWFXbM0xRVu5TkeBj/DTsJFHgQ/l7
         WEnsFCor3Mv5vVKPbh9Hpo5wJ32q6FWax4qdjSxKCfh9sXQMzGhprualNCgzenNlSq0u
         aEKGJl7SQ9tpASGOGhV9kpKfkgQQVvYsbfNT7GD7FnHBI/z7Zuy1WehoTGibqexnYihF
         ZKie7KCvpCGDOKeUyStLdrCqQEH60iI2J4toyRzxD0cTyrfEzUfbLAAOMNVNKS9AbYJI
         YlAQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm using conntrackd for firewall failovers. When I examine the
conntrack table, I found the second firewall (the rule it is syncing
to) has inverted natdst (or reply_dst) addresses:

Firewall1:
```
root@OpenWrt:~# conntrackd -i |grep "66.x.25.6"
udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
src=66.x.25.6 dst=76.y.1.128 sport=443 dport=53093 [ASSURED] [active
since 7128s]
tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
dport=443 src=66.x.25.6 dst=76.y.1.128 sport=443 dport=58033 [ASSURED]
[active since 7129s]
```

Firewall2:
```
root@OpenWrt2:~# conntrackd -e |grep "66.x.25.6"
tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
dport=443 [ASSURED] [active since 7234s]
udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
[ASSURED] [active since 7233s]
root@OpenWrt2:~# conntrackd -c
root@OpenWrt2:~# conntrackd -i |grep "66.x.25.6"
tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
dport=443 src=66.x.25.6 dst=128.1.y.76 sport=443 dport=58033 [ASSURED]
mark=0 [active since 5s]
udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
src=66.x.25.6 dst=128.1.y.76 sport=443 dport=53093 [ASSURED] mark=0
[active since 5s]
```

Note how the second dst (natdst) is inverted. Surely the traffic isn't
going through on a failover.
Is this an endianness bug in encoding/decoding?

Setup: (Yes I'm mixing big and little endians)
Firewall1: OpenWrt on a x86_64 (little endian), kernel 4.14.180
Firewall2: OpenWrt on a MIPS (big endian), kernel 4.14.209
conntrack-tools 1.4.5 for both
