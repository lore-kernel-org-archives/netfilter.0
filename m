From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables questions
Date: Mon, 17 Nov 2003 09:07:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB8D61F.7050005@Loudoun-Fairfax.com>
References: <003601c3ab66$7396c360$2178df50@lanzor2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003601c3ab66$7396c360$2178df50@lanzor2k.com>
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
To: netfilter@lists.netfilter.org

Antti Korpela wrote:

> Hi,
>  
> I have here some questions and i hope you have some time to answer
>  
> 1. What difference and which is better between: iptables -t nat -j 
> MASQUERADE or SNAT --to IP if im using it for internet gateway 
> NAT-machine in big LAN-parties, over 300 IP:s.

According to Oskar's tutorial SNAT is preferable for static IPs:

> It is still possible to use the *MASQUERADE* target instead of *SNAT* 
> even though you do have an static IP, however, it is not favorable 
> since it will add extra overhead, and there may be inconsistencies in 
> the future which will thwart your existing scripts and render them 
> "unusable".
>

> 2. I have get this error often "too much work on eth0, dropping 
> packet..." what this mean? do i have to put this on kernel:
> echo "65000" > /proc/sys/net/ipv4/ip_conntrack_max ? is there any 
> other solutions for this ?

Can't help with this.

> 3. Do you have some other tips for MASQ ? :)


SNAT is pretty straightforward and there aren't a lot of configuration 
choices. It's a good idea to read all of Oskar's tutorial, but you 
should at least read and understand this section:

http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html#SNATTARGET

Jeff



