From: Menno Smits <menno@netboxblue.com>
Subject: Re: Why is ipset nethash set type limited to /31?
Date: Fri, 10 Mar 2006 17:13:39 +1000
Message-ID: <44112723.30505@netboxblue.com>
References: <s410b957.066@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s410b957.066@gwia201.syr.edu>
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
To: Netfilter Mailing list <netfilter@lists.netfilter.org>

Hi Randy,

Randy Grimshaw wrote:
> you cannot have a legitimate network with only one address. you also
> need a network address (x.x.x.0) and a broadcast address (x.x.x.3)
> and two addresses for the communicating systems to use (x.x.x.1 and
> x.x.x.2)
> 
> Mircosoft windows and other OS's also enforce this so a /32 isn't
> practical.....   but...
> 
> I understand your idea though, I needed to define several nearly
> duplicate rules for NET and IP hashes in our gateway application.
> Fortunately the cost is minimal compared to the overall efficiency
> gained by using IPset. (A fabulous tool that needs to become
> mainstream).

I understand networks, network addresses and broadcast addresses however
it would be useful to be able to match against both IP addresses and
networks with the one set. Why can't an IP address just be treated as a
/32 "network"?

The fact that you've had to work around te same limitation indicates
that I'm not the only one who could benefit from something like this. Is
there a technical reason why this isn't possible?

On a side note, I agree that IPset is fabulous and should be part of
mainline netfilter. It can greatly simplify otherwise complex firewall
configurations.

Menno



Scanned by the NetBox from NetBox Blue
(http://netboxblue.com/)


