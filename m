From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Temporary redirection with DNAT and SNAT (nfcan: addressed to
	exclusive sender for this address)
Date: Tue, 26 Apr 2005 22:36:13 -0400
Message-ID: <20050427023613.GC28992@salty>
References: <48be50bb0504261013137f3cd2@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <48be50bb0504261013137f3cd2@mail.gmail.com> (from
	+nfcan+jimlaur+e2c564b3f5.whereisgui#gmail.com@spamgourmet.com
	on Tue, Apr 26, 2005 at 13:13:57 -0400)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.04.26 13:13, Kirk - whereisgui@gmail.com wrote:
> Hello,
> 
> I have to shutdown a proxy server for a few days and I need to
> redirect its traffic to a server behind an iptables firewall. Here's
> what I want to do:
>
snip
> 
> But I'm having problems with the second part. The SNAT rule:
> -I POSTROUTING -s 192.168.0.3 --sport 2050  -o eth0 -j SNAT --to
> 130.17.174.108
> 
> #This one seems OK too.
> -A PREROUTING -i eth0 -p tcp -d $PUBLIC_IP --dport  80 -j DNAT --to
> $PRIVATE_IP:2050
> 
> 
> The SNAT rule generates the error:
> Applying iptables firewall rules: iptables-restore v1.2.11: Unknown
> arg `--sport'

I think the difference is that the SNAT rule does not
specify the protocol the way the DNAT rule does ( -p tcp ).
You can only specify a source port for a
protocol that uses the concept of a "port".

> 
> Could someone provide help to solve this problem?
>

HTH

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

