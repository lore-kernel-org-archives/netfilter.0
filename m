From: "Takuya Satoh" <taka0038@yahoo.com>
Subject: Current CVS version doesn't compile
Date: Fri, 24 May 2002 11:39:15 +0900
Sender: netfilter-admin@lists.samba.org
Message-ID: <002201c202cc$32e7ef40$f3c4b5cb@k768>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

iptables-1.2.6a-cvs020520:

cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DNETFILTER_VERSIO
N=\"1.2.7\"  -fPIC -o extensions/libipt_REJECT_sh.o -c
extensions/libipt_REJECT.c
extensions/libipt_REJECT.c: In function `init':
extensions/libipt_REJECT.c:92: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c: In function `parse':
extensions/libipt_REJECT.c:128: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:143: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c: In function `print':
extensions/libipt_REJECT.c:173: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:174: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:174: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:174: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:174: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c: In function `save':
extensions/libipt_REJECT.c:189: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:190: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:190: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:190: structure has no member named
`fake_source_address'
extensions/libipt_REJECT.c:190: structure has no member named
`fake_source_address'
make: *** [extensions/libipt_REJECT_sh.o] Error 1

Taka



