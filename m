From: Jason Cosby <sky_jason@yahoo.com>
Subject: MAC Hash
Date: Fri, 26 Sep 2008 07:21:13 -0700 (PDT)
Message-ID: <993551.35879.qm@web37301.mail.mud.yahoo.com>
Reply-To: sky_jason@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

As far as I can figure out, the following:

iptables -N mymap macipmap
for ip in 192.168.1.`seq 6 75`; do
  for mac in xx:xx:xx:xx:xx....75 MACs; do 
    iptables -A mymap $ip:$mac
    iptables -T mymap $ip -j ACCEPT
  done
done

should yield the same result and be faster than: 

for mac in xx:xx:xx:xx:xx....75 MACs; do
  iptables -t mangle -A PREROUTING -i eth1 -m mac --mac-source \
${mac} -j ACCEPT
done
iptables -t mangle -A PREROUTING -i eth1 DROP
iptables -t mangle -A PREROUTING -i eth1 -m iprange ! --src-range \
192.168.1.1-192.168.1.74 -j DROP

but I am not sure of this. The drawback of using the hash is that the MACs must match the IPs in dhcpd.conf, but this can be dealt with. Is there no -m flag before macipmap? Can someone with experience weigh in on this, both concerning speed and correctness? ipset doesn't seem to be what I need here. 

Thanks,
Jason
