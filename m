From: "hare ram" <hareram@sol.net.in>
Subject: layer7-filter with iptables problem
Date: Mon, 2 Feb 2004 12:35:01 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04e501c3e95a$e0674aa0$c2bf09ca@huecal>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: lartc@mailman.ds9a.nl
Cc: netfilter@lists.samba.org

Hi

iam running FEDORA,

i have installed Source of iptable 1.2.9 with the patch  layer7-iptables
patch done with out any errors

and i applied patch in kernel to the layer 7 patch

and i have select the required option by doing

 make menyconfig
done

make dep
make bzImage
make modules
make modules_install
make install

and rebooted with customer kernel

when i type

iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j
MARK --set-mark 1
iptables v1.2.9: Couldn't load match
`layer7':/usr/local/lib/iptables/libipt_layer7.so: cannot open shared object
file: No such file or directory


when i try to do manual compile, iam getting this error

cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.22-1.2115.nptl/include -Iinclude/
 -DIPTABLES_VERSION=\"1.2.9\"  -fPIC -o extensions/libipt_layer7_sh.o -c
extensions/libipt_layer7.c


extensions/libipt_layer7.c:21:45: linux/netfilter_ipv4/ipt_layer7.h: No such
file or directory
extensions/libipt_layer7.c:52: warning: `struct ipt_layer7_info' declared
inside parameter list
extensions/libipt_layer7.c:52: warning: its scope is only this definition or
declaration, which is probably not what you want
extensions/libipt_layer7.c: In function `parse_protocol_file':
extensions/libipt_layer7.c:84: error: `MAX_PROTOCOL_LEN' undeclared (first
use in this function)
extensions/libipt_layer7.c:84: error: (Each undeclared identifier is
reported only once
extensions/libipt_layer7.c:84: error: for each function it appears in.)
extensions/libipt_layer7.c:87: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:87: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:87: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:93: error: `MAX_PATTERN_LEN' undeclared (first
use in this function)
extensions/libipt_layer7.c:95: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:95: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:95: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c: At top level:
extensions/libipt_layer7.c:219: warning: `struct ipt_layer7_info' declared
inside parameter list
extensions/libipt_layer7.c: In function `parse_layer7_protocol':
extensions/libipt_layer7.c:246: warning: passing arg 3 of
`parse_protocol_file' from incompatible pointer type
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:264: error: `MAX_PATTERN_LEN' undeclared (first
use in this function)
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:264: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c: In function `parse':
extensions/libipt_layer7.c:278: warning: passing arg 2 of
`parse_layer7_protocol' from incompatible pointer type
extensions/libipt_layer7.c:280: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c: In function `print':
extensions/libipt_layer7.c:325: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:326: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c: In function `save':
extensions/libipt_layer7.c:334: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c:334: error: dereferencing pointer to incomplete
type
extensions/libipt_layer7.c: At top level:
extensions/libipt_layer7.c:340: error: invalid application of `sizeof' to an
incomplete type
extensions/libipt_layer7.c:341: error: invalid application of `sizeof' to an
incomplete type


any help will be apprciate

hare


