From: Stefan Sabolowitsch <Stefan.Sabolowitsch@felten-group.com>
Subject: need help with nfqueue and bridge
Date: Fri, 15 Mar 2013 10:18:53 +0000
Message-ID: <E7F178B652D7E546A7B0B46511A3A5B9198500B5@SFG21.feltengroup.local>
Reply-To: Stefan.Sabolowitsch@felten-group.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=felten-group.com;
	s=feltengroup_com; l=3598; t=1363342737; x=1363947537;
	q=dns/txt; h=DomainKey-Signature:Received:VBR-Info:Received:From:
	To:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	Accept-Language:Content-Language:Content-Type:Content-ID:
	Content-Transfer-Encoding:MIME-Version:Reply-To; bh=vBwpXALjcAcl
	sDUW5dnp2Dwd+CqO38gTq+OHY74trq8=; b=b5Vq5/IeS3iQcGRQbXCgSbYOS++e
	fgFmDiSf1O033mtSB4z5OyunPf3PzoJJTK5Le8snPTRC63GAea1Ie2uBm89gxqFA
	uK6bbcESG2rXr6jRVS4o0EZWyVc779kW5nejR8HZprmXteAwllnj19Gf+RlAufV9
	1Cg+vi/Uu0fyX8k=
Content-Language: de-DE
Content-ID: <D7A90456BCD2BA4D916EDFFF6C1765DC@felten-group.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "<netfilter@vger.kernel.org>" <netfilter@vger.kernel.org>

Any help here how i can solve this issue ?

thx
Stefan

#-#-#-
Hi all,
i have here Centos 6.4 with 3.8.2-2.el6.elrepo.x86_64 kernel an latest iptables.

I have the following Queue:
iptables -A FORWARD -i br0 -j NFQUEUE --queue-bypass --queue-num 1
iptables -A FORWARD -i br1 -j NFQUEUE --queue-bypass --queue-num 2
iptables -A FORWARD -i br2 -j NFQUEUE --queue-bypass --queue-num 3

Queue 1 and 2 have data but not 3 (br2)
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1     901K  728M NFQUEUE    all  --  br0    *       0.0.0.0/0            0.0.0.0/0            NFQUEUE num 1 bypass
2     117K 9150K NFQUEUE    all  --  br1    *       0.0.0.0/0            0.0.0.0/0            NFQUEUE num 2 bypass
3        0     0 NFQUEUE    all  --  br2    *       0.0.0.0/0            0.0.0.0/0            NFQUEUE num 3 bypass

However br2 gets data, you can see it with tcpdump

[root@ipd2 Wecker-DMZ]# tcpdump -i br2
tcpdump: WARNING: br2: no IPv4 address assigned
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on br2, link-type EN10MB (Ethernet), capture size 65535 bytes
14:48:12.557657 ARP, Reply 192.168.22.13 is-at d4:20:6d:4b:dc:4f (oui Unknown), length 46
14:48:14.872485 ARP, Reply 192.168.22.11 is-at 1c:b0:94:49:81:ad (oui Unknown), length 46
14:48:17.366026 ARP, Request who-has 192.168.21.1 tell 192.168.21.12, length 46
14:48:17.366332 ARP, Reply 192.168.21.1 is-at 00:10:db:d0:90:07 (oui Unknown), length 46
14:48:17.674916 IP 192.168.21.12.55191 > 239.255.255.250.ssdp: UDP, length 133
14:48:20.682336 IP 192.168.21.12.55191 > 239.255.255.250.ssdp: UDP, length 133
14:48:23.777492 IP 192.168.21.12.55191 > 239.255.255.250.ssdp: UDP, length 133
14:48:26.735148 IP 192.168.21.12.55191 > 239.255.255.250.ssdp: UDP, length 133
14:48:27.733482 ARP, Reply 192.168.22.13 is-at d4:20:6d:4b:dc:4f (oui Unknown), length 46
14:48:29.741766 IP 192.168.21.12.55191 > 239.255.255.250.ssdp: UDP, length 133
14:48:29.983638 ARP, Reply 192.168.22.11 is-at 1c:b0:94:49:81:ad (oui Unknown), length 46
14:48:32.752335 IP 192.168.21.12.55191 > 239.255.255.250.ssdp: UDP, length 133
14:48:36.645248 IP 192.168.21.12.netbios-dgm > 192.168.21.255.netbios-dgm: NBT UDP PACKET(138)
14:48:42.909740 ARP, Reply 192.168.22.13 is-at d4:20:6d:4b:dc:4f (oui Unknown), length 46
14:48:45.098749 ARP, Reply 192.168.22.11 is-at 1c:b0:94:49:81:ad (oui Unknown), length 46
14:48:53.830337 IP 192.168.21.16.54218 > fa-in-f108.1e100.net.imaps: Flags [S], seq 4290929463, win 14600, options [mss 1460,sackOK,TS val 56595795 ecr 0,nop,wscale 6], length 0
14:48:54.126394 IP 192.168.22.13.39232 > 173.192.219.140-static.reverse.softlayer.com.https: Flags [P.], seq 2793050904:2793050905, ack 1478286381, win 8120, options [nop,nop,TS val 3886140 ecr 3960200924], length 1
14:48:54.269009 IP 173.192.219.140-static.reverse.softlayer.com.https > 192.168.22.13.39232: Flags [.], ack 1, win 513, options [nop,nop,TS val 3960484207 ecr 3886140], length 0
14:48:55.165501 IP 192.168.22.13.39232 > 173.192.219.140-static.reverse.softlayer.com.https: Flags [P.], seq 1:3, ack 1, win 8120, options [nop,nop,TS val 3886198 ecr 3960484207], length 2
14:48:55.308009 IP 173.192.219.140-static.reverse.softlayer.com.https > 192.168.22.13.39232: Flags [.], ack 3, win 513, options [nop,nop,TS val 3960485246 ecr 3886198], length 0

any idea ?
thanks for any help
Stefan
