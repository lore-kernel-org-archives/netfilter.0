From: Yann Lejeune <yann.lejeune+lartc@gmail.com>
Subject: Re: Routing the DNS Traffic via specific interface.
Date: Wed, 25 Jan 2012 09:41:12 +0100
Message-ID: <CAG5mEj_-O8cw_WXf+GZKJtfb6AXZo2YKmiHtbmK1x5Z0QY_WAg@mail.gmail.com>
References: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=KXHxolavKPIsu5bTFi5XwELCciK+pZMOxVNV6TvthEg=;
        b=dQhRWGy5EBZGWmqR9wKzoCb1LTZkUEVtEkpBWGVohvxxXRKXbcpwKxXKIAwBWAajZr
         MWusXRV22BFmzbZOgjNcj4lHDAiXpiJugpovVkaWRxgtMWOJzk1wAN2LhCx9rTDYERJD
         EzmnpTT6L6JjCt4Q+1uJ95ZsMs4KG4obvMiKQ=
In-Reply-To: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netravali Ganesh <gnetravali@sonusnet.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 25 January 2012 08:41, Netravali Ganesh <gnetravali@sonusnet.com> wrote:
> I have 2 interfaces eth0 and eth1 on the system connected to different subnets. I need to route all the outgoing DNS traffic of the system via eth1 interface. Pls let me know if below IPTABLES rules is proper way ?
>

Hi,
the "iptables -A FORWARD" authorizes or denies traffic only. There is
no impact on the routing of your traffic.

You want to perform a "policy based routing". Your policy is "All
UDP/53 traffic must use eth1 as outgoing interface". To achieve this,
have a look to iproute and the LARTC guide
    http://lartc.org/howto/
    http://lartc.linuxsystems.it/index.php/Main_Page

Regards,
			Yann.
