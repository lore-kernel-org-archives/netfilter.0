From: Neil Hodge <neh@attbi.com>
Subject: Tightening up outgoing traffic
Date: 15 Oct 2002 05:47:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034686034.15446.38.camel@localhost.localdomain>
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
To: netfilter@lists.netfilter.org

All:

I am running directly off the firewall box.  I currently have the
following:

iptables -P OUTPUT ACCEPT

When I change to this:

iptables -P OUTPUT DROP
iptables -A OUTPUT -p tcp --destination-port http -j ACCEPT

I keep getting "domainname can not be found.  Please check the name and
try again" from my browser.  This only happens for new web sites (i.e.,
Yahoo works fine).  As this seems somewhat like a DNS issue, I tried
adding this:

iptables -A OUTPUT -p tcp --destination-port nameserver -j ACCEPT

but it didn't work.  Any ideas?  Thanks.

Neil Hodge



