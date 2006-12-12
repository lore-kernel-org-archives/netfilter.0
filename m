From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: is it possible to nat to the routed IP?
Date: Tue, 12 Dec 2006 18:54:27 +0100
Message-ID: <000301c71e16$91295f70$0101000a@tanjian>
References: <ad41208c0612120718q3fff3c3ai2e668e62b5fb4408@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ad41208c0612120718q3fff3c3ai2e668e62b5fb4408@mail.gmail.com>
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

> Thanks a lot, now it works perfect.
> 
> Now the another issue is coming:
> 
> before we monitor the gateway network traffic via snmp, because I
> assign 210.153.22.y to eth1, so I get snmp figure from eth1, and then
> draw the network traffic, but  I am lazy to IP alias, so I use:
> ip addr add 210.153.22.y dev eth1
> 
> Ofcs, the result is that I couldn't monitor it via snmp, at this kind
> status, how could I monitor network traffic?
> 
> any tips, thanks a lot,

I'm not sure but I thought traffic statistics were related to the NIC,
not to an IP address, so you might not be able to do this..
There may be an application that can however, but I'm not aware of it.
Maybe someone else is.


Grts,
Rob


