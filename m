From: "Shazad Malik" <smalik@vistawiz.com>
Subject: My findings on H323 ..... feedback welcome
Date: Fri, 7 Jun 2002 19:01:46 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1608.24.168.132.35.1023490906.squirrel@mail.vistawiz.com>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

everyone,

I have working my ass on trying to get this thing working....... and this
is what I have conculded.

Scenario 1:
kernel: 2.4.18, iptables: 1.2.6a:

H323 will not work.  I installed a new kernel and a good .config file and
selected the patches but the nat, h323 does not work. NO MATTER WHAT YOU DO
IT WILL NOT WORK!

Scenario 2:
kernel: 2.4.18, iptables: iptables--20020605 (latest snapshot) I felt there
is no harm!

Well, I had huge success with it!  When I added the patched and checked
my .config file, all the entries were present as I expected. I thought I
was done till I had to to a "make  KERNEL=/usr/src/linux"

This is the error message I'm getting:

========================================
Extensions found: IPv4:connmark IPv4:CONNMARK IPv4:ipv4options
IPv4:IPV4OPTSSTRIP IPv4:mport IPv4:nth IPv4:quota IPv4:random IPv4:time
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -
DIPTABLES_VERSION=\"1.2.7\"  -fPIC -o extensions/libipt_conntrack_sh.o -c
extensions/libipt_conntrack.c
ld -shared -o extensions/libipt_conntrack.so
extensions/libipt_conntrack_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -
DIPTABLES_VERSION=\"1.2.7\"  -fPIC -o extensions/libipt_mark_sh.o -c
extensions/libipt_mark.c
extensions/libipt_mark.c: In function `parse':
extensions/libipt_mark.c:67: structure has no member named `bit_op'
extensions/libipt_mark.c:67: `IPT_MARK_BIT_OP_NONE' undeclared (first use
in this function)
extensions/libipt_mark.c:67: (Each undeclared identifier is reported only
once
extensions/libipt_mark.c:67: for each function it appears in.)
extensions/libipt_mark.c:77: structure has no member named `bit_op'
extensions/libipt_mark.c:77: `IPT_MARK_BIT_OP_OR' undeclared (first use in
this function)
extensions/libipt_mark.c:86: structure has no member named `bit_op'
extensions/libipt_mark.c:86: `IPT_MARK_BIT_OP_AND' undeclared (first use in
this function)
extensions/libipt_mark.c: In function `print':
extensions/libipt_mark.c:113: structure has no member named `bit_op'
extensions/libipt_mark.c:113: `IPT_MARK_BIT_OP_AND' undeclared (first use
in this function)
extensions/libipt_mark.c:116: structure has no member named `bit_op'
extensions/libipt_mark.c:116: `IPT_MARK_BIT_OP_OR' undeclared (first use in
this function)
extensions/libipt_mark.c: In function `save':
extensions/libipt_mark.c:131: structure has no member named `bit_op'
extensions/libipt_mark.c:133: `IPT_MARK_BIT_OP_AND' undeclared (first use
in this function)
extensions/libipt_mark.c:135: break statement not within loop or switch
extensions/libipt_mark.c:136: `IPT_MARK_BIT_OP_OR' undeclared (first use in
this function)
extensions/libipt_mark.c:138: break statement not within loop or switch
extensions/libipt_mark.c:139: `IPT_MARK_BIT_OP_NONE' undeclared (first use
in this function)
extensions/libipt_mark.c:141: break statement not within loop or switch
make: *** [extensions/libipt_mark_sh.o] Error 1



-- 
Shazad Malik
work: (845)623-2161
fax: (845) 623-1154



