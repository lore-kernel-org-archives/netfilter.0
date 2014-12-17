From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: Bridging / VLANs / ebtables
Date: Tue, 16 Dec 2014 21:55:14 -0500
Message-ID: <20141217025514.GW967@titan.lakedaemon.net>
References: <4829673.301498.1418414563731.JavaMail.root@rockbochs.com>
 <12631645.301499.1418414592170.JavaMail.root@rockbochs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lakedaemon.net;
	s=mail; t=1418784914;
	bh=n51F4xtvgD7Z409J8CRit0E6wWGj3ZcI/R7S0pAh17w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Ya/dqiG76Gh4+DgRbs2prorsu2zR/7T25nql+Pe90kGMp65Oc0X3duPBE5ISUrDX8
	 mXE6hulXkbfLgzorroR17opIv1W/qmhhyj3Gogr1EcLBzlCu7obgONSytW9DF8/I2c
	 pMfMIqPqaBcRn7nL0GXIwkKLTM+0DS7GdBTLC/Q4cB5qcs/vP2v7HNO+Bse/uK+dZF
	 594s8S6AYvuQpmysl/YyPBDVjE8cNYcJ2DV+Xaue399XSGvTJoH9uyww1Rde7GtVXM
	 iK8TCFsrZFp7aq0b2jtW22tx9Pwi+h7rlpSrJYblcRiohwwzhj4mCuyTvfJ9n9ye8G
	 tqN2R5zlJcdOQ==
Content-Disposition: inline
In-Reply-To: <12631645.301499.1418414592170.JavaMail.root@rockbochs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Nelson <tnelson@rockbochs.com>
Cc: netfilter@vger.kernel.org

Tim,

Ah crap.  I should've read the OP first.  Definitely some scenario lost
in quote-trimming...

On Fri, Dec 12, 2014 at 02:03:12PM -0600, Tim Nelson wrote:
> Greetings-
> 
> I have an interesting situation that requires bridging some VLAN
> enabled interfaces together on a Debian 7.x x86 system. On the host,
> there is a single physical interface passing traffic natively (eth0),
> and two tagged VLANs also passing traffic (eth0.2 and eth0.3).
> 
> The use case is that I need to bridge eth0 with eth0.2, allowing layer
> two traffic to pass seamlessly between interfaces, and still leave
> eth0.3 in a usable state. The switch this system is connected to is
> outside of my control, which is the reason for the odd network setup.
> 
> What I'm finding by simply creating a new bridge br0 with members eth0
> and eth0.2 is no connectivity on eth0.2, and slow/quirky connectivity
> on eth0 (native connectivity to Debian 7.x host). 

This sounds a bit like an IP address / routing rule conflict.  Did you
set eth0 and eth0.2 0.0.0.0 and promiscuous?  Did you assign one IP
address to the bridge?  Would you mind sending the output of:

# ip addr show

and

# route -n

?

> It has been suggested to use ebtables to filter the VLANs from the
> eth0 interface on the bridge, yet allow operation to the system
> interface eth0.2/eth0.3. I found a very specific reference on the
> ebtables site for this scenario [1], usage suggested (modified to fit
> my environment):
> 
> ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 3 -j DROP
> ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 2 -j DROP
> 
> If my understanding of the ebtables usage as a brouter, and the
> kernel's interaction between all components involved, this should
> work. However, as noted, no change in operation is observed.

Yes, based on your description of the network you are going to need the
above rules.

thx,

Jason.
