From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: DNAT for two external NIC
Date: Tue, 5 Sep 2006 10:29:42 +0800
Message-ID: <01d101c6d093$2713d960$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
> 
> I did not go through your post carefully enough to know what you are talking
> about. But my question was why do we have to turn off reverse filter path
> checking to get multipath routing to work ? The original idea of reverse
> filter path checking is to improve security by doing reverse path checking,
> ie by checking the source IP address of all packets coming in via an interface 
> against the networks known to be behind that interface, the firewall/router 
> can simply drop packets that aren't supposed to come from there. In the
> multipath routing case, the packets are INDEED supposed to be from the
> interface where it is coming from, why they are dropped ?
> 

Perhaps this is what this patch is all about ?

                     http://www.ssi.bg/~ja/#rp_filter_mask

I have noticed that Julian Anastasov's patch has existed long long time ago
but it is never included into the standard kernel. I really wonder why. 

Cheers.





