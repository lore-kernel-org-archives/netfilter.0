From: Zen Kato <zenkato@pis.bekkoame.ne.jp>
Subject: RE: iptables SNAT and sip "REGISTER"
Date: Fri, 12 Sep 2003 21:55:43 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030912215543N.zenkato@pis.bekkoame.ne.jp>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C297@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C297@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: georgev@citadelcomputer.com.au
Cc: arnt@c2i.net, netfilter@lists.netfilter.org

From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables SNAT and sip "REGISTER"
Date: Thu, 11 Sep 2003 11:11:12 +1000

> A common VoIP protocol being used is H323 which NetMeeting also uses. tcpdump ports 389,522,1503,1720,1731,8080,1469 to see if packets are going through any of these ports. If they are then there's a good chance it's H323 and you need the p-o-m patch for H323 to get it working through NAT..

I am using iptables for the 'bouncing(reflection)' function for sip proxy
and sip hardphones. I have not yet used iptables for H323 proxy and 
NetMeeting, GnomeMeeting. After I could succeed to use sip hardphones,
I would like to use the p-o-m patch for sip-h323gw.

--
Zen



