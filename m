From: Menno Smits <menno@netboxblue.com>
Subject: Re: Per-client routing, plus masquerading -- possible?
Date: Mon, 27 Mar 2006 16:13:07 +1000
Message-ID: <44278273.3040609@netboxblue.com>
References: <51e5f6120603221910j3a7d3827oddb2b3bdcacaa818@mail.gmail.com>	<44224FB7.3020502@netboxblue.com>	<51e5f6120603230135s75fbaeffx6f7e873185be28b3@mail.gmail.com>
	<20060323122344.GA1302@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060323122344.GA1302@zion.homelinux.com>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: Netfilter Mailing list <netfilter@lists.netfilter.org>

Sven Schuster wrote:

> try
> 
> iptables -L -v
> 
> this will give you additional information about your rules!

Yep. -x and -n are also quite useful when viewing your configuration. 
"man iptables" is your friend.

> I don't think iptables checks if the interface exists on rule
> insertion time. Which makes sense in my opinion, so you can add
> rules e.g. for device ppp0 (or even all devices beginning with 'ppp'
> as expressed by 'ppp+') before the specific device has been created.

Agreed. Being able to insert rules for non-existent interfaces is 
definitely desirable and by design. It means rules can be in place 
before an interface comes up or even exists. This is highly useful from 
a security perspective and also provides flexibility about when you set 
up your firewall.

Menno




Scanned by the NetBox from NetBox Blue
(http://netboxblue.com/)





