From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: MAC Block for the DHCP via iptables
Date: Mon, 17 Nov 2003 12:42:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB90889.9040804@Loudoun-Fairfax.com>
References: <008801c3ad28$da9e4b50$0d1ea8c0@win2000adv> <200311171702.hAHH2pj22305@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311171702.hAHH2pj22305@agate.rockstone.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

Antony Stone wrote:

>On Monday 17 November 2003 4:35 pm, Chandana Bandara wrote:
>
>  
>
>>Hi     Mr.Antony & ALL ,
>>
>>iptables -P INPUT DROP
>>iptables -P FORWARD DROP
>>iptables -P OUTPUT DROP.........only with those policies ,
>>should block the all incomming , outgoing from the machine ?????
>>    
>>
>
>Assuming you have flushed the rules as well, with:
>
>iptables -F INPUT
>iptables -F FORWARD
>iptables -F OUTPUT
>
>then no IP traffic will be allowed into, out of, or through, the machine.
>
>  
>

Chandana, Antony is making a theoretical point here. Your loopback interface uses the OUTPUT chain and dropping every OUTPUT packet could cause some unexpected problems. I wouldn't recommend doing this. If you ever really wanted to block *all* traffic just unplug the network card(s). It's a lot easier and 100% secure. I hope Mr. Curleybaces reads this too or he could be in for a big surprise :-)

Jeff


