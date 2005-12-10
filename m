From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: QoS with netfilter (nfcan: addressed to exclusive sender for
	this address)
Date: Sat, 10 Dec 2005 10:08:41 -0500
Message-ID: <20051210150841.GI21804@salty>
References: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <bab495710512100453s275d2335l4a92d90d37224c2@mail.gmail.com> (from
	+nfcan+jimlaur+94611cad01.erikev#gmail.com@spamgourmet.com on
	Sat, Dec 10, 2005 at 07:53:11 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.12.10 07:53, Erik - erikev@gmail.com wrote:
> Am trying to add QoS to some web cam traffic on a network.
> Also a newbie to netfilter.
>
...
> 
> Tried netfilter commands like:
> >iptables -t mangle -A FORWARD -s 10.0.0.0/8 -j DSCP --set-dscp 1
>
...
> Furthermore, a command like
> >iptables -L FORWARD
> 
> list a set of rules etc but this QoS is not one of them apparently...
>

The -L command has a default table argument, filter.
If you want to see the contents of another table,
you have to specify the table explicitly. Try this:

iptables -t mangle -L -xnv

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

