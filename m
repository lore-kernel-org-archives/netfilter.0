From: Jason Opperisano <opie@817west.com>
Subject: Re: Setting up 1:1 NAT for DMZ (Repost w/o HTML)
Date: Wed, 5 Jan 2005 14:10:35 -0500
Message-ID: <20050105191035.GA25193@bender.817west.com>
References: <FC8AF9F27A8C6E4DAB2072FC162C421CFC2E58@HILLEX.HILLNET.ad.hsd.k12.or.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <FC8AF9F27A8C6E4DAB2072FC162C421CFC2E58@HILLEX.HILLNET.ad.hsd.k12.or.us>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jan 05, 2005 at 10:28:12AM -0800, Spidal, Glen wrote:
> Hello all,
> 
> I would like some advice on setting up 1:1 incoming and outgoing NAT for
> a block of 13 public IP addresses.  I looked at the Patch-O-Matic NETMAP
> command, but it appears it is for an entire subnet.  Currently the
> addresses are the same for web and email traffic but that may change in
> the future.
> 
> I looked at a sample script and have NATing working for my LAN but not
> my DMZ.  Two of the public IPs would be for DNS servers.  I added eth0:1
> but am unsure how to process that public IP from there on.

ideally--the addresses are contiguous and the last octet of the public
NAT address matches the last octet of the private DMZ address; and you
can script it like so:

  for i in `seq 11 23`; do
    ip addr add 1.2.3.${i} dev $EXT_IF

    iptables -t nat -A PREROUTING -i $EXT_IF -d 1.2.3.${i} \
      -j DNAT --to-destination 10.1.1.${i}

    iptables -t nat -A POSTROUTING -o $EXT_IF -s 10.1.1.${i} \
      -j SNAT --to-source 1.2.3.${i}
  done

if the addresses are non-contiguous--you would just need to modify the
construct of the for loop, but if the last octet doesn't match (or isn't
somehow logically related)--the above loses its value.

-j

--
"I'll be deep in the cold, cold ground before I recognize Missoura!"
        --The Simpsons

