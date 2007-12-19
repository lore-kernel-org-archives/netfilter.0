From: =?ISO-8859-1?Q?S=3F=E9bastien_Cramatte?= 
	<scramatte@zensoluciones.com>
Subject: nf_conntrack vs ip_conntrack ...
Date: Wed, 19 Dec 2007 17:47:32 +0100
Message-ID: <47694B24.7050003@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello

I'm running 2.6.22.12 kernel

I would like to tweak netfilter parameters in sysctl.conf (I'm running
debian Etch)
My server is a traffic manager setuped as a bridge.  We filter P2P
(ipp2p, l7filter)  and SIP/RTP  for an amount 60Mbits

I must tweak conntrack default values to  use most of available memory 
and to  try to avoid overhead ...

How can apply these sysctl.conf  values to the new nf_conntrack style :

net.ipv4.netfilter.ip_conntrack_max = 8388608
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established= 57600
net.ipv4.netfilter.ip_conntrack_udp_timeout = 57600
net.ipv4.netfilter.ip_conntrack_udp_timeout_stream = 57600

By default I've got theses values :

net.netfilter.nf_conntrack_generic_timeout = 50
net.netfilter.nf_conntrack_max = 65536
net.netfilter.nf_conntrack_count = 0
net.netfilter.nf_conntrack_buckets = 8192
net.netfilter.nf_conntrack_checksum = 1
net.netfilter.nf_conntrack_log_invalid = 0

Which value can I put for tcp and udp timeout  ?
I found some example but small wireless router not  60Mbits traffic
shapper  ;)

So I'm not sure what should be the best values
We have something as 2000 customers (I'm working for a cable provider)
that going through this  server,

Many thanks for your help


