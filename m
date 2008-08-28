From: "James King" <t.james.king@gmail.com>
Subject: Re: Connecting an host with a subnet to a LAN with different subnet
Date: Thu, 28 Aug 2008 14:04:55 -0700
Message-ID: <38bcb3ec0808281404y63f25610ya3c80c74209d954c@mail.gmail.com>
References: <Pine.LNX.4.58.0808271159550.3508@bolt.sonic.net>
	 <F1F6EC0C8B75034F9E3A79FC85122E8E01000E1E@aquib01a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Mq9m2jMzgZOy607ji9atGAQDnY461zKg4wNFxUeFJv0=;
        b=tmd5k2kT/ElFvjCP2OQ4p8LCXENVDKun07XM5JBeMpk3FePZzW7HSgldtgX2DnA+V9
         pmDM+kLxC4C+uqw1+TC6jQKrzUY7YDHyPMw84GrOhwhXAFt2gJ+EoDr6yahjE9IezOhs
         40zpsQbRzv3pzTZNmaNzj9UZfnM8/A0ncH6o8=
In-Reply-To: <F1F6EC0C8B75034F9E3A79FC85122E8E01000E1E@aquib01a>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: DI BACCO ANTONIO - technolabs <Antonio.DiBacco@technolabs.it>
Cc: bsilva <bsilva@sonic.net>, netfilter@vger.kernel.org

On Thu, Aug 28, 2008 at 12:10 AM, DI BACCO ANTONIO - technolabs
<Antonio.DiBacco@technolabs.it> wrote:
> This can be a good solution but my problem is that PLUTO cannot have the 192.168.0.x address at all.

Then your only other option is to add a secondary IP address in the
10.10.10.0/24 subnet on the router for the 192.168.0.0/24 subnet.  You
need to have at least one device numbered in both subnets (although
not necessarily on the same physical interface) in order to route
packets between them.
