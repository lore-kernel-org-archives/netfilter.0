From: dean gaudet <dean@arctic.org>
Subject: per-socket nfmark settings? (fwd)
Date: Mon, 7 Oct 2002 09:38:06 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210070937240.4278-100000@twinlark.arctic.org>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

it was suggested that i forward this question here instead of linux-net:

i'd like to modify apache so that it sets some sort of hint on TCP sockets
associated with particular domains/directories, and have the hint used to
do traffic shaping in the kernel.  IPTOS doesn't provide enough resolution
for my needs.

i've been digging around the 2.4 source, and it seems like the struct
sk_buff nfmark field might be something i could use to do this.  but it
doesn't appear that a userland app can control this field on a per-socket
basis.

i was thinking of doing this:

- add default_nfmark field to struct sock
- add SO_NFMARK and setsockopt() support in net/core/sock.c
- add support to tcp_output.c et al to copy the default_nfmark into
  the skbs (probably use default_nfmark == 0 to indiciate no change)

i recognize this isn't exactly a perfect solution... and i'd welcome some
input.

thanks
-dean

p.s. i'm not on netfilter, so please cc me.






