From: "Edwin van den Oosterkamp" <edwin@vandenoosterkamp.com>
Subject: Re: Outbound traffic over two interfaces by port number
Date: Mon, 21 Jun 2010 16:03:35 +0100
Message-ID: <3b2642806070953b616d88c15bda7f97.squirrel@edders.homeip.net>
References: <7628f5b45c96214fccdfcf03e8440ed2.squirrel@edders.homeip.net>
    <4C1F6CF4.8080706@kickstone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C1F6CF4.8080706@kickstone.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello John,

Thank you for your answer - that was an option I had not thought of, so
I'm going to investigate..

One other issue I just realised with this setup has to do with ARP. Is it
possible to ensure that control-connection related ARP requests only get
onto the control network interface and data-connection related requests
only get sent on the data network interface? Especially with the two
networks having an overlapping IP range I need to ensure that the request
goes out on the correct network interface.

Best regards,

Edwin

On Mon, June 21, 2010 14:45, John Lister wrote:
> You might try looking at connection/packet marking.
>
> John
>


