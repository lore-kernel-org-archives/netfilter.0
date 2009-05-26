From: "George B." <georgeb@gmail.com>
Subject: Re: Policy NAT, pools etc. Is netfilter for me?
Date: Tue, 26 May 2009 00:21:45 -0700
Message-ID: <b65cae940905260021w25a242bcmf0b8f8a63ff6669@mail.gmail.com>
References: <b65cae940905252105r15910de6s99ec2538dc23066c@mail.gmail.com>
	 <b65cae940905252241u6aa2ddbcv70bde5b679b7fa7e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=/qV76Sbr2fWU9PRoy2uE2XgKzATdKk++9YXU9/r4bWc=;
        b=OtHA4TDJxtfkQR7yvjcQtgp4NueaeOIsvp3u9zb4aLPpM8tmIlzz0p44FBjUVaaPDF
         AiUXACXctRpL/nMHH4m4odBpdkmNKT1CYHU/JdVkQvjsi/dfFMp3PFMMGmxY5ZINLNmi
         lbWmarmFAwp8MdRgwbQiSPVQ0rfaBHq5Mqepc=
In-Reply-To: <b65cae940905252241u6aa2ddbcv70bde5b679b7fa7e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Ok, just found this in a recent list reply to a similar question:

>ip route add local <address>/<mask> table local dev <interface>

>This way <address>/<mask> will be considered local by the system which will reply to ARP requests for it, actually usable by any local process, but won't appear assigned to <interface> so >chances are that no local process will use it unless told explicitly.

So, it looks like this is a project worth spending lab time on.  I
tested the above on a Debian box under my desk at work and that worked
as far as responding to ARP.


See, here is the "thing" ... the NAT function is the most expensive
operation in my network.  I have one site where I have spent in excess
of $100K for hardware to simply perform outbound NAT functionality.
In most cases I have to buy hardware with a bazillion features I don't
use in order to get the NAT throughput that I do need.  When we got to
the point where we ran out of CPU on Cisco ASA 5550 units, I decided
there had to be a better (and less expensive) way. Even if I have to
spread things over several boxes, it would still come out cheaper than
a $80,000 load balancer or full featured firewall being used for
nothing but NAT. In that segment of the network a fully featured
firewall is overkill as the rule is very simple; NAT all connections
outbound, deny all connections inbound. In dollars per packet, NAT is
more expensive than firewalling, routing, or anything else in the
network.
