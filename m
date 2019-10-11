From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: nft -- documentation on fib_addrtype missing
Date: Fri, 11 Oct 2019 14:15:53 +1100
Message-ID: <87r23kx992.fsf@goll.lan>
References: <37a942dc-dff2-d087-3455-78565e290050@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> writes:

> My follow-on project is to describe how to implement the
> recommendations in BCP-38 using IP-ROUTE and NFTABLES.

I can't comment on your fib issue.
However, BCP 38 (RFC 2827):

  Network Ingress Filtering: Defeating Denial of Service Attacks which
  employ IP Source Address Spoofing

For which see rp_filter in sysctl:

    http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.kernel.rpf.html

This works great if you have symmetric routes.
If you have triangular routes, it will do the Wrong Thing.

It also (mostly) isn't useful on servers, where all traffic arrives on a
single interface.

I've also had blackhole routes since forever, assuming (but never
actually checking) that they help rp_filter to do its job.

    iface lo inet loopback
      # Until I think of a better place, add blackhole routes when the
      # loopback interface comes up.  These ensure (unused) private IP
      # ranges aren't accidentally sent to the internet.  Note that even
      # without this, Internode filters outbound packets to private IPs.
      #
      # We also do the same for our /24s, so that if a subnet of them
      # ever lacks a route, packets to that subnet won't be routed to
      # the internet.
      up   ip route   add   blackhole 10/8
      up   ip route   add   blackhole 172.16/12
      up   ip route   add   blackhole 192.168/16
      up   ip route   add   blackhole 169.254/16
      up   ip route   add   blackhole 203.7.155/24
      up   ip route   add   blackhole 203.27.58/24
      down ip route   flush type blackhole

