From: Drag0n <dragon@atlantacon.org>
Subject: Linux firewall and high availability
Date: Tue, 13 Jan 2004 19:39:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074040776.4072.7.camel@drag0n.the-weyr.local>
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

I have a situation that i need to have firewall fail over capability. 2
separate systems with identical rules with 3 interfaces, (internet, DMZ,
and LAN) 

Has anyone set up this situation and have any recommendations on how it
should be approached? I have looked into the linux HA system
(http://www.linux-ha.org/). is it possible to load ballance between the
two and shift on failure of the primary? 

Any info or direction would be appreciated.

Drag0n
dragon@atlantacon.org


