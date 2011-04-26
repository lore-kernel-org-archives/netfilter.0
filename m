From: "Becskei Robert" <robert@capriolo.com>
Subject: RE: Forward Rule, Client access only specific ip's, rest of world access client unrestricted.
Date: Tue, 26 Apr 2011 22:03:17 +0200
Message-ID: <000501cc044c$fc592cf0$f50b86d0$@com>
References: <000501cc040b$e0151090$a03f31b0$@com> <4DB6ED63.6040502@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB6ED63.6040502@riverviewtech.net>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Grant Taylor' <gtaylor@riverviewtech.net>
Cc: netfilter@vger.kernel.org

Thank you very much Grant!,

I've did it like this :

iptables -A FORWARD -s 192.168.220.10 -d 192.168.200.200 -j ACCEPT
iptables -A FORWARD -s 192.168.220.10 -m state --state ESTABLISHED,RELATED
-j ACCEPT
iptables -A FORWARD -s 192.168.220.10 -j DROP

Trough OpenVPN the device connected (192.168.220.10) , I was able to access
192.168.200.200 from the device a webpage, then when I've
Tried to access 192.168.205.15 another webpage it timed out , probably drop.

Then I've tried to ping device from 192.168.200.200 , it worked.
Then I've tried to ping device from 192.168.201.195 , it worked.

I'm only writing this back, because I'm double / triple checking that I've
did it the right way. 

Sincerely
Robert 



-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Grant Taylor
Sent: Tuesday, April 26, 2011 18:06
To: Mail List - Netfilter
Subject: Re: Forward Rule, Client access only specific ip's, rest of world
access client unrestricted.

On 04/26/11 07:17, Becskei Robert wrote:
> I have a problem here, I have a client, which should only be able to
access
> a few ip's and not the rest. But the rest of my network should be allowed
to
> access this client unrestricted (that is if they initiate the connection).
...
> What I want is :
> - Client should be able to only access a few selected ip's (see above)
> - Client should not be able to access anything else
> - BUT! If someone from the network initiates a connection to the client,
be
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
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

