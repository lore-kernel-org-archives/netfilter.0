From: Art Emius <art@emius.ru>
Subject: ipset issues
Date: Wed, 25 May 2016 23:42:45 +0300
Message-ID: <CANY1rLhdjTYRu51fsDZaMZ04gzkkN5MLa1-MNJHwqx=v-2c3ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to;
        bh=gce3I0ViZhWkSlsHRiucOS9Bbnq/1fpxtb5xaosOobI=;
        b=Myz1HZ1xG67Jsx8TmZ8h0OFhqtJ0lVfxtj1J1k1h+YH/c4rBplSM+MSXJ9XiAR967+
         yGCtxBsIbQU3kDYRKi1Oa58s9Vl2jJ32Urj7PzGgMucXizSXqHbVvauYGfawZdX9KxNm
         9kxKc1IHafbKJnoJH+CaFOTJfp3LgQWbhtKk+AMshSwmWynjWZBTrrPahiFHz/xjs0fL
         6aGCzKVEQ+bSlIh8CRyoSuBIyg6cEjT9pUVrv6VllyF+3AyjoASznehvlTZVFFAtZmMp
         T5nEspicqRcozYO5arMF3FvTNVRr7tWSmyWN5cu9ym9PAHjQ/ZVdZeUlbSpiBxbXKTtc
         b1Eg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello guys,

Recently I've encountered an issue with using ipset in my firewall.

I use Debian Linux 8.4, running in virtual machine inside ESXi 5.5.
My host is 192.168.1.2, remote host is 192.168.1.1.
I'm running ssh server on my host and want to limit access to it using
one rule with two sets of different types like this:

iptables -t filter -A INPUT -m set --match-set NETS_IFACE src,src -m
set --match-set SSH src,dst,dst -j ACCEPT
iptables -p OUTPUT ACCEPT

ipset create SSH hash:ip,port,ip hashsize 8 maxelem 8 family inet
ipset add SSH 192.168.1.1,tcp:22,192.168.1.2

ipset create NETS_IFACE hash:net,iface hashsize 128 maxelem 128 family inet
ipset add NETS_IFACE 192.168.1.0/24,eth1

It doesn't work this way. eth1 really exists and handle traffic.
But If I use rule like this it works fine.
iptables -t filter -A INPUT -i eth1 -m set --match-set SSH src,dst,dst -j ACCEPT

What am I doing wrong?

Regards,
Art
