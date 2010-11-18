From: Landy Landy <landysaccount@yahoo.com>
Subject: traffic shapping with squid in the middle
Date: Thu, 18 Nov 2010 08:14:50 -0800 (PST)
Message-ID: <423773.22919.qm@web62508.mail.re1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1290096890; bh=a+uwtEXFkuNawJ9yXsP1hyAbAU6ml72gwO3kPQKxZb8=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=DA/RKERp3T3HcjjuDCY1BDvB5HrAngJOqonmXcjBEftKxr77J1eBW0/ebAHzChvAypeHAziAnzvz9MyQ3Q5tA5LdrclRhkIYBpXNvIabmfWUQBnTtoGRyXyGRuQo126HEXajKSV0z0dNqC9ZFgQv05j4OKnNh7MTnN0o/2rYIJQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

This is my first post to the list.

I've been experiencing some problems trying to shape our network bandwidth. We have a gw with squid doing the contents cache and would like to assign each client a fair bw trying to avoid sluggish connections. 

I am able to throttle the speed to our desire: 512/128 if I stop squid and take it out of the picture. But, we need it. Now, when squid is in the middle of things I can only control the download speed with on the mangle -A POSTROUTING chain marking some packet for the user based on ip address and doing:

//download
$iptables -t mangle -A POSTROUTING -d 172.16.100.132 -j MARK --set-mark 1099
$iptables -t mangle -A POSTROUTING -d 172.16.100.132 -j RETURN
$tc class   add dev eth1 parent 2:107    classid 2:1099 htb rate 737kbit ceil 832kbit prio 3
$tc filter  add dev eth1 parent 2:0     protocol ip prio 3 handle 1099 fw classid 2:1099
$tc qdisc   add dev eth1 parent 2:1099  handle 597: sfq perturb 2

// upload
$iptables -t mangle -A PREROUTING -s 172.16.100.132 -j MARK --set-mark 1018
$iptables -t mangle -A PREROUTING -s 172.16.100.132 -j RETURN
$tc class   add dev eth0 parent 1:26    classid 1:1018 htb rate 100kbit ceil 128kbit prio 3
$tc filter  add dev eth0 parent 1:0     protocol ip prio 3 handle 1018 fw classid 1:1018
$tc qdisc   add dev eth0 parent 1:1018  handle 516: sfq perturb 2

Squid's access pools is not an option.

I've been trying to get this working for a while now but, can't get it. Please guide me to where I can find a light at the end of the tunnel since, that's how I feel: Have no way out.

Thanks in advanced for your help.


      
