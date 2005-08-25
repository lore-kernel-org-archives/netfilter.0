From: Arne Kepp <netfilter@smallworld.no>
Subject: PPTP conntrack, combination that works?
Date: Thu, 25 Aug 2005 13:16:30 +0200
Message-ID: <430DA88E.7070005@smallworld.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have tried using patch-o-matic-ng-20050824 to patch my vanilla kernel 
to support masquerading PPTP.

When I tried to install the modules I got an error that there was an 
undefined reference to __ip_conntrack_expect_find

I found a post that said I needed nf_conntrack_netlink, which I also 
tried to add (either it didn't patch cleanly, or it made no difference, 
can't remember).

Next I found a post saying I need cnetlink, so I tried patching that 
too, but I get an error that there were 3 (2.6.11.11) or 4 (2.6.12.5) 
rejected chunks of code.

I have tried with kernels 2.6.11.11 , 2.6.11.12  and 2.6.12.5. I have 
also tried deleting the source tree, applying only cnetlink and so 
forth, to no avail. IPTables has been 1.3.2 all along. I also tried 
patch-o-matic-ng-20050821.

So my question really is:
Does anyone know what I am doing wrong, or know a combination of patches 
/ kernel-version that works? Preferably 2.6.11 or newer.

Thanks,
-Arne



