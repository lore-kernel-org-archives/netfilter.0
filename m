From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Re-route non-http traffic
Date: Mon, 01 Nov 2010 18:39:07 +1300
Message-ID: <4CCE527B.7000101@treenet.co.nz>
References: <AANLkTi=GvwtxOLtFH9444aqdudrkUbaPdYQ63ZrUTH2A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=GvwtxOLtFH9444aqdudrkUbaPdYQ63ZrUTH2A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Pipca <robertpipca@gmail.com>
Cc: netfilter@vger.kernel.org

On 01/11/10 15:51, Robert Pipca wrote:
> Hi,
>
> I'm using squid as a webcache in bridge-mode.
>
> I use ebtables on tcp/80 to get the http traffic.
>
> The thing is: this is an ISP, so some clients are companies that use
> tcp/80 to non-http traffic (proprietary protocols mostly, eg.
> biometric identification machines on a medical institution, for
> instance).
>
> So my question is: Since I can know what's the dst IP when the
> connection arrives on netfilter, can I do something like:
>
> "redirect this to the squid port, but save the destination IP".
>
> If squid sees this is not http-traffic, sends the connection to _that_
> saved destination IP...and everybody is happy.
>
> Is it possible currently?  Or is some coding necessary? We can help with that..
>

That is not possible at all. No "currently" about it.

You have to detect and bypass the connections before attempting to 
redirect to Squid. Once the first identifiable byte of non-HTTP hits 
Squid the TCP setup packets are already long gone. Depending on the data 
up to 64KB may also have already flowed through the connection.

AYJ
