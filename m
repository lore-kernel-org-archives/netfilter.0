From: Jamie Pratt <jamie@nucdc.org>
Subject: Re: destinations interface must be eth0?
Date: Tue, 16 Sep 2003 10:14:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F671AAF.90207@nucdc.org>
References: <1063637259.2318.3.camel@dod-secure.e-masi.com>
Reply-To: jamie@nucdc.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063637259.2318.3.camel@dod-secure.e-masi.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi.

Jim Burnett wrote:

<snip>

 > #2
> iptables -v -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNA
> T--to                  192.168.1.56:80
> This wont work because the destination IP is on eth1
> 

...did you try using -i eth1 instead of -i eth0 in the above command?


> I didnt see this in the documentation and it took my 5 days to figure it
> out....
> 
> Tested on 6 machines, redhat 9, slackware 9, Latest gentoo build from
> stage 1. Various brand nic cards. Various compiled kernels. 2.4.18 -
> 2.4.22
> 
> -Jim
> 
> 

regards,
jamie

> 
> 
> 
> 




