From: "Jim Fleming" <JimFleming@ameritech.net>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sat, 21 Sep 2002 16:53:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0a5001c261b9$541d3700$c6b22543@repligate>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <0a3801c26172$51f71af0$c6b22543@repligate> <20020921135239.CIIH27185.mta03-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

> 16 bits - fragment identifier
http://ipv8.dyn.ee/INFO/Papers/RIFRAF/


----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, September 21, 2002 8:52 AM
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits


> On Saturday 21 September 2002 2:25 pm, Jim Fleming wrote:
> 
> > There are 160 bits in the IPv4 header, all can be considered for routing
> > purposes.
> 
> I think that is an extreme ( = unreasonable ) point of view.
> 
> Of the 160 bits in an IPv4 header, I really do not see how you could 
> reasonably use these 49 for routing purposes:
> 
> 4 bits - header length
> 16 bits - fragment identifier
> 13 bits - fragmentation offset
> 16 bits - header checksum
> 
> Of the remaining 111 bits, even these 28 would be a challenge to use 
> intelligently for routing, I think ?
> 
> 4 bits - IP version no
> 16 bits - total packet length
> 8 bits - time to live
> 
> The length and the ttl might make sense as numeric values, but not as 
> bitmasks for routing decisions.
> 
> I think it's much fairer to say that of the 160 bits in the IPv4 header, 83 
> of them make sense for routing purposes:
> 
> 8 bits - type of service
> 3 bits - fragmentation flags
> 8 bits - protocol identifier
> 32 bits - source address
> 32 bits - destination address
> 
> Antony.
> 
> -- 
> 
> This is not a rehearsal.
> This is Real Life.
> 
> 


