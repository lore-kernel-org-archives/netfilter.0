From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Connectivity
Date: 03 Dec 2002 08:30:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038897009.345.7.camel@bigblue>
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

I am running iptables 1.2.6a. The firewall/gateway server links a DMZ,
Internal, External zones. The DMZ card is aliased with two different
ip's (196.10.1.x and 196.10.10.x).
I have a router on the DMZ that reboots every evening at a specific
time, the router is not under our control.(196.10.10.y)
When this happens iptables does not allow traffic through even though
the router comes up immediately.
I basically have to take the card down, reconfigure it with another ip
(196.10.10.b) then it sees the router, take the card down again and
reconfigure it to the original ip (196.10.10.x) and re-apply the rules. 
Then everything works fine again.

One way of fixing this is to get the router fixed, but this is not under
my control. Could anyone tell me how I could fix the iptables side of
things, surely iptables should be able to handle when and router
reboots...???

Any suggestions please...





