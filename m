From: Steve Mickeler <steve@warning.ca>
Subject: Re: FORWARD in/out VS. states
Date: Tue, 18 Mar 2003 01:23:31 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303180112360.9242@gypsy>
References: <IAEOKBNDAKLABMLEEMMKOEMBDCAA.sh@realsecure.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <IAEOKBNDAKLABMLEEMMKOEMBDCAA.sh@realsecure.net>
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
To: Shaun Hedges <sh@realsecure.net>
Cc: netfilter@lists.netfilter.org


Unless you're using NAT, you shouldnt need ip_conntrack

Just use a simple rule such as:

$IPT -A FORWARD -d 2.2.2.0/24 -p tcp --syn -j DROP
$IPT -A FORWARD -d 2.2.2.0/24 -p udp -j DROP

This will allow traffic back in to connections established from 2.2.2.0/24
but now allow external connections to establish any _new_ connections to
2.2.2.0/24



> Our mission:
>
> To only allow FORWARD traffic coming from a trusted NIC or subnet out to the
> internet, while not letting any traffic at ALL back into that trusted NIC or
> SUBNET UNLESS it was initiated from within.
>
> So, we want 2.2.2.0/24 to be able to initiate any connections they want, and
> get the response it needs back, but we want no connections to be able to
> come in ( i.e. those annoying windows msg popup ads spammers are using, worm
> problems, icmp probes, etc ).
>
> I've read up and understand somewhat, but can't seem to figure out how to
> deal with this in/out issue and not using connection tracking.
>
> Thanks!
>
>

