From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Netfilter bug ? NAT'ed connections ignore icmp redirect
Date: Wed, 15 Sep 2004 13:18:10 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41488762.60309@pbl.ca>
References: <20040915133959.GA22165@hswn.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040915133959.GA22165@hswn.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Henrik Stoerner wrote:
> I have a setup where I use a Linux box with netfilter to forward
> tcp connections between a "client" and a "server.
> 
> The Linux box has a default gateway defined. However, there are
> multiple other routers on the same network, and the default
> gateway router sends ICMP redirects to inform the Linux box 
> which router should be used to reach some destination.

Probably a stupid question.  But.  Why don't you simply define two 
static routes on the NAT box pointing to firewall (packets to server) 
and routerC (packets to client)?  Or let the router do its job of 
actually routing packets instead of generating error messages back to 
clients (in which case you would really need one router with 5 interfaces).

IMHO, relying on ICMP redirects to create routes for you is inefficient 
and error prone.  It's kind of asking for trouble.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

