From: "D French" <dfrench75@hotmail.com>
Subject: Help, need a rule to match packets based on the next-hop chosen by 'ip route'
Date: Sun, 26 Jan 2003 11:31:47 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F177SGF4j3xTxIPrUuA00003e89@hotmail.com>
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


We are trying to match packets based on the next-hop.

Our configuration is a linux box with one WAN ethernet port (adding a second 
WAN ethernet port is not an option) connected to a hub which is connected to 
two different internet links.  We are using NAT between our LAN and the two 
links.  The problem is that even though we can equally distribute traffic to 
the two links, we can't modify the outbound source address to match the 
proper internet link.

We need a POSTROUTING rule to find out the next-hop chosen by 'ip route' and 
then change the source IP address to match the associated internet link.  
Has anyone tried anything like this, how difficult would it be to write such 
a patch???

Any help would be greatly appreciated.

D




_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*.  
http://join.msn.com/?page=features/featuredemail


