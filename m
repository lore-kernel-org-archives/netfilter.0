From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Arbitrary Netmasks
Date: Tue, 28 May 2002 20:53:57 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205282053.57432@henrik.marasystems.com>
References: <3CF383A9.7000106@mytomorrow.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CF383A9.7000106@mytomorrow.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Heinz <josef.k@mytomorrow.de>, netfilter@lists.samba.org

On Tuesday 28 May 2002 15:18, Thomas Heinz wrote:

> Netfilter supports arbitrary netmasks for IP addresses which is
> more powerful than just those IP/x (0 <= x <= 32) expressions.
> For example one could use IP/255.0.255.255 (IP/23.13.42.0 would
> also work ;-).

Yes, this is the fastest method when matching filter expressions..

> Are masks that cannot be expressed in the IP/x schmeme (at least
> not in one rule) used in practise? Are they used at all in firewall
> rulesets?

Not in real life networks, but such masks are useful in certain types 
of expressions, for example load balancing based on destination, or 
as wildcard matches for matching "all your routers / servers / 
whatever" assuming you have a well structured addressing scheme in 
your own networks..

Regards
Henrik


