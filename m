From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Re-route non-http traffic
Date: Mon, 01 Nov 2010 10:03:46 -0500
Message-ID: <4CCED6D2.5090808@riverviewtech.net>
References: <AANLkTi=GvwtxOLtFH9444aqdudrkUbaPdYQ63ZrUTH2A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=GvwtxOLtFH9444aqdudrkUbaPdYQ63ZrUTH2A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: robertpipca@gmail.com

On 10/31/10 21:51, Robert Pipca wrote:
> If squid sees this is not http-traffic, sends the connection to 
> _that_ saved destination IP...and everybody is happy.
> 
> Is it possible currently? Or is some coding necessary? We can help 
> with that..

Can you not exclude specific destination IPs from the redirection to 
Squid (before the redirect even happens)?



Grant. . . .
