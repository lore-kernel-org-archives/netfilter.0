From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: multicast over firewall linux
Date: Wed, 14 Jan 2004 15:33:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040114203316.GA11981@cannon.eng.us.uu.net>
References: <20040113063633.93629.qmail@web40107.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040113063633.93629.qmail@web40107.mail.yahoo.com>
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
To: duong hung <duong.vn@rocketmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, Jan 12, 2004 at 10:36:33PM -0800, duong hung wrote:

> Hi ,
> 
> My network have config as : 
> 
>   Cisco -------------- linux box ----------- Cisco
>  203.168.3.1   203.168.3.2   192.168.0.1  192.168.0.2
> 
> I want multicast packets to flow between two router
> cisco . Multicast routing use PIMv2. Any people help
> me this problem

If the linux box is not multicast aware and not a part of
PIMv2 cloud, then you have to set up a GRE tunnel between the
two cisco's. Unless you run something like pimd on the
linux box. But again because you're using private IP's
on one of the cisco's, I don't exactly know what the
implications would be on natting the pim control packets.

Ramin

> 
> Thanks

