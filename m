From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: IP Spoofing
Date: Wed, 05 Nov 2003 16:22:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA96A2E.1040803@Loudoun-Fairfax.com>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>	 <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>	 <1068062902.1494.25.camel@main.tqmcube.com>	 <3FA95D0C.5080306@Loudoun-Fairfax.com> <1068065872.1494.40.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068065872.1494.40.camel@main.tqmcube.com>
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
To: IPTables Mailing List <netfilter@lists.netfilter.org>

David C. Hart wrote:

>On Wed, 2003-11-05 at 15:26, Jeffrey Laramie wrote:
>  
>
>>In this setup the packets from the LAN have to enter from eth0 as Antony 
>>indicates. Eth1 would have to be the external interface. Keep in mind 
>>that these rules only affect traffic to and from the firewall host 
>>itself. Traffic between the LAN and the internet is handled on the 
>>FORWARD chain.
>>
>>    
>>
>I just did a slap-the-head-"duh". We're not configured that way. Our
>server, which also runs IPTables is fed from the router as a DMZ. The
>clients are connected to the same router, a couple by a hub to the
>uplink. Hmm.
>
>  
>
In that configuration iptables does nothing for your LAN, only the 
server. If you can put a firewall box between the internet and the 
router that's the best choice. Otherwise you need: Internet -> Router -> 
Firewall -> Hub  -> LAN/DMZ

Jeff


