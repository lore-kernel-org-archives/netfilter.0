From: Hauser Marcel <marcel_hauser@gmx.ch>
Subject: Re: firewall failover / cluster
Date: Thu, 26 Dec 2002 00:41:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E0A4242.1050300@gmx.ch>
References: <Pine.LNX.4.44.0212192006170.6773-100000@laptop1.agatha> 	<3E028951.8090800@gmx.ch> <1040356150.2255.81.camel@doctor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1040356150.2255.81.camel@doctor>
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
To: netfilter@lists.netfilter.org
Cc: clarke@craftedpackets.net

Clarke wrote:
>>hi all
>>
>>What are you guys using in order to provide a fault toleranced iptables 
>>firewall (master / slave ?)
>>
>>Cheers Marcel
>>
> VRRP

Which implementation/daemon of the Protocol ?

How about the "outside" of the firewall ? (Public IP's and NAT for 
instance?)

Is everyone else on this list using VRRP too ? ;) or what else are you 
guys using to make an iptables firewall redundant ?

Cheers Marcel



