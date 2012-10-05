From: morlix <morlix@morlix.de>
Subject: Error while trying to compile libnetfilter_cttimeout 1.0.0
Date: Fri, 05 Oct 2012 15:08:27 +0200
Message-ID: <506EDBCB.6030703@morlix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

i want to compile libnetfilter_cttimeout 1.0.0 in my IPFire (Firewall
distribution) development environment.

But a i got the following error after entering make:

make[1]: Entering directory `/usr/src/libnetfilter_cttimeout-1.0.0'
make  all-recursive
make[2]: Entering directory `/usr/src/libnetfilter_cttimeout-1.0.0'
Making all in src
make[3]: Entering directory `/usr/src/libnetfilter_cttimeout-1.0.0/src'
  CC     libnetfilter_cttimeout.lo
libnetfilter_cttimeout.c:107: error: 'IPPROTO_DCCP' undeclared here (not
in a function)
libnetfilter_cttimeout.c:107: error: array index in initializer not of
integer type
libnetfilter_cttimeout.c:107: error: (near initialization for
'timeout_protocol')
libnetfilter_cttimeout.c:112: error: 'IPPROTO_UDPLITE' undeclared here
(not in a function)
libnetfilter_cttimeout.c:112: error: array index in initializer not of
integer type
libnetfilter_cttimeout.c:112: error: (near initialization for
'timeout_protocol')
libnetfilter_cttimeout.c: In function 'timeout_nlmsg_parse_attr_cb':
libnetfilter_cttimeout.c:541: warning: passing argument 1 of
'mnl_attr_get_type' from incompatible pointer type
libnetfilter_cttimeout.c: In function 'parse_timeout_attr_policy_cb':
libnetfilter_cttimeout.c:586: warning: passing argument 1 of
'mnl_attr_get_type' from incompatible pointer type
libnetfilter_cttimeout.c: In function 'timeout_parse_attr_data':
libnetfilter_cttimeout.c:619: warning: passing argument 1 of
'mnl_attr_get_u32' from incompatible pointer type
libnetfilter_cttimeout.c: In function 'nfct_timeout_nlmsg_parse_payload':
libnetfilter_cttimeout.c:642: warning: passing argument 1 of
'mnl_attr_get_str' from incompatible pointer type
libnetfilter_cttimeout.c:646: warning: passing argument 1 of
'mnl_attr_get_u16' from incompatible pointer type
libnetfilter_cttimeout.c:650: warning: passing argument 1 of
'mnl_attr_get_u8' from incompatible pointer type
make[3]: *** [libnetfilter_cttimeout.lo] Error 1
make[3]: Leaving directory `/usr/src/libnetfilter_cttimeout-1.0.0/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/usr/src/libnetfilter_cttimeout-1.0.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/src/libnetfilter_cttimeout-1.0.0'
make: *** [/usr/src/log/libnetfilter_cttimeout-1.0.0] Error 2

Does anybody have a hint for me on how to fix this?

Kind regards,

morlix
