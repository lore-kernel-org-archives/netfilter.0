From: Jason Opperisano <opie@817west.com>
Subject: Re: (no subject)
Date: Sat, 21 May 2005 14:16:37 -0400
Message-ID: <20050521181637.GA1564@bender.817west.com>
References: <3b29fb79050520200817e1e315@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3b29fb79050520200817e1e315@mail.gmail.com>
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

On Sat, May 21, 2005 at 06:08:59AM +0300, bright true wrote:
> Hello , 
>  How can i set the Max number of allowed tcp connections from the same ip 
> address ???
>  if the current ip has more than the allowed number of connections the 
> server will drop or reject the new connections 
>  untill it gets an empty space to connect 
>  if there's any rule i can set for this (please provide me with the way to 
> remove the rule also)

the way to do this correctly is to apply the connlimit patch from PoM,
and use a rule like (using SMTP as an example and 4 conns):

  iptables -A [INPUT|FORWARD] -p tcp --syn --dport 25 \
    -m connlimit --connlimit-above 4 -j REJECT

this will result in any individual IP being allowed to make up to 4
simultaneous connections.

you delete rules by replacing the '-A' with a '-D'

-j

--
"Peter: Brothers and sisters fighting is as natural as a white mans
 dialog in a Spike Lee movie."
        --Family Guy

