From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: MAC/IP PAIR MATCH
Date: Fri, 27 Jan 2006 15:17:48 +0100
Message-ID: <43DA2B8C.5050007@prosyst.com>
References: <164362107.20060127145214@gorontalo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <164362107.20060127145214@gorontalo.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Iwan Fauzie wrote:
> Hello,
> 
> I would like to patch mac/ip pair match, how to do that? any body help me
> 

If you want to match IP against MAC address, then check the iptables's 
_mac_ match:

# iptables -m mac -help

Example: rule for forwarding packets matching certain IP/MAC pair is:

# iptables -A FORWARD -s <IP _address> -m -mac --mac-source <MAC 
address> -j ACCEPT

... but if you want to "patch a match", then you need to specify a bit 
more detailed what are you trying to do.

The _mac_ match exist into the default iptables source (./extensions) 
e.g. you don't need to patch anything. Just install iptables and enable 
the match inside your kernel's .config file (CONFIG_IP_NF_MATCH_MAC=y) 
and finally recompile (and install) the new kernel.


