From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Best vpn w/ iptables.
Date: Sat, 21 Dec 2002 08:03:17 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c2a90a$79f7df50$6601a8c0@s3ac>
References: <3E043B2B.70306@istitutocolli.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3E043B2B.70306@istitutocolli.org>
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
To: 'Andrea Rossato' <mailing_list@istitutocolli.org>, netfilter@lists.netfilter.org


> Starting from kernel 2.5.49 IPSec went into the tree: if you need 
> encryption and authentication that could be a solution 
> (probably better 
> than freeswan, since the later was not considered for 
> inclusion into the 
> kernel). I don't need them, so I'm sticking with plain gre 
> tunnels and 
> linux-2.4.20

I'm noticing the the IPSec implimentation uses/is protocol 50 -p 50
Will any version of IPTables recognise this or will I be needing to
update
To the latest version of IPTables. I think I'm leaning towards 2.5.49
kernel
Implimentation givin I can trim it down enough to get something
relitivly stable.


