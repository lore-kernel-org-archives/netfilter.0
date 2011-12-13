From: Andrew Beverley <andy@andybev.com>
Subject: Re: prio + policing filter on ingress?
Date: Tue, 13 Dec 2011 18:25:24 +0000
Message-ID: <1323800724.1995.58.camel@andybev-desktop>
References: <op.v6dujdvsx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1323800729;
	bh=SzJfcclle/7bvBDkDnGvqlq4AaEZh1mu1E3BljTSiww=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=E3HY3Yn2qZHI9jjOehSJGOLVoaEOm95kpNCYyHb6TwiVTJXD0vNX+bGEjK5LPhf9b
	 maXYiQLP2zW8z6IBPoGkKuTfHHPiBMn7hA8XEx81A2QHKTwUO5RGplEPB6aVB9pGF5
	 9XHK5Qr82/IC5HqcioKmSHuQ3W7CZPJbCRpQfGaU=
In-Reply-To: <op.v6dujdvsx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Mon, 2011-12-12 at 09:27 -0600, Lloyd Standish wrote:
> Hello All,
> 
> I would like to police traffic (bandwidth-limit with drop) on ingress
>  of an outward-facing interface, but I would also like to make sure
>  that inbound traffic destined for a certain IP is dropped *before*
>  traffic to the other IPs.  I think I can do this by combining a prio
>  qdisc with a policing filter via ifb.  I have never seen an example of
>  this; I don't know whether or not it's possible.
> 
> All I have so far is the ingress prio qdisc.  I don't know how to add
>  the policing filter to it.  (I wonder if I would have to add a
>  policing filter to each of the prio's bands.  In that case I could not
>  limit the total bandwidth of the interface.)
> 
> eth0 is the inbound interface.
> 
> tc qdisc add dev eth0 ingress
> tc qdisc add dev ifb0 root handle 1: prio default 1
> tc qdisc add dev ifb0 parent 1:1 sfq perturb 10 limit 3000
> tc qdisc add dev ifb0 parent 1:2 sfq perturb 10
> tc qdisc add dev ifb0 parent 1:3 sfq perturb 10
> 
> # filters to put packets in different prio bands, only 2 are shown.
> 
> # DNS
> tc filter add dev ifb0 protocol ip parent 1: prio 1 u32 match ip sport 53 0xffff flowid 1:1
> # http
> tc filter add dev ifb0 protocol ip parent 1: prio 3 u32 match ip sport 80 0xffff flowid 1:2
> 
> # put traffic to LAN IP 192.168.0.5 in the lowest priority prio band
> tc filter add dev ifb0 parent 1: protocol ip prio 2 u32 match ip dst 192.168.0.5 flowid 1:3
> 
> # all unfiltered traffic goes to prio band 2
> tc filter add dev ifb0 parent 1: protocol ip prio 4 u32 match ip dst 0.0.0.0/0 flowid 1:2
> 
> #
> ## how to add a policing filter to limit the bandwidth of the entire interface, and drop extra bandwidth from prio band 3 first?
> #
> tc filter add dev eth0 parent ffff: protocol ip prio 1 u32 match ip dst 0.0.0.0/0 flowid :1 \
>    action mirred egress redirect dev ifb0

Interesting case, which I think you've made a good start at. I don't
have the textbook answer for you, but a couple of thoughts (I don't know
whether these will necessarily work):

- Could you do the policing by attaching an ingress qdisc to eth0 (in
addition to the above rules)?

- Could you set up another IFB device (that receives the same traffic)
with a policer attached to it?

- Could you do some sort of parent/child set up, such as a PRIO as the
child of a HTB, so that the parent does the policing and the PRIO does
the priority (although having just read the Traffic Control HOWTO you
may not be able to do this because you cannot have differing types of
qdiscs within each other).

Andy


