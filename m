From: "Simon Garner" <sgarner@expio.co.nz>
Subject: Re: NAT with two Internet links
Date: Thu, 16 Oct 2003 20:45:37 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01d101c393b9$a8e3f390$0301a8c0@SIMON>
References: <01b801c393b0$3c837080$0301a8c0@SIMON>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

On Thursday, October 16, 2003 7:37 PM [GMT+1200=NZT],
Simon Garner <sgarner@expio.co.nz> wrote:

> Hi,
>
> I have a small network with several Windows client PCs, a Linux
> firewall/server, and two links to the Internet. What I want to do is
> have certain traffic (based on source and/or destination ports) routed
> through one link while everything else goes through the other.
>

Nevermind, after a bit more googling I found the answer myself. The
solution is to mark the wanted packets with iptables and then route them
with iproute2, as per:
http://www.lartc.org/howto/lartc.netfilter.html

-Simon


