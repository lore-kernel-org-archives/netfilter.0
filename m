From: Jason Opperisano <opie@817west.com>
Subject: Re: connlimit against flashget
Date: Mon, 31 Jan 2005 11:08:05 -0500
Message-ID: <20050131160805.GA24888@bender.817west.com>
References: <87vf9fz31o.fsf@c3po.zlatenlist.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <87vf9fz31o.fsf@c3po.zlatenlist.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Jan 30, 2005 at 11:20:19AM +0200, Kamen TOMOV wrote:
> Hi,
> 
> I am running a small LAN and my Internet provider has limited the
> number of my outgoing web connections. My clients use programs like
> Flashget that spawn multiple connections to the server when
> downloading big files from web sites and it is very likely that the
> limit will be reached.
> 
> That is why I would like to ask you if it is a good idea to use the
> connlimit match with iptables to restrict the number of parallel TCP
> connections to a server per client IP address.
> 
> I plan to do something like that:
> 
> iptables -p tcp --syn --dport 80 --dst www.warez.net -m connlimit \
>          --connlimit-above 2 -j REJECT

just as an FYI--that rule does not limit the "number of parallel TCP
connections to a server per client IP address."  it limits the total
number of connections to that destination to 2, regardless of client IP
address.

someone more adept with the connlimit match will hopefully jump in and
correct me, but i *believe* if you want your limit to be 2 connections
per host IP, you would use:

  iptables -p tcp --syn --dport 80 --dst www.warez.net -m connlimit \
    --connlimit-above 2 --connlimit-mask 32 -j REJECT

-j

--
"Be careful when we capture him! We cannot claim the reward unless
 we have 51% of the carcass"
        --The Simpsons

