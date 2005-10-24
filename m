From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: make: *** [extensions/libipt_connbytes_sh.o] Error 1
Date: Mon, 24 Oct 2005 14:47:50 +0200
Message-ID: <BAY103-F16EE8F918BF3462BE3E7D0B2770@phx.gbl>
References: <BAY103-F2707B5391B27AB7499E107B2770@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F2707B5391B27AB7499E107B2770@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have just downloaded  iptables-1.3.3-20051023 and all is fine.
My apologies for the spam.

PS: When will be released iptables 1.3.4?

Marco Berizzi wrote:

>I have removed extensions/.connbytes-test and this is make's output:
>
>cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
>-DIPTABLES_VERSION=\"1.3.3\"  -fPIC -o extensions/libipt_string_sh.o -c
>extensions/libipt_string.c
>extensions/libipt_string.c: In function `parse_string':
>extensions/libipt_string.c:50: error: `BM_MAX_NLEN' undeclared (first use 
>in this function)
>extensions/libipt_string.c:50: error: (Each undeclared identifier is 
>reported only once
>extensions/libipt_string.c:50: error: for each function it appears in.)
>extensions/libipt_string.c:50: error: structure has no member named 
>`string'
>extensions/libipt_string.c: In function `parse_hex_string':
>extensions/libipt_string.c:95: error: structure has no member named 
>`string'
>extensions/libipt_string.c:117: error: structure has no member named 
>`string'
>extensions/libipt_string.c:123: error: structure has no member named 
>`string'
>extensions/libipt_string.c:126: error: `BM_MAX_NLEN' undeclared (first use 
>in this function)
>extensions/libipt_string.c:130: error: structure has no member named `len'
>extensions/libipt_string.c: In function `parse':
>extensions/libipt_string.c:154: error: structure has no member named `len'
>extensions/libipt_string.c:154: error: structure has no member named 
>`string'
>extensions/libipt_string.c: In function `print':
>extensions/libipt_string.c:240: error: structure has no member named 
>`string'
>extensions/libipt_string.c:240: error: structure has no member named `len'
>extensions/libipt_string.c:242: error: structure has no member named 
>`string'
>extensions/libipt_string.c:242: error: structure has no member named `len'
>extensions/libipt_string.c:245: error: structure has no member named 
>`string'
>extensions/libipt_string.c:245: error: structure has no member named `len'
>extensions/libipt_string.c: In function `save':
>extensions/libipt_string.c:257: error: structure has no member named 
>`string'
>extensions/libipt_string.c:257: error: structure has no member named `len'
>extensions/libipt_string.c:259: error: structure has no member named 
>`string'
>extensions/libipt_string.c:259: error: structure has no member named `len'
>extensions/libipt_string.c:262: error: structure has no member named 
>`string'
>extensions/libipt_string.c:262: error: structure has no member named `len'
>make: *** [extensions/libipt_string_sh.o] Error 1
>
>so I have deleted also extensions/.string-test and make is happy.
>
>Marco Berizzi wrote:
>
>>Compiling iptables 1.3.3 on Slackware 10.2
>>with kernel 2.6.14rc5 I got this error:
>>
>>Making dependencies: please wait...
>>Extensions found: IPv4:CLUSTERIP IPv4:connbytes IPv4:nth IPv4:recent 
>>IPv4:string IPv6:REJECT IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header 
>>IPv6:nth IPv6:hbh IPv6:dst IPv6:rt
>>cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
>>-DIPTABLES_VERSION=\"1.3.3\"  -fPIC -o extensions/libipt_ah_sh.o -c 
>>extensions/libipt_ah.c
>>ld -shared  -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
>>
>>[...]
>>
>>cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
>>-DIPTABLES_VERSION=\"1.3.3\"  -fPIC -o extensions/libipt_ULOG_sh.o -c 
>>extensions/libipt_ULOG.c
>>ld -shared  -o extensions/libipt_ULOG.so extensions/libipt_ULOG_sh.o
>>cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
>>-DIPTABLES_VERSION=\"1.3.3\"  -fPIC -o extensions/libipt_CLUSTERIP_sh.o -c 
>>extensions/libipt_CLUSTERIP.c
>>ld -shared  -o extensions/libipt_CLUSTERIP.so 
>>extensions/libipt_CLUSTERIP_sh.o
>>cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
>>-DIPTABLES_VERSION=\"1.3.3\"  -fPIC -o extensions/libipt_connbytes_sh.o -c 
>>extensions/libipt_connbytes.c
>>In file included from extensions/libipt_connbytes.c:9:
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:19: error: 
>>syntax error before "aligned_u64"
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:19: warning: 
>>no semicolon at end of struct or union
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:19: warning: 
>>no semicolon at end of struct or union
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:20: warning: 
>>type defaults to `int' in declaration of `to'
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:20: warning: 
>>data definition has no type or storage class
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:21: warning: 
>>type defaults to `int' in declaration of `count'
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:21: warning: 
>>data definition has no type or storage class
>>/usr/src/linux/include/linux/netfilter_ipv4/ipt_connbytes.h:24: error: 
>>syntax error before '}' token
>>extensions/libipt_connbytes.c: In function `parse_range':
>>extensions/libipt_connbytes.c:35: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:38: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:41: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:43: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:43: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:45: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:45: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c: In function `parse':
>>extensions/libipt_connbytes.c:66: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:67: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:67: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:68: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:74: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:76: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:78: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:87: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:87: error: `IPT_CONNBYTES_WHAT_PKTS' 
>>undeclared (first use in this function)
>>extensions/libipt_connbytes.c:87: error: (Each undeclared identifier is 
>>reported only once
>>extensions/libipt_connbytes.c:87: error: for each function it appears in.)
>>extensions/libipt_connbytes.c:89: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:89: error: `IPT_CONNBYTES_WHAT_BYTES' 
>>undeclared (first use in this function)
>>extensions/libipt_connbytes.c:91: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:91: error: `IPT_CONNBYTES_WHAT_AVGPKT' 
>>undeclared (first use in this function)
>>extensions/libipt_connbytes.c: In function `print_mode':
>>extensions/libipt_connbytes.c:113: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:114: error: `IPT_CONNBYTES_WHAT_PKTS' 
>>undeclared (first use in this function)
>>extensions/libipt_connbytes.c:117: error: `IPT_CONNBYTES_WHAT_BYTES' 
>>undeclared (first use in this function)
>>extensions/libipt_connbytes.c:120: error: `IPT_CONNBYTES_WHAT_AVGPKT' 
>>undeclared (first use in this function)
>>extensions/libipt_connbytes.c: In function `print_direction':
>>extensions/libipt_connbytes.c:131: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c: In function `print':
>>extensions/libipt_connbytes.c:155: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:155: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:156: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:157: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:159: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:160: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c: In function `save':
>>extensions/libipt_connbytes.c:174: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:174: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:175: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:176: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:178: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c:179: error: dereferencing pointer to 
>>incomplete type
>>extensions/libipt_connbytes.c: At top level:
>>extensions/libipt_connbytes.c:192: error: invalid application of `sizeof' 
>>to an incomplete type
>>extensions/libipt_connbytes.c:193: error: invalid application of `sizeof' 
>>to an incomplete type
>>make: *** [extensions/libipt_connbytes_sh.o] Error 1
>>
>>
>>
>
>
>



