From: Peteris Krumins <newsgroups@lf.lv>
Subject: iptc_zerro_entries segfaults, why?
Date: Fri, 9 May 2003 07:39:59 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <136662983589.20030509073959@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-Message-Id: <200305090434.h494YWVk027540@mail.lf.lv>
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
To: netfilter@lists.netfilter.org

Hi,

 i am developing some tool which uses libtc to manage rules etc.
 unfortunately iptc_zerro_entries (neither iptc_flush_entries and
 others which require (const IPT_CHAINLABEL chain, TC_HANDLE_T
 *handle) as parameters) does not want to work: as soon as
 called - segfaults.

 code (simpified, might have a typo) is like this:

--/
 const char *table = "filter";
 ...
 iptc_handle_t h;
 int ret=0;
 const char *c = NULL;
 h = iptc_init(table);

 if (!h){
    .. err handler
 }
 for (c=iptc_first_chain(&h);
      c;
      c=iptc_next_chain(&h)) {

      printf("in filter found: '%s'\n",c);
      /* prints "in filter found: 'INPUT'" */
      printf("zeroing..\n");
      ret = iptc_zerro_entries(c,&h);
      /* segfaults right here [1] */
      ...
 }
--/

[1] i see the prototype of iptc_zerro_entries:
    TC_ZERO_ENTRIES(const IPT_CHAINLABEL chain, TC_HANDLE_T *handle);
    IPT_CHAINLABEL is 'typedef char ipt_chainlabel[32]'

    exactly the same thing is done in iptables, only iptables have
    zero_entries function.

 so what could be wrong?

 compile w/:
gcc -W -Wall -I<ipt include dir> -rdynamic \
-o <executable> <src> \
<path to>/iptables.o <path to/libiptc>/libiptc.a \
-ldl -lnsl


P.Krumins


