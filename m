From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: new nat target extension --jump rt_lookup
Date: 26 Jul 2003 14:36:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059223007.1604.11.camel@drs0.manchotnetworks.net>
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
To: netfilter <netfilter@lists.netfilter.org>

hi all,

just wondering what everyone would think about

iptables --append POSTROUTING or OUTPUT --table nat --jump rt_lookup


this would ask for a new route lookup as a packet traverses the nat
table (done once) and would enable the effective marking/routing of
locally generated packets, as well as determining a potentially new
out-interface after natting.

can anyone comment on potential problems/dangers/issues from such a
--jump?

cheers

charles










