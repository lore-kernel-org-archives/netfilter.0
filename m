From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mangle tables.
Date: Tue, 10 Sep 2002 10:38:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209100939.g8A9d0v06610@vulcan.rissington.net>
References: <3D7D9614.1040205@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7D9614.1040205@fugmann.dhs.org>
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
To: netfilter@lists.samba.org

On Tuesday 10 September 2002 7:49 am, Anders Fugmann wrote:

> Hi all
>
> I'm lookin at the new mangles tables as of 2.4.18, and fail to
> understand excatly packets traverse these chains.
>
> the manpage says:
>       Since kernel 2.4.18, three other built-in chains are  also
>       supported  :  INPUT  (for  packets  coming  into the box itself),
>       FORWARD (for altering packets being routed through the box), and
>       POSTROUTING (for altering packets as they are about to go out).
>
> Am I correct in the following:
> Packets going through the firewall (forwarded):
> PREROUTING,....,FORWARD,....,POSTROUTING.
>
> Packets originating from the firewall itself:
> 	OUTPUT,...,POSTROUTING.
>
> Packets destined for the firewall itself:
> 	PREROUTING,...,INPUT.

Yes, you are correct in all of those.

> Next, if the above is correct, when does packets hit the chains,
> e.g. what chains are traversed between PREROUTING and FORWARD and
> POSTROUTING, in the forwarding example?

I don't know the answer to this for the latest version of netfilter, however 
it is very easy to find out for yourself, for the specific version you are 
running (which is usually the important thing).

Simply set up a series of LOGging rules in the different chains & tables, 
send some packets through the system, and the log file will tell you what 
order the packets went through the different parts of netfilter.

Try this:

for chain in INPUT OUTPUT FORWARD PREROUTING POSTROUTING
do
  for table in filter mangle nat
  do
    iptables -I $chain -t $table -j LOG --log-prefix="$chain $table "
  done
done

Ignore the few errors you get from invaliv combinations of chains & tables.

You might want to add a --log-level option as well depending on your setup.

Hope this helps,

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

