From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Ebtables ruleset isn't working, any ideas?
Date: Tue, 19 May 2009 08:32:53 -0700 (PDT)
Message-ID: <740443.89728.qm@web44813.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242747173; bh=XwFs4NJp+ULbKEn/cVwKdoBpH3LKxXjml0TIFvwkxik=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=N/EpJ0Zo3vrF2f0tyOtHKYVbKVy2dj67ZgX5LLMVqpE7gvfntONVSnLpu7oXQadso0QBAUVOsuWN1nISXp70fddU96Jr6YHDx//nDmerQpfonkbJyszCFavnSNycwvPo/R9qGzW3QXlqZqK67Tmd7b2usydxV2O8dqKvakGG/BI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: openssl-users@openssl.org, netfilter@vger.kernel.org, pageexec@freemail.hu, bdschuym@pandora.be, nick@fedchik.org.ua, grzes@gnu.univ.gda.pl


I'm trying to make a bridge firewall that allows ssh in, and allows http/https out, but nothing else... ebtable ruleset isn't working Sad

This is what I have so far. When I set the default policy to allow everything gets through, when deny nothing gets through:

Here is the net setup: squid/sshserver --> eth1 [firewall] eth0 ---> Internet

What is supposed to be allowed:
ssh server (port 22 TCP) <--eth1 [firewall] eth0 <--- Internet
ssh/squidserver --> eth1 [firewall] eth0 --> Internet (ports 80 and 443 TCP)

What is supposed to be disallowed
(spoofed ip w/o proper squidserver mac address going out)
(anything else coming in)
(probably anything else going out aswell (maybe allow dns, dhcp) 



This blocks EVERYTHING. It COMPLETELY IGNORES THE RULESET  :( :( (The only thing it doesn't ignore is the policy)

[code]
ebtables -F FORWARD
ebtables -P FORWARD DROP
ebtables -A FORWARD -p ip --ip-proto icmp -j DROP ## block all ICMP

ebtables -A FORWARD -i eth0 -o eth1 -p ip --ip-proto tcp --ip-destination-port 22 --ip-destination 192.168.0.21 -j ACCEPT
ebtables -A FORWARD -i eth1 -o eth0 -p ip --ip-proto tcp --ip-source-port 22 --ip-source 192.168.0.21 -j ACCEPT

ebtables -A FORWARD -p ip --ip-src 192.168.0.21 -s ! 00:08:0D:54:13:C9 -j DROP
ebtables -A FORWARD -i eth0 -o eth1 -p ip --ip-destination 192.168.0.21 --ip-proto tcp --ip-source-port 80 -j ACCEPT
ebtables -A FORWARD -i eth1 -o eth0 -p ip --ip-source 192.168.0.21 --ip-proto tcp --ip-destination-port 80 -j ACCEPT
ebtables -A FORWARD -i eth0 -o eth1 -p ip --ip-destination 192.168.0.21 --ip-proto tcp --ip-source-port 443 -j ACCEPT
ebtables -A FORWARD -i eth1 -o eth0 -p ip --ip-source 192.168.0.21 --ip-proto tcp --ip-destination-port 443 -j ACCEPT
[/code]



Why doesn't this work? Isn't it supposed to consider the exception rules?
(I'm testing by trying to SSH to the box, and trying to go to the IP of a webserver across the bridge from the box)




      

