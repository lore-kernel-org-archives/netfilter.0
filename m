From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Using mangle table to change source address, how?
Date: Mon, 4 Nov 2002 20:45:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021104204536.GNJJ27595.mta05-svc.ntlworld.com@there>
References: <m3vg3d84fo.fsf@khem.blackfedora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <m3vg3d84fo.fsf@khem.blackfedora.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Monday 04 November 2002 8:28 pm, Mark Atwood wrote:

> I have an interface eth1, with an IP address 192.168.23.100
>
> I've configured eth1 to have a subinterface eth1:0, and
> have given that subinterface an IP address 172.23.1.3.
>
> There is a host on the segment that this interface is connected to
> with an IP address of 172.23.1.2.
>
> If I send packets to that host 172.23.1.2, the packets from me have a
> source address of 192.168.23.100, not 172.23.1.3!
>
> Can I use the mangle table to rewrite the source address?  If so,
> what is the iptable command line?
>
> Or is there an easier way?

Use the nat table - that's what it's for.

eg

iptables -A POSTROUTING -t nat -d 172.23.1.2 -j SNAT --to 172.23.1.3

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

