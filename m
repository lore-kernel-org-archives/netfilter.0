From: Sascha Frey <sf@techfak.net>
Subject: Re: conntrackd: inject-add2: Invalid argument
Date: Mon, 14 Jul 2014 10:34:54 +0200
Message-ID: <20140714083454.GA4109@TechFak.Uni-Bielefeld.DE>
References: <20140710150006.GB9616@TechFak.Uni-Bielefeld.DE>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140710150006.GB9616@TechFak.Uni-Bielefeld.DE>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Sascha Frey wrote:

[...]
>Both machines run Debian Wheezy with backports kernel
>(3.14.7-1~bpo70+1) and conntrackd (1.2.1-1).

I built conntrack-tools 1.4.2 from source including all the necessary
libraries (libmnl-1.0.3, libnetfilter_conntrack-1.0.4,
libnetfilter_cthelper-1.0.0, libnetfilter_cttimeout-1.0.0,
libnetfilter_queue-1.0.2, libnfnetlink-1.0.1).

Unfortunately, I get the same errors with 1.4.2 when external cache is
disabled.
