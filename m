From: Warwick Mitchell <wmitchell@glug.org.au>
Subject: re:Connection accounting stats
Date: Wed, 2 Oct 2002 20:04:34 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210022003090.1569-100000@crux.geek>
References: <OE33EhBZsGcZuRbr5mL000077a3@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OE33EhBZsGcZuRbr5mL000077a3@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hard__ware <hard__ware@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2 Oct 2002, hard__ware wrote:

> Hello Warwick,

Hi :)

> > Just wondering if there is anyway to log how many bytes are transfered in
> > a connection? Not of a rule, but of an actual connection. The PIX
> > firewalls do something similar to this. Additionly it would be good to
> > know the total time of the connection, but that's not necessary.
>
> it depennds on weather you using a Network (ethernet) or dialup connection .

Sorry, didn't make myself clear. I meant tcp connections. The
connections that conntrack module keeps track of.

	Warwick



