From: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: modprobe: cannot parse modules.dep error
Date: Tue, 18 Dec 2007 10:32:16 +0100
Message-ID: <200712181032.17947.schane@osmozis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: busybox@busybox.net

Hi all,

I am running into the following problem when invoking a netfilter iptables
( v1.3.8) and xtables support in the buildroot's busybox (v1.7.2) system. The 
netfilter packet configuration and support modules are compiled and built 
into the linux-2.6.16 kernel image.

When a 'C++' application code calls the iptables  through 
sprintf(buff, "%s -t mangle -A PREROUTING %s -j MARK --set-mark 512", 
Config.iptables, Config.link[i]);
it throws the modprobe error.

iptables -t mangle -A PREROUTING -d 88.160.215.156 -p icmp -j MARK --set-mark 
512
modprobe: cannot parse modules.dep
modprobe: cannot parse modules.dep
iptables -t mangle -A PREROUTING -s 88.160.215.156 -p icmp -j MARK --set-mark 
512
modprobe: cannot parse modules.dep
modprobe: cannot parse modules.dep
iptables -t mangle -A PREROUTING -d 88.160.215.156 -p tcp --dport http -j MARK 
--set-mark 512
modprobe: cannot parse modules.dep
modprobe: cannot parse modules.dep

Normally it shouldn't do module probing as all the netfilter support symbols 
are included in the kernel image. Can anybody tell me why the system throws 
the modprobe error though the netfilters supports are built into the kernel 
image.?

Thanks
Sara
Osmozis
