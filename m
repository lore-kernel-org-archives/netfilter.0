From: "azeem ahmad" <azeem81@msn.com>
Subject: MAC SOURCE
Date: Mon, 11 Jul 2005 19:58:15 +0500
Message-ID: <BAY5-F14B5C5AE15C81A1871A8ABADC0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi list
here is a script that i want to use to block unauthorized MACs on my 
network. but the problem is that  its not blocking all other MACs that r not 
specified in the script. plz help me out n telll wots the reaon of this
########################################################
iptables -A INPUT -m mac --mac-source $MAC -j ACCEPT
iptables -A FORWARD -m mac --mac-source $MAC -j ACCEPT
iptables -A INPUT -m mac --mac-source ! 11:22:33:44:55:66 -j DROP
iptables -A FORWARD -m mac --mac-source ! 11:22:33:44:55:66 -j DROP
iptables -t nat -A POSTROUTING -i eth1 -j MASQUERADE
###################################################
even now it is MASQUERADING all the macs that r not specified in the script.
waiting for ur response
Regards
Azeem

_________________________________________________________________
FREE pop-up blocking with the new MSN Toolbar - get it now! 
http://toolbar.msn.click-url.com/go/onm00200415ave/direct/01/


