From: Brent Clark <bclark@eccotours.co.za>
Subject: Re: Redirecting incoming packets to other port
Date: Wed, 11 Oct 2006 12:08:13 +0200
Message-ID: <452CC28D.5020000@eccotours.co.za>
References: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>	
	<452CAFDC.3070909@eccotours.co.za>
	<c936c6b70610110244m34760db8wc1a942becc475910@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c936c6b70610110244m34760db8wc1a942becc475910@mail.gmail.com>
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

Holger Kinkelin wrote:
> Hello,
> no this doesn't seem to work.
> 
> I can REDIRECT packets sent BY my computer, not packets sent TO it. Is
> there maybe another posibility?
> 
> Regards,
> Holger
> 
> PS: Thanks to Brent for his reply

Hi

Only a pleasure.

Lets take a working example.
When you want to create a Transparent Proxy. Traffic gets sent to port 80, to the site in question.

You, on your firewall /router redirect to port 3128, or what ever you choose to have squid to run on.

So are you sure you have your service running on port 5053 as opposed to 5060.

Is this really for SIP.

Brent

P.s. You may want to share your ruleset.

