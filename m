From: "dimitri borjac" <dimitri_borjac@hotmail.com>
Subject: iptables and SPI
Date: Wed, 22 Oct 2003 13:26:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law10-F111cDjoYAPNX00000043@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

sorry to disturb all of you once more... and thank you Julian for your first 
answer...

but actually i think i wasn't clear enough in my last mail : is it possible 
to use iptables in order to NAT different VPN established between different 
NATted hosts and 1 remote gateway (the same gateway for all of them) ?  Such 
a NAT would be made by watching both addresses, ports and SPIs...

In other words :  is it possible for iptables to go and check the SPI field 
in the ESP Header of the IPsec packet in ESP tunnel mode ?

Hope i make me more clear this time :)
Thanks in advance !

Dimo

_________________________________________________________________
Hotmail : un compte GRATUIT qui vous suit partout et tout le temps ! 
http://g.msn.fr/FR1000/9493


