From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables tutorial on DNAT
Date: Thu, 31 Jul 2003 19:44:58 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDCECMNFAA.georgev@citadelcomputer.com.au>
References: <3F28D95D.60804@belfordhk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F28D95D.60804@belfordhk.com>
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
To: cc <cc@belfordhk.com>, Netfilter Group <netfilter@lists.netfilter.org>

This is correct for when you have an internal website running on 192.168.0.1
and your application on the firewall wants to browse it, the DNS will
resolve to the external IP address and your firewall won't be able to
connect to it because the IP doesn't exist.. do you have to DNAT it's OUTPUT
connection to it..

The reason for the error is most likely because the old (and possible still
current) version of iptables had a NAT OUTPUT bug which fails when trying to
NAT the OUTPUT chain..

there's a p-o-m called "local-nat" or something which is the fix for this.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of cc
Sent: Thursday, July 31, 2003 6:55 PM
To: Netfilter Group
Subject: iptables tutorial on DNAT


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



