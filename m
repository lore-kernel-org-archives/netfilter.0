From: "sean darcy" <seandarcy@hotmail.com>
Subject: What modules do I need for MASQUERADE?
Date: Thu, 26 Jun 2003 19:04:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law8-F8HXsprw0m25q80007880a@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to run a simple nat on a redhat rawhide kernel:

/sbin/iptables -t nat     -F
/sbin/iptables -t nat     -A POSTROUTING -o  eth0              -j MASQUERADE

What modules do I need to insmod?

Is /sbin/modprobe iptable_nat  all I need?

thanks
sean

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*.  
http://join.msn.com/?page=features/virus


