From: "Sebastian R." <tengaman@wolke7.net>
Subject: But how then does a transparent proxy works?
Date: Sat, 21 Feb 2009 12:59:59 +0100
Message-ID: <20090221115959.GA2531@localhost>
References: <20090221002718.GA3922@localhost> <bf0e93a30902202011t7391fe73v31017baf89f83bdf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bf0e93a30902202011t7391fe73v31017baf89f83bdf@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jorge =?iso-8859-1?Q?D=E1vila?= <jorgedavilalopez@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks,

but I still don't understand how this makes any sense whith regards to
a transparent proxy configuration.
From the tutorial:
>Locally generated packets are mapped to the 127.0.0.1 address. In other
>words, this rewrites the destination address to our own host for packets
>that are forwarded, or something alike.
>iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
The proxy couldn't tell where the package was destined for, if the
destination address was mapped to 127.0.0.1.


Thanks for your time

Sebastian R.
