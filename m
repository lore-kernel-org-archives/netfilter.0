From: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Subject: MTU on masqueraded connections
Date: Tue, 3 Feb 2004 22:27:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040203212738.GA9427@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello Netfilter list,

Can anyone tell me (or point me to a link) how MTU detection works in a
masqueraded environment? I.e. are there different MTU's for inside and
outside networks (meaning the masquerading router would see the inside
traffic as separate from outside traffic), or is the inside MTU copied to
the outside interface - i.e. the whole thing is seen as one sort of "broken
up" connection?

(On a side note (and somewhat related) I read that the MASQUERADE target does
the same as the ancient "defragment all" option in the kernel, but I can't
find information about that).

(Background of my question is that MTU in IPsec tunnels is not correctly
evaluated, and when you have an IPsec tunnel that terminates on a
masquerading router, you get to see 
13:57:30.240329 $router > $outside: icmp: $router unreachable
which is rather odd - and prevents further communication.
See http://bugzilla.kernel.org/show_bug.cgi?id=1148)

(please note that my previous message about this had some nonsensical source
listing, it pointed to ip_output.c to send icmp frag_needed, which has
nothing to do with the above).

Valentijn
-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

