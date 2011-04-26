From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forward Rule, Client access only specific ip's, rest of world
 access client unrestricted.
Date: Tue, 26 Apr 2011 11:05:55 -0500
Message-ID: <4DB6ED63.6040502@riverviewtech.net>
References: <000501cc040b$e0151090$a03f31b0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000501cc040b$e0151090$a03f31b0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/26/11 07:17, Becskei Robert wrote:
> I have a problem here, I have a client, which should only be able to access
> a few ip's and not the rest. But the rest of my network should be allowed to
> access this client unrestricted (that is if they initiate the connection).
...
> What I want is :
> - Client should be able to only access a few selected ip's (see above)
> - Client should not be able to access anything else
> - BUT! If someone from the network initiates a connection to the client, be
> it ping, vnc, or whatever it should be allowed ( I don't know how to do
> this)

This should be possible and relatively easy to do.

> If someone can please help me :) . Thank you

You are asking for stateful packet inspection, just like you are 
probably using to filter traffic coming back in from the internet.

Try adding a rule like the following somewhere before your DROP rule.

iptables -A FORWARD -s 192.168.220.28 -m state --state 
ESTABLISHED,RELATED -j ACCEPT

This will allow reply traffic back out while still allowing you to 
control everything else like you are wanting to do.



Grant. . . .
