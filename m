From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: destinations interface must be eth0?
Date: Tue, 16 Sep 2003 10:22:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916142218.GC16559@cannon.eng.us.uu.net>
References: <1063637259.2318.3.camel@dod-secure.e-masi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Burnett <jburnett@e-masi.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

What is not working? That the packets are not being DNATted to 192.168.1.56:80?

Ramin

On Mon, Sep 15, 2003 at 09:47:39AM -0500, Jim Burnett wrote:

> I have found that my destination IP in my rules MUST be bound on eth0
> what is this? I thought I could use any working IP on my internal
> network as the --to-destination IP...??
> 
> Example:
> internal machine:
> eth0:192.168.1.55
> eth1:192.168.1.56
> 
> 
> #1
> iptables -v -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNA
> T--to                  192.168.1.55:80
> This will work because the destination IP is on eth0
> 
> #2
> iptables -v -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNA
> T--to                  192.168.1.56:80
> This wont work because the destination IP is on eth1
> 
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
> 

