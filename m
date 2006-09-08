From: Dmitri <dk-netfilter@nth.ca>
Subject: Re: matching -d to a given interface without specifying ip address
Date: Thu, 07 Sep 2006 22:03:55 -0400
Message-ID: <4500CF8B.8060304@nth.ca>
References: <000601c6d0a5$da2c37b0$0101000a@tanjian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000601c6d0a5$da2c37b0$0101000a@tanjian>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Rob Sterenborg wrote:
> Yes, but there is a difference:
> Here you are talking about packets that come from your client that are
> sent to Google. These do not have the destination IP of the firewall box
> but pass through the firewall because you have set your gateway
> according. Besides, that would be SNAT which is something else.
...
 > ... A client from the internet can
 > only point to your public IP ...

Yes, but a client from the local network can either point at google's 
ip, or the public or private IP of the gateway. I wanted to detect these 
cases. It's specifically about local clients, whichever IP they're 
pointing to.

> Perhaps you're confusing DNAT with SNAT?
> When packets for Google pass through it's (initial) direction is from
> your LAN to the internet and packets are SNAT-ed. This is the opposite
> of what you want above.

No, I'm not confusing DNAT with SNAT. SNAT, particularly MASQUERADE, is 
happening anyway for -o ppp0. But I wanted to DNAT some things directed 
to the box itself to some other destination. When they come -o ppp0, 
they will get MASQUERADEd as well.

Anyway, I think I have the answer to my question, as explained in my 
response to Danny.

Thanks,
--Dmitri

