From: Anthony DiSante <theant@nodivisions.com>
Subject: Re: Can someone recommend a good simple firewall script?
Date: Thu, 11 Aug 2005 15:06:30 -0400
Message-ID: <42FBA1B6.6070600@nodivisions.com>
References: <42FB4FB2.5020904@us.ibm.com> <200508111237.12648.rob0@gmx.co.uk>
	<200508111252.13654.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508111252.13654.rob0@gmx.co.uk>
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

/dev/rob0 wrote:
>>learn iptables yourself, fine; if not, look on freshmeat for
>>something better. Just about anything you might find is probably
>>better.
>>
>>At this time I don't have something specific I can recommend. Before
>>I learned iptables I used MonMotha's, but that's too complicated for
>>my liking.
> 
> I don't have time to go looking, but ISTM that many of today's crop of 
> questions was related to this poster's issue. They are probably not 
> really wanting to learn firewalling, they simply want to have a rule 
> set that works and is easy to manage.
> 
> Yes, I know there are things like firestarter which can generate 
> rulesets. But is there something non-GUI, and simple?

I'm not an expert with firewalls, but it seems to me that many people would 
be well-served by something even more basic than a simple ruleset-generator.

Two of the most common services anyone would want to offer are HTTP and SSH. 
  And many people are either directly connected to the internet (i.e. the PC 
has a public IP) or else are behind a hardware router (the PC has a private IP).

Let's further assume that in many/most cases, people in that situation (who 
want HTTP and SSH open) would want the system completely locked down otherwise.

Given those constraints, which I think would apply to many people in many 
situations, couldn't we ("we" meaning the experts, excluding myself here) 
just provide two static rulesets that would satisfy all these people?  One 
for the system with a public IP, and one for the system behind a router?

-Anthony DiSante
http://encodable.com/
http://nodivisions.com/

