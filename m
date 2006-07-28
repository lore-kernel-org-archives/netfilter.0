From: Aleksandar Milivojevic <alex@milivojevic.org>
Subject: Netfilter, bridging firewall and PPPoE
Date: Fri, 28 Jul 2006 10:37:49 -0500
Message-ID: <20060728103749.3xgjruzbkc00sw48@www.milivojevic.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I've looked around list archives, and failed to find a solution (or  
maybe it eluded me).

I'm trying to place a bridging firewall between ADSL modem and another  
host (also a Linux box).  Is it possible to configure Netfilter on the  
bridge to filter IP traffic that is encapsulated in PPPoE packets?   
 From what I have observed, the Netfilter simply doesn't see that any  
traffic is going over the bridge, and will let everything pass (looks  
like it simply ignores PPPoE packets).

I've observed similar thing on the host that is behind the bridge.   
Netfilter doesn't see PPPoE packets on Ethernet interface, it only  
sees packets as they come out of (virtual) PPP interface.

-- 
See Ya' later, alligator!
http://www.8-P.ca/


