From: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Subject: removing modules [was service iptables stop; hangs constantly on
	red hat 8]
Date: 28 Oct 2003 17:31:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067358702.2280.6.camel@drs0.manchotnetworks.net>
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
To: netfilter-users <netfilter@lists.netfilter.org>

hi all,

further investigation reveals that red hat changed its script to start and stop iptables: in 1.2.6a, 
no modules are removed as part of "stop" but in 1.2.8, modules are removed on a stop

will leaving the modules in memory have an impact when new rules are introduced (hence the firewall restarts)?

i wonder what the motivation for removing the modules is/was other than conserving resources ...

thanks for any thoghts

cheers

charles




