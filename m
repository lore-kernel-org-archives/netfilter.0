From: "Filip Sneppe (Cronos)" <filip.sneppe@cronos.be>
Subject: Re: Conntrack helper problems (patch-o-matic-20030107)
Date: 27 Feb 2003 23:35:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046385336.737.10.camel@exile>
References: <PIEIIGGHCLEGAPAHFMDOIENNCJAA.Robert.Allmeroth@epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PIEIIGGHCLEGAPAHFMDOIENNCJAA.Robert.Allmeroth@epygi.de>
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
To: Robert Allmeroth <Robert.Allmeroth@epygi.de>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-02-27 at 17:16, Robert Allmeroth wrote:
> 
> here is what i have / see:
> 
> FTP conntrack problem:
> bash-2.05# cat /proc/net/ip_conntrack
> tcp      6 431573 ESTABLISHED src=172.30.255.1 dst=10.20.0.17 sport=1572 dport=21 src=10.20.0.17 dst=10.20.10.197 sport=21
> dport=1572 [ASSURED] use=1
> EXPECTING: - use=1 proto=6 src=10.20.0.17 dst=10.20.10.197 sport=0 dport=1573
> 
> The sport=0 seems wrong to me..
> 
Hi Robert,

It's not necessarily wrong. Basically a conntrack helper 
will tell connection tracking what connection to expect 
based on IP/TCP header and packet payload info from the 
"master" connection.

Often, it will get both IP addresses, plus one port
(destination port is the obvious candidate). With this
info, the expectation will be set up. The other port
is "random" (ie. picked by the client) and can't 
really be predicted. 

When a conntrack helper sets up an expecation, it
fills in the necessary values and also uses a mask
to point out the relevant info.

The sport=0 here basically means "any port" and is
probably the result of the mask being set to 0 for
the sport of the expectation.

About your problem, are all relevant conntrack + nat
modules loaded (check with lsmod) ?

Regards,
Filip


