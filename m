From: Patrick van der Smagt <smagt@dlr.de>
Subject: How to assign an external IP to a host?
Date: Mon, 11 Nov 2002 15:32:34 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.40.0211111529590.23175-100000@amazonas.robotic.dlr.de>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have a host connected via a PPP-connection to a Linux host.  I want to
give the PPP-host a permanent IP.  I use nat-tables to do so, but it
doesn't work: I can reach my PPP-host from all other machines, except the
one on which I defined the two eth0 interfaces (despite the nat OUTPUT
rule I defined).

Any ideas?


Patrick


