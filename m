From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: IPTABLES NAT
Date: Wed, 10 Sep 2003 09:04:08 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309100844030.977@simba.math.ucla.edu>
References: <017601c37761$b1aeecb0$798014ac@matthew>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <017601c37761$b1aeecb0$798014ac@matthew>
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
To: Matthew Mileham <matthew@postbag.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 10 Sep 2003, Matthew Mileham wrote:
> I've got 2 Redhat 9 Linux Servers purely running iptables and only using
> the NAT function

> I want to load balance over two boxes, I want to send traffic out the one
> box and SNAT 57.24.224.242, and return traffic to return to the second
> box and DNAT to 172.20.128.121

> If I send traffic over the one box and receive on the same box it works,
> but when I split the traffic it doesn't work !

Suppose an internal machine originates a connection.  Its initial packet
goes out box 1 and a connection is recorded.  If the outside world's answer
came back to box 1, then box 1 could undo the SNAT and send the packet to
the originator.  But box 2 has no idea what's going on.  If the answer goes
through box 2, it either drops the packet if you have
    iptables -t filter -P FORWARD DROP
    iptables -t filter -A FORWARD -m state --state NEW,RELATED,ESTABLISHED \
	-j ACCEPT
because this is for a connection it has no record of, or it might forward
the packet to box 1 which maybe, possibly, could recognize and correctly
forward it, if the filter rules had the right security holes.  The effect
is similar if an outside machine originates the connection to your internal
host.

It's "accepted wisdom" that the load on the machine from forwarding packets
is very low, assuming your netfilter rules aren't too baroque and assuming
you avoid logging most packets (log only the ones you drop).  Your kind of
load sharing would only be justified if you had extreme datarates like a
fully saturated OC-12 link or something like that.  If that were really
true, I would load-share by splitting the internal subnet and giving one
gateway machine to each half.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

