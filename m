From: =?iso-8859-1?Q?=D6rjan?= Persson <orange@fobie.net>
Subject: Re: TCP redirect external to external host
Date: Tue, 9 Dec 2003 20:40:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209194019.GB17111@fobie.net>
References: <20031209190402.GA16255@fobie.net> <200312091915.49683.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312091915.49683.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony Stone (Antony@Soft-Solutions.co.uk) wrote:
> 
> If it is not true that the real source IP and the real destination IP exist on 
> the same interface of the netfilter machine, repost your query with a bit 
> more detail and we may be able to help futher.
> 

The situation is that I have a hostname where there are both SMTP and
DNS services atm. The mail service is beeing migrated to another host,
and since I can't just change the IP for the hostname (would break DNS
services) I would like to have a temporary redirect to the new
mailservice for the SMTP-service, until the ppl using it has changed
their mail settings to use the new hostname.

So, I have two external host with two external IP's. They exists on the
same subnet too. Both uses the same gateway.

These are the rules I tried to use, which translates the users IP to the
first servers IP:
iptables -t nat -A PREROUTING -p tcp --dport 33 -i eth0 -j DNAT --to host2:44
iptables -t nat -A POSTROUTING -d host2 -p tcp --dport 25 -j SNAT --to host1

Hope that's enough information to get you into my problem!

Thanks for letting me take your time! :)

