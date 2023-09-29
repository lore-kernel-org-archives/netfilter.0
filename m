From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Detecting socks5 frames on server side
Date: Fri, 29 Sep 2023 17:33:26 +0100
Message-ID: <20230929173326.aec3c633205f36fb4038b4f1@plushkava.net>
References: <1a260552-0b2e-4732-87c3-ce2bd75ff827@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1696005209; x=1696091609; bh=+VfQ7R4Geod9Vmu8z8wEPjV0K
        Rp7UPpYQukVxcPfm2A=; b=IHaAdSQu1OkD91Vu8izAvJanR+YZ7pLrMVVCwTNi6
        nB/SmkapbtM+vbd4IVt4l/wEACpYwz1mJhyvWKK+OJvrmEL7qCnFShyPH+H3qgTo
        KMG6P4rDTB0i2IJtJQqjQoOcCcrhCuZkzreNLC6bjFMngKhWrZctRxVFcYGX5Qms
        2e+NrZbazI9ZD+8AlfxqGsJeXVHo9ScHhszOS0dwAshTKJToE+NPoc6fAOc73ndv
        MwANg9fHFgvL1FBhpI8lkknaFr7lG1y7k64zzqcOzl9FtRsThmWq6fGi/EN6+XD8
        FX7gUaonmptzCXECHflszRTpLhJgofpq/c8AQhYKgA5nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1696005209; x=1696091609; bh=+VfQ7R4Geod9Vmu8z8wEPjV0KRp7UPpYQuk
        VxcPfm2A=; b=HZe6go9YQORxuuZAlW9gjv9lrtRuTsfgerSzroJcYnD25E0uHOv
        ESEalJSwOC6W4lVlz7jjjeUcWBhJAKdUJICU8h0HgjQlkjBn/n9But/UEpIXAYsI
        vvYjSVJbSqtN1IRScDS0jzmS1o6RfzrXsmUDwV+xIaVZwbQe9jPHGD2TluVdO/eJ
        LCEqYM5mnjwpWFZKSa3pcN7RDRDVty31XJcOJ2nzSQltYbs2lqAhZKO8GiYzoeYe
        E3J87ik35pxc31KCCt3olMvkeNw/T7ofivlSn3C7+UnhvtS+Fno/CLF07Swqq972
        lzhis8TgoQefcWP2yyt2I//DnmLbBw1B91A==
In-Reply-To: <1a260552-0b2e-4732-87c3-ce2bd75ff827@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: List Support <list@tootai.net>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Thu, 28 Sep 2023 18:35:33 +0200
List Support <list@tootai.net> wrote:

> Hello,
> 
> ist it possible on *socks server side* to identify frames coming using 
> socks5 ?
> 
> Set up is
> 
> , WorkStation browser set to socks5 localhost:1080 =>
> . ssh DynamicForward *:1080 to server =>
> . server with multiple ipv6 IPs and nftables will
> output to 80/443/8080 to Internet
> 
> Idea being to snat ipv6 addr depending on visited host or source Workstation

Initially, I wondered whether matching against the sshd.service group on a systemd-based distribution might be useful.

table inet filter {
	chain output {
		type filter hook output priority filter; policy accept;
		socket cgroupv2 level 2 "system.slice/sshd.service" tcp dport { 80, 443, 1080 } log
	}
}

Unfortunately, it isn't. A probable reason for this is that sshd(8) implements privilege separation by forking off a new instance of sshd(8) in the name of the connecting user.

Running sshd(8) in a dedicated network namespace could make for an idea worth exploring, though I don't think that doing so would address all of your requirements.

-- 
Kerin Millar
