From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Group on Iptables
Date: Thu, 28 Aug 2003 10:22:06 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308281011050.12704@simba.math.ucla.edu>
References: <E9C5F057A783F94E9868010ACFDB3AA454A2E6@srvpadovaad.cerved.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E9C5F057A783F94E9868010ACFDB3AA454A2E6@srvpadovaad.cerved.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Masiero Giorgio, PD" <gmasiero@cerved.com>
Cc: netfilter@lists.netfilter.org

On Wed, 27 Aug 2003, Masiero Giorgio, PD wrote:
> 	I'm tryng to translate our Checkpoint FW-1 ruleset into Iptables.
> 	The problem is this: Is it possible to use objects like Checkpoint
> 	Groups (that is a set of host and/or networks) into an Iptables
> 	rule.

One possibility is to use a netmask, e.g. -d 192.168.10.0/24 for that
subnet of 256 addresses.  Similarly for -s.  If the targeted nets or hosts
do not fall in a neat subnet, and if the set has to be referred to from
several places, you could make a special chain and jump to it.  If no rule
in the chain eats the packet (-j DROP, -j ACCEPT, etc.), control will
return to where the chain was called.

It would be really nice to have an analog of -m multiport, for hosts or
networks.  But I don't see one in
http://www.netfilter.org/documentation/pomlist/pom-extra.html

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

