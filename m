From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Invalid friggen argument
Date: Tue, 14 Oct 2003 02:04:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066111459.2383.67.camel@alpha.newkirk.us>
References: <200310120141.15894.Herman@AerospaceSoftware.com>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310120141.15894.Herman@AerospaceSoftware.com>
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
To: Herman@AerospaceSoftware.com
Cc: netfilter@lists.netfilter.org

On Sun, 2003-10-12 at 03:41, Herman wrote:
> Hi everybody,
> 
> I am trying to get port forwarding to work.  I had it working some time ago 
> gawdknows what changed...
> 
> Now, I get this result with iptables 1.2.7a-2mdk and with 1.2.9rc1:
> 
> # iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 6390 \
>  -j DNAT --to 192.168.10.245
> iptables: Invalid argument

Have you checked lsmod, to make sure you have iptable_nat loaded?  If
not, try "modprobe iptable_nat" then try your rule again.

j



