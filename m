From: Paulo Andre <pandre@darkstar.nom.za>
Subject: connection problem
Date: 05 Dec 2002 08:55:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039071356.345.134.camel@bigblue>
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

I have a problem where a router reboots every evening. I do not have
control of this router. 
The problem is with iptables, as soons as the router reboots I lose the
connection even when the router has come up afterwards.
I then have to take the interface down, reload the firewall script, then
reconfigure the interface and reapply the firewall script again so that
I can see the router again. 

Can anyone tell me why this happens, the interface is a aliased
interface, if that makes a difference.

Thanks

Paulo




