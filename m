From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: dnat question
Date: Mon, 23 Feb 2004 23:18:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077596302.394.3.camel@localhost>
References: <403a6f6e.ec2.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <403a6f6e.ec2.0@arbbs.net>
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
To: black@arbbs.net
Cc: netfilter@lists.netfilter.org

On Mon, 2004-02-23 at 16:23, John Black wrote:
> Since i'm  running separate servers for FTP, Mail, and Web, and using dnat to
> port forward to these machines. Do i need these ports open on the firewall?
<snip>
I am not an expert on the inward workings of iptables but I would assume
that you do.  The NAT targets will change the source and destination
addresses but the packets (at least the first packet in the case of
connection tracking) must traverse the FORWARD chain of the filter
table.  It will pass through that table with the real address so there
must be a rule to allow access to the real address.

If someone tells you otherwise, listen to them :-)
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


