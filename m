From: "Rodrigo Haces" <rhaces_chistes@yahoo.com.mx>
Subject: IP Alias with iptables
Date: Mon, 19 Apr 2004 09:41:44 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEKLOMJOPNJPAFKHEDJGECGCDAA.rhaces_chistes@yahoo.com.mx>
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

Hi:

I have only one network adapter in my Server, but i need to have 2 different
networks, 192.168.1.0 to the MAC addresses i know and 192.168.0.0 to the MAC
addresses i dont't know, i have managed this by makin mi eth0 to 192.168.1.1
and an alias eth0:0 to 192.168.0.1, everythings ok, but i'm also sharing
internet, but when i start the rule to the eth0:0 it sends me an error. Is
there a way to use IP Aliasing with iptables? if not, is there a way to
create an eth0 and eth1 witn the same adapter?

Thanks

Rodrigo


