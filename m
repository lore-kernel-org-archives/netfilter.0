From: Jeroen Vriesman <j.vriesman@prompt.nl>
Subject: Re: Dynamic redirection?
Date: Thu, 26 Feb 2004 10:25:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040226102516.14d4414a.j.vriesman@prompt.nl>
References: <1077774151.3036.78.camel@merlin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077774151.3036.78.camel@merlin>
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

Hi,

Duplicate your forwarding rules to the mangle PREROUTING table, but instead of -j ACCEPT, do a -j MARK --set-mark 1.

After that, do a NAT with "-m mark ! mark 1".

Should work.
Cheers,
Jeroen.


On 26 Feb 2004 00:42:31 -0500
Glen Becker <solar04@comcast.net> wrote:

> Hello, I haven't been lurking here long but have tried the FAQs,
> tutorials and How-To's.  I'm an iptables novice.  I thought this would
> be simple; I hope I'm overlooking something obvious.
> 
> I have a Linux server acting as a gateway between the internet and the
> internal network, allowing only authenticated hosts internet access.  I
> have a simple FORWARD (policy DROP) ruleset into which individual hosts,
> after authentication, are inserted and allowed internet access.  As each
> host's session time expires, the corresponding ACCEPT rule is removed
> from FORWARD.  That all works well.
> 
> Now I would like to do something like DNAT for http connections from
> NON-authenticated hosts to a webserver on my gateway box, but still let
> authenticated hosts through.
> 
> -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to 192.168.2.1
> unfortunately catches everything.
> 
> Is there a way to "redirect" web connections only if the packet hasn't
> already been ACCEPTed for forwarding?
> 
> For example:
> Host 192.168.2.128 is authenticated and should be allowed any internet
> connections.  http requests from all other internal hosts are sent to
> the local web server:
> 
> -P FORWARD DROP
> -A FORWARD -p udp --dport 53 -j ACCEPT
> -A FORWARD -p udp --sport 53 -j ACCEPT
> -A FORWARD -s 192.168.2.128 -p ALL -j ACCEPT
> -A FORWARD -d 192.168.2.128 -p ALL -j ACCEPT
> -A [something really smart like DNAT but only if the packet traverses
> this far]
> 
> Thanks
> 
> -Glen
> 
> 

