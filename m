From: Jean-Rene Cormier <jean-rene.cormier@cipanb.ca>
Subject: Weird problem
Date: Tue, 14 Oct 2003 08:00:18 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066129218.13064.13.camel@forbidden.cipanb.ca>
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
To: netfilter@lists.netfilter.org

I just setup a new netfilter firewall and I'm having a weird problem
with it. After it was setup I plugged the network cables in it then
tried to access a random ftp site on the internet, it didn't work. So I
tried pinging the interfaces on the firewall, I could ping them all.
Then I tried pinging the router to the net but nothing, then I sshed
into another computer that's on the same subnet as the router and it
worked, so I try pinging the router again and it worked. So I tested a
few things on the net and everything seemed to work fine, from MY
workstation. So I tried on another computer and I still couldn't ping
the router, pinged the other computer that's on the same subnet as the
router and it worked, then I could ping the router and had access to the
net. Anybody has an idea why I have to connect to another computer
before I can reach the router?

Jean-Rene Cormier



