From: cc <cc@belfordhk.com>
Subject: iptables tutorial on DNAT
Date: Thu, 31 Jul 2003 16:54:53 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F28D95D.60804@belfordhk.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1059641888-140-286"
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
To: Netfilter Group <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format...

------------=_1059641888-140-286
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I was reading the DNAT part of the IPTABLES tutorial
and have encountered quite confusing.

In section 6.5.2, near the end it writes:

iptables -t nat -A OUTPUT --dst $INET_IP -p tcp --dport 80 \
    -j DNAT --to-destination $HTTP_IP

Is this a mistake?  I used the above line (with
some modifications to suit my setup) and I get an
invalid agrument.

Also, I noticed that the DNAT rules doesn't
include the -i eth? argument.  Is it necessary?

Any clarifications appreciated.

Edmund


** All information contained in this email is strictly     **
** confidential and may be used by the intended receipient **
** only.                                                   **


------------=_1059641888-140-286--

