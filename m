From: "john zurowski" <johnzurowski@hotmail.com>
Subject: Handling a clients fixed IP address
Date: Wed, 29 Oct 2003 21:04:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY10-F94NOrTemXpAJ0002af16@hotmail.com>
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


I've been using iptables without problems for almost a year now. A situation 
has however occured where I would like to allow access to users with fixed 
IP addresses onto the LAN in order to gain access to the internet. The 
situation is complicated because the client devices may be assigned fixed IP 
addresses which do not match our subnet or point at our gateway. Can 
iptables be configured in such a way that this could be handled 
transparently i.e. without the client having to set up dhcp client service?

_________________________________________________________________
Tired of 56k? Get a FREE BT Broadband connection 
http://www.msn.co.uk/specials/btbroadband


