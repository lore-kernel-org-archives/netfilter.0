From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Tools for creation of iptables
Date: Mon, 14 Mar 2005 12:36:23 -0500
Message-ID: <1110821783.10432.24.camel@jasiiitosh.nexusmgmt.com>
References: <EFORWARD1B-SEFLCBTQ00001395@eforward1.name-services.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <EFORWARD1B-SEFLCBTQ00001395@eforward1.name-services.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: edvin.seferovic@kolp.at
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Mon, 2005-03-14 at 17:40 +0100, Seferovic Edvin wrote:
> Hi list,
> 
> are there some tools for creation of iptables rules that you could refer me
> to. I would appreciate it when you could write an opinion to the tool you
> maybe use.
<snip>
Some of my team have used fwbuilder (http://www.fwbuilder.org) in the
past with great success.  There was recently a post about a new tool,
http://firewalladmin.sf.net - I subsequently read some impressive
reviews.  I believe this product is very granular and is specifically a
rule configurator.

I am the maintainer of the ISCS project (http://iscs.sourceforge.net)
which is the complete opposite -- it is designed for very large and
complex environments where it can be overwhelming to configure
everything in a granular manner. Instead, it creates dual hierarchies
with inheritance (users and resources) and creates relationships between
them.  It also automates the coordination of the access control rules
with user authentication, VPN, routing, NAT and, hopefully soon,
QoS/CoS.  It is thus a very different approach -- in fact we joke that
the unlearning curve is greater than the learning curve.

It's sort of a replacement for very expensive tools like SolSoft,
Provider1, and SmartPipes but much more efficient.  It is designed to be
able to administer more than just Linux systems (e.g., Cisco, Juniper).
My work situation has made it a bit difficult to advance the project for
the last few months so all volunteers are gladly welcomed.

Good luck in your search - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


