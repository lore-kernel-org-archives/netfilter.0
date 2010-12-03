From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: cross compilation of xtables fails
Date: Fri, 03 Dec 2010 13:54:03 +0000
Message-ID: <4CF8F67B.8010504@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=bziyFiKExfrPWHgDf5k0IH8uUwVUWsclX+iWdn6E2JI=;
        b=iknNvYOc6Xi+vTMOiKOLGY/1P45z8tK+s56M+fTjPgQSzTzkvdsxPfcjQXX6RHXH3w
         rIGwlsxZbLPlIPBUueD3G4IcVEwwbEkIbd+rL77K26jqzUthxngJxxbt1lbPVEfmAHwq
         LmOd9MQ0E5pfrZsxaZ7IZdXGXz8XeKG9fgt1o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have tried to compile xtables (1.30) on a x86_64 machine for i686 
architecture and that was not successful due to, in my opinion, errors 
in the m4-generated gcc statements for compiling/linking when make is 
executed. This is the log I get from make which I think causes the error 
(./configure passes with flying colours - all dependencies - i686 and 
x86_64 alike - are satisfied, I've made sure of that before I began this 
process):

gcc  -shared  -o libxt_CHAOS.so libxt_CHAOS.oo -L/lib -lxtables   ;
gcc  -shared  -o libxt_DELUDE.so libxt_DELUDE.oo -L/lib -lxtables   ;
gcc  -shared  -o libxt_DHCPMAC.so libxt_DHCPMAC.oo -L/lib -lxtables   ;
/usr/bin/ld: skipping incompatible /lib/libxtables.so when searching for 
-lxtables
/usr/bin/ld: i386 architecture of input file `libxt_CHAOS.oo' is 
incompatible with i386:x86-64 output
/usr/bin/ld: final link failed: Invalid operation
collect2: ld returned 1 exit status
make[3]: *** [libxt_CHAOS.so] Error 1
make[3]: *** Waiting for unfinished jobs....
/usr/bin/ld: skipping incompatible /lib/libxtables.so when searching for 
-lxtables
/usr/bin/ld: i386 architecture of input file `libxt_DHCPMAC.oo' is 
incompatible with i386:x86-64 output
/usr/bin/ld: final link failed: Invalid operation
collect2: ld returned 1 exit status
make[3]: *** [libxt_DHCPMAC.so] Error 1
/usr/bin/ld: skipping incompatible /lib/libxtables.so when searching for 
-lxtables
/usr/bin/ld: i386 architecture of input file `libxt_DELUDE.oo' is 
incompatible with i386:x86-64 output
/usr/bin/ld: final link failed: Invalid operation
collect2: ld returned 1 exit status

As evident from the above the linker does not like the format of 
libxt_CHAOS.so, libxt_DELUDE.so and libxt_DHCPMAC.so as they are for 
x86_64 (my build machine architecture).

After examining the above error and investigating further I've noticed 
the following: the C/CPPFLAGS I specified during the ./configure process 
which are very specific (and vital!) to enable cross compilation (-m32, 
-mtune, -march etc) have, seemingly, been ignored for 3 groups of 
files/objects:

1. libxt_CHAOS.so, libxt_DELUDE.so, libxt_DHCPMAC.so, libxt_dhcpmac.so, 
libxt_IPMARK.so, libxt_LOGMARK.so, libxt_RAWDNAT.so, libxt_RAWSNAT.so, 
libxt_STEAL.so, libxt_SYSRQ.so, libxt_TARPIT.so, libxt_condition.so, 
libxt_fuzzy.so, libxt_geoip.so, libxt_iface.so, libxt_ipp2p.so, 
libxt_ipv4options.so, libxt_length2.so, libxt_lscan.so, libxt_psd.so and 
libxt_quota2.so

2. libipset_iphash.so, libipset_ipmap.so, libipset_ipporthash.so, 
libipset_ipportiphash.so, libipset_ipportnethash.so, libipset_iptree.so, 
libipset_iptreemap.so, libipset_macipmap.so, libipset_nethash.so, 
libipset_portmap.so and libipset_setlist.so

3. libxt_pknock.so

Instead of executing gcc with the parameters I specified, for the above 
3 groups these are ignored completely and, instead, only the -L 
parameter is honoured!

That results in producing object files suitable for the machine on which 
xtables is currently compiled (x86_64 in my case) and that is not what I 
have requested initially and is the reason why the above errors occur in 
my opinion and needs to be corrected

Also, I need to mention that compilation (and linking!) of everything 
else is done with the right parameters and passes with flying colours, 
so for me, the problem is with the m4 files generating the gcc 
statements for make to execute - the full set of flags should be passed 
on instead of just '-L'.
