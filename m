From: Jochen Vogel <jvogel@it-sec.de>
Subject: AW: GRE/PPTP and modules
Date: Thu, 29 Apr 2004 17:19:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D3DD55FDB74AD511BA5100500416368053E88E@ORION>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Received: **stripped**
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
To: 'Cedric Blancher' <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

> > Do i need any modules?
> 
> Yes. you need GRE and PPTP conntrack modules (PPTP 
> conntracking depends on GRE conntracking) :
> 
> 	ip_conntrack_proto_gre
> 	ip_conntrack_pptp
> 
> If you use NAT, you'll need additional modules as well :
> 
> 	ip_nat_proto_gre
> 	ip_nat_pptp
> 
I use fedora1.0 and cant find this modules.
I think thats in the patchomatic.
What should i do to get the modules?

