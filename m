From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquerading with optional external ip
Date: Fri, 7 Nov 2003 10:07:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071007.hA7A7Mj14582@agate.rockstone.co.uk>
References: <810BC538117E9F4E9BB152E0C100DF1F061716@farmer.vikus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F061716@farmer.vikus.net>
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
To: netfilter@lists.netfilter.org

On Wednesday 05 November 2003 9:52 pm, Patrick Ahler wrote:

> I currently have a working masquerade rule for my firewall :
>
> iptables -t nat -A POSTROUTING -s 192.168.1.192/25 -o eth1 -j MASQUERADE
>
> Any IP in the 192.168.1.192/25 range masquerades as the firewall's
> external IP (a.b.c.d). I would like to specify that it runs on another
> ip (a.b.c.x), is this possible? If so how must I change my current rule?

iptables -A POSTROUTING -t nat -s 192.168.1.192/25 -o eth1 -j SNAT --to 
a.b.c.x

Antony.

-- 

How should I know if it works?   That's what beta testers are for.   I only 
coded it.

 - Linus Torvalds
                                                     Please reply to the list;
                                                           please don't CC me.

