From: "Don Hughes" <support@sannotes.org>
Subject: Mark match an Tarpit failure
Date: Fri, 06 Aug 2004 10:10:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411358FF.28304.998D63@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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

The following work for me:

iptables -A INPUT -m mark --mark 13 -j DROP
iptables -A INPUT -p tcp -j TARPIT

but the following does not and returns "Invalid 
Argument":

iptables -A INPUT -m mark --mark 13 -j TARPIT

what am I missing?

..don

support@microtechniques.com
White Plains, NY



