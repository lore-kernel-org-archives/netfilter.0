From: Jason Opperisano <opie@817west.com>
Subject: Re: Ethernet port redirection
Date: Wed, 5 Jan 2005 10:52:39 -0500
Message-ID: <20050105155239.GB24445@bender.817west.com>
References: <000d01c4f33a$5ac1f590$eaab9385@gagan>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000d01c4f33a$5ac1f590$eaab9385@gagan>
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

On Wed, Jan 05, 2005 at 08:52:06PM +0530, Navneet wrote:
> Hi,
> 
> Now, pease check this out :-
> I was trying to run squid in transparent mode(Transparent Proxying) ?
> 
> System details:
> RedHat Linux 9
> eth0 133.147.171.169/8 [Internal NIC]
> eth1 172.21.133/14        [External NIC]

maybe i'm being silly--but it sure looks to me like eth0 is external and
eth1 is internal.

> All http request get REDIRECTED to squid  at eth0(Internal).It should work
> as Gateway by means of eth1(External).
> 
> i've done this:
> 1.Enabled IP forwarding
> #echo "1" >/proc/sys/net/ipv4/ip_forward
> 2.iptables (Netfilter) PORT REDIRECTION:
> #iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 3128

are you *positive* that you don't mean eth1 there?

-j

--
"Ah, good ol' trustworthy beer. My love for you will never die."
        --The Simpsons

