From: Nimit Gupta <nimit@deeproot.co.in>
Subject: Re: another conntrack table query
Date: Fri, 31 Jan 2003 20:05:26 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0301312001390.13580-100000@avishkaar.lan.deeproot.co.in>
References: <20030131113014.GW11221@miggy.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030131113014.GW11221@miggy.org>
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
To: netfilter@lists.netfilter.org

hello,
	one more thing on what basis the time for UNREPLIED entries gets
reset? is there a link where such things are explained in detail?


thanks for your help.

with regards,
nimit.

On Fri, 31 Jan 2003, Athan wrote:

> On Fri, Jan 31, 2003 at 04:10:23PM +0530, Nimit Gupta wrote:
> > hello,
> > 	can somebody point me to a link or answer why does the conntrack table
> > keeps the entry for connections marked as TIME_WAIT, and if it is not so
> > useful how can i remove them as soon as the connection finishes.
>
>   My guess would be because it is still waiting for the remote end to
> fully close the connection.  This means there's the possibility of
> further packets getting sent to that local ip:port.  If you delete the
> entry and the port gets reused you'll possibly have two remote ip:port's
> both trying to send traffic to the same local ip:port and causing
> erroneous RSTs of the connection.
>
>   Or something like that.
>
> -Ath



