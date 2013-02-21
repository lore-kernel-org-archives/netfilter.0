From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: Bittorrent blocking
Date: Wed, 20 Feb 2013 21:58:46 -0500
Message-ID: <20130221025846.GA26649@cipherdyne.org>
References: <51249E58.1080307@stidia.com>
 <CACuyg2506HY+FudxuN4yaPKrOdetJ6M6ejv-bdL87916gtZgiQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACuyg2506HY+FudxuN4yaPKrOdetJ6M6ejv-bdL87916gtZgiQ@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1361415529;
	bh=0YQXZW2axmRKvAunUKW5JeOGd/Pq/W2i97+LpZcPUR8=;
	h=Received:Received:Received:Date:From:To:Subject:Message-ID:
	 MIME-Version:Content-Type;
	b=U4auQ/j3z0kng8Ay5B2CXtlVP7X0dOYFztd4Szx9icI94baHXerQi7Bems0U3TPsu
	 q2paz9lMlwlI5lucCISyDV9KmHusdCljipYOUAtSJmRIa+/h9asDmjg7hixsyNFrHQ
	 uyKCgoCSVN+XUos5SFq4qvuEXpFXVBZpUvMrlzp/1l7+QdC6va2DdlNYDlndsGsPNw
	 rxrOcdD2MXmwUCWwSrsIUqb3Wj2U9UfATnyFdjpL7JfSAVnsxNgbNXn9PZdgqOHO1T
	 hT4PojvVR56n7Kv0GzQY15Li+t516UjKUj1InW63riKsYD7VtJnR3lUYt1gj5qf2OT
	 r2npsgYO/gYuw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Feb 20, 2013, Humberto Juc? wrote:

> Hi,
> 
> I usually set a policy "default drop" - It's what I prefer.
> Keeping the range of high ports (UDP) closed, many P2P clients will crash.
> 
> There are alternatives like "l7filter" or "opendpi-netfilter for nDPI"
> but the processing cost can be quite high in larger networks.
> Particularly, it is something that i avoid doing.
> https://github.com/ewildgoose/ndpi-netfilter
> 
> The snort can help too. You can use a signature like this (local.rules):
> alert tcp $HOME_NET any -> $EXTERNAL_NET any (msg:"RST P2P BitTorrent
> transfer"; flow:to_server; content:"|13|BitTorrent protocol";
> depth:20; metadata:policy security-ips drop;
> classtype:policy-violation; sid:1000000; rev:4; resp:rst_all;)
> 
> In this example i set flexresp reaction, but the result is more
> efficient in "inline mode".

If you go the snort rule route, fwsnort can translates this to (after
removing the metadata keyword - need to update that):

-A FWSNORT_FORWARD -p tcp -m tcp -m string --hex-string
"|13426974546f7272656e742070726f746f636f6c|" --algo bm --to 84 -m
comment --comment "sid:1000000; msg:RST P2P BitTorrent transfer;
classtype:policy-violation; rev:4; FWS:1.6.3;" -j LOG --log-ip-options
--log-tcp-options --log-prefix "[1] REJ SID1000000 " 

-A FWSNORT_FORWARD -p tcp -m tcp -m string --hex-string
"|13426974546f7272656e742070726f746f636f6c|" --algo bm --to 84 -j REJECT
--reject-with tcp-reset 

The above rule is generated with the fwsnort --ipt-reject option if you
really want iptables to reset the connection.

--Mike


> 2013/2/20 Dmitry Korzhevin <dmitry.korzhevin@stidia.com>:
> > Hello,
> >
> > Guys, i understand, that this is too frequent question, and i'm already made
> > solid investigation in google, but.. mabe you already have good iptables
> > rules to block such type of traffic (Bittorrent), or maby you can give
> > advice.
> >
> > For now i use snort with bittorrent-related detection rules, but seems it is
> > not best solution.
> >
> >
> > Best Regards,
> > Dmitry
> >
> > ---
> > Dmitry KORZHEVIN
> > System Administrator
> > STIDIA S.A. - Luxembourg
> >
> > e: dmitry.korzhevin@stidia.com
> > m: +38 093 874 5453
> > w: http://www.stidia.com
> >
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
