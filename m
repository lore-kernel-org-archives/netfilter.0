From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Compiling libnetfilter_queue-1.0.2
Date: Fri, 26 Oct 2012 13:21:54 +0200
Message-ID: <508A7252.80202@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@vger.kernel.org>

Hi,

I'm having trouble compiling libnetfilter_queue-1.0.2.
The system is a CentOS-6 x64_64 with all updates, gcc 4.4.6 (distro), 
glibc-2.12, with vanilla 3.6.3 kernel (distro is 2.6.32).


Libnfnetlink, libmnl and libnetfilter_* compiled fine.


I'm doing:

$ PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure

(Doesn't complain about anything, libnfnetlink and libmnl are found.)

$ make
make  all-recursive
make[1]: Entering directory 
`/usr/local/src/netfilter/libnetfilter_queue-1.0.2'
Making all in src
make[2]: Entering directory 
`/usr/local/src/netfilter/libnetfilter_queue-1.0.2/src'
   CC     libnetfilter_queue.lo
   CC     nlmsg.lo
   CC     extra/checksum.lo
   CC     extra/ipv6.lo
   CC     extra/tcp.lo
   CC     extra/ipv4.lo
extra/ipv4.c: In function 'nfq_ip_snprintf':
extra/ipv4.c:141: error: 'tos' undeclared (first use in this function)
extra/ipv4.c:141: error: (Each undeclared identifier is reported only once
extra/ipv4.c:141: error: for each function it appears in.)
make[2]: *** [extra/ipv4.lo] Error 1
make[2]: Leaving directory 
`/usr/local/src/netfilter/libnetfilter_queue-1.0.2/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory 
`/usr/local/src/netfilter/libnetfilter_queue-1.0.2'
make: *** [all] Error 2


Any help would be appreciated.
If I omitted any data that I shouldn't have, please let me know and I'll 
provide it.


--
Rob
