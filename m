From: Dan Malvin <dmalvin@dunwoody.edu>
Subject: routing specific IP addresses
Date: Wed, 25 Feb 2004 11:49:42 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077731382.3585.32.camel@ziggurat8>
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
To: Netfilter <netfilter@lists.netfilter.org>

I'd like to gain some understanding of an existing rule on my firewall
that is allowing only a specific range if IP addresses outside.  This
rule was created by the previous network admin.

The rule is:
-A FORWARD -s 10.1.1.0/255.255.255.192 -i eth2 -j ACCEPT

I understand that the "/255.255.255.192" part of the above rule is
allowing only a specific range of IP addresses out to the Internet.  How
is this rule working and how would I expand the range or create an new
range?

