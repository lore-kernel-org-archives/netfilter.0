From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Regarding iptable rules for SNAT
Date: Tue, 18 Oct 2011 10:08:46 +0200
Message-ID: <20111018100846.2fd2f0b7@catus>
References: <CADAe=+Lo46K956EAdtBchVUPkLs-aLoDk7p8HGC5-Bd4PGKy3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADAe=+Lo46K956EAdtBchVUPkLs-aLoDk7p8HGC5-Bd4PGKy3Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ajith Adapa <adapa.ajith@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

>Ideal cases once the reply comes back GW has to send it to the host H1
>right ?
>Sorry if I am wrong or missed any steps down here ?

Please send output of following command:
sudo iptables-save -t filter

I bet you're filtering traffic destined to H1 from eth1 in FORWARD
chain of filter table.

Best regards,
Marek Kierdelewicz
