From: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Subject: Re: about dettecting different TTL value
Date: Wed, 03 May 2006 15:50:19 +0800
Message-ID: <445860BB.5030307@inxsoft.net>
References: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>	
	<44583D20.6010703@inxsoft.net>	
	<1146634258.4841.19.camel@anduril.intranet.cartel-securite.net>	
	<4458454C.9080705@inxsoft.net>
	<1146641546.28003.20.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1146641546.28003.20.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher wrote:
> Second situation, there are solutions. One deployed is PPPoE links, even
> for cable modems. If users have to set a PPP links, then you can
> restrict a given login to one tunnel at the same time, you can restrict
> one modem to establish one tunnel at the same time, you can attach BPF
> filter to you PPP link (to enforce source IP as an example), etc.

But they can still use NAT behind a second router right? :-) I think the 
whole connection sharing issues for ISP's is that they want to sell a second 
account to someone else in that house. Its bogus cause one pays (normally) 
for an agreed link speed (no matter how many computers are behind the router 
and it will still be the same up/downlink speed to the ISP). Traffic amount 
doesn't concern either as the user should have the right to use the line as 
much as the contract allows.

And how many ISP's are there who promise a certain speed but never deliver it...

Still, to remain netfilter related in this topic, its a security question if 
its possible to force without third party software that only one computer 
uses a link, and the question remains if its possible to do it with 
netfilter (I doubt).

BR,
Thomas

