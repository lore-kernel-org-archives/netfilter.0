From: <Josh.Berry@compucom.com>
Subject: connlimit patch
Date: Mon, 11 Aug 2003 17:28:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0119A4FB@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I am trying to use the connlimit patch.  I added the patch, compiled and
installed the kernel, compiled and installed iptables v1.2.8, used:
insmod ipt_connlimit to load the module.

When I try to use it with a match:
/usr/sbin/iptables -A FORWARD -p tcp --syn --dport 23 -m connlimit
--connlimit-above 2 -j DROP

I get the error:
Iptables v1.2.8: Couldn't load match
'connlilmit':/usr/local/lib/iptables/libipt_connlimit.so: cannot open
shared object library

Then I noticed that there is nothing in the extensions directory for
connlimit.  Where do I get the shared library?

Josh Berry
Information Security Group
972-856-5402


