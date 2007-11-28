From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blocking web-based proxy traffic
Date: Wed, 28 Nov 2007 14:35:38 -0600
Message-ID: <474DD11A.4020209@riverviewtech.net>
References: <C3731AB4.2210%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C3731AB4.2210%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/28/07 14:16, James Lay wrote:
> The latter ;)  Keeping the people on the inside from being naughty. 
> One of my clients doesn't want a proxy server installed....I would 
> normally just use squid and squidguard and be done with it, but 
> that's not an option.  So baring using Snort to do it (somehow) I was 
> thinking netfilter/iptables to match strings on port 80 for "http". 
> Hope that explains it better.

Ok.  Aside from needing to use a Clue-by-4 on your client, you are 
headed down an ok track.

Be aware that you are looking for ASCII text that is recognizable as a 
prohibited site.  If you do use IPTables to do your matches, you will 
either be able to DROP, REJECT, or DNAT (redirect) the traffic.  The 
first option is not graceful at all as it will leave clients in a time 
out condition while the second option will probably more gracefully 
fail.  The preferred option would be to DNAT (redirect) the traffic to a 
mini web server that will serve up a generic web page indicating that 
the access has been blocked.

I suppose that you can use layer 7 string matching to look for the 
prohibited URL in the the real get string.  However if there is any 
obfuscation being used, even simple URL encoding using %## the chances 
of detecting the traffic is slim.  This is why you should really look in 
to some sort of content filtering solution.

Would you be able to install something like DansGuardian and tell your 
client that it is a filter not a proxy and use that?  Of course to use 
DansGuardian, you do have to have a proxy for DG to talk to.



Grant. . . .
