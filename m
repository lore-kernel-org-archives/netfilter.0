From: Sven Burgener <sburgener@objeng.ch>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 09:59:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4010E263.1080902@objeng.ch>
References: <400FC047.4010208@objeng.ch>    <200401221233.18553.Antony@Soft-Solutions.co.uk>    <400FD514.9060500@objeng.ch> <1089.12.75.166.13.1074782849.squirrel@nmibwkrf1.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089.12.75.166.13.1074782849.squirrel@nmibwkrf1.nexusmgmt.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

Dear John

John A. Sullivan III wrote:
> Is there any point at which you could use DNAT/SNAT to change each private
> address to a public address? Alternately, can you build a VPN tunnel
> between the two and tunnel the private addresses through the tunnel?

Perhaps a VPN tunnel would be the best solution. How would such a thing 
be established though, given that both A and B have private addresses?

The two connections between A <--> X and X <--> B need to somehow be 
interconnected. Can this be done with VPN?

>>>>         (Internet)       (Internet)
>>>>     A <------------> X <------------> B
>>>>
>>>>A: 192.168.1.13
>>>>B: 192.168.1.99
>>>>X: public IP address

Cheers
Sven

