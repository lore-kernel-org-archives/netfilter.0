From: Khanh Tran <khanh@slc.edu>
Subject: RE: help
Date: Mon, 17 Feb 2003 10:04:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB5EE@EXCHANGE>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laxman Gummadavally <laxman@oxynetworks.com>
Cc: netfilter@lists.netfilter.org

Try:

/sbin/chkconfig --level=2345 ipchains off
/sbin/rmmod ipchains

Hope that helps.

Khanh Tran 
Network Operations 
Sarah Lawrence College 


-----Original Message-----
From: Laxman Gummadavally [mailto:laxman@oxynetworks.com]
Sent: Monday, February 17, 2003 5:11 AM
To: netfilter@lists.netfilter.org
Subject: help


Hi,

How to disable Ipchains in Linux???

I need to enable iptables ...........


Thanks
Laxman


