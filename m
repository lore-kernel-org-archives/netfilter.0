From: Magnus Solvang <magnus@solvang.net>
Subject: Re: Port Forwarding for port 25 (again...)
Date: Tue, 25 Feb 2003 04:33:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030225033329.GA1815@first.knowledge.no>
References: <20030225005407.GA28447@first.knowledge.no> <200302242153.47253.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200302242153.47253.netfilter@newkirk.us>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Quoting Joel Newkirk (netfilter@newkirk.us):
[...]
| > But a telnet to the old, external ip-address of the mailserver
| > just hangs (untill it returns a "No route to host".
| 
| Which sums it up pretty accurately, I suspect.  If the firewall has an 
| external IP x.y.z.49, then it will handle traffic to that IP.  If the MX 
| (or your telnet test) points to x.y.z.34, then the upstream router will 
| be looking for something that responds to _that_ IP.  If it cannot find 
| anything using that IP, then there is no route.

Hm... A logical error, in other words. *must* *get* *sleep* *now*...
Somehow I thought that the firewall would notice the connection attempt
from the router, and would be able to redirect the query from there.

| Presuming that x.y.z 
| are the same in both cases, you may get the results you want with:
| 
| ifconfig eth0:1 add x.y.z.34

I have it working now, thanks to you :)

- M

