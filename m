From: "Andrew J. Meader" <ameader@corp.lcom.net>
Subject: OUI Filtering
Date: Tue, 31 Aug 2004 16:22:55 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4134EC2F.8030400@corp.lcom.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: ebtables-user@lists.sourceforge.net

Hi Lists,

I'm sending this to both the IPTables and EBTables lists for simplicity.

Does anyone have experience doing MAC address OUI filtering? I am going 
to have a network with mixed broadcast domains - I can not fix this 
because of vendor issues (really, I can't fix this.) There will be one 
place where different ethernets will physically and logically touch, 
they must. I would like to use ebtables to redirect dhcp broadcasts 
based on OUI, one group of devices will have known OUI's. Else, I would 
like to be able to drop dhcp broadcasts based on OUI at the machine that 
doesn't care.

I've done OUI filtering with DHCPd but don't know if it will redirect 
(gut says no.)

Thanks.

Andy


