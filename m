From: "John Guntenaar" <john@guntenaar.nl>
Subject: RE: per user IP adresses
Date: Tue, 6 May 2003 10:37:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c313aa$bb09b710$0200a8c0@WKSJOHN>
References: <1052178384.32510.67.camel@alpha.newkirk.us>
Reply-To: <john@guntenaar.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1052178384.32510.67.camel@alpha.newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Joel Newkirk' <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

Hi Joel,

Your LAN construction is exactly what I want, but I want that 1 of the 4
IPs can only bind to the 4th IP, but when I try any of your rules I get
errors :(

(And yes, I changed the real IP in 123.123.123.123 in here ;-))

jimbo:/var/www# iptables -A OUTPUT -p tcp -s 123.123.123.123/32 -m owner
! --uid-owner 1000 -j REJECT --reject-with tcp-reset
iptables: Invalid argument

jimbo:/var/www# iptables -A OUTPUT -p tcp --dport 6667 -m owner !
--uid-owner 1000 -j REJECT --reject-with tcp-reset
iptables: Invalid argument

jimbo:/var/www# iptables -A OUTPUT -p tcp --dport 194 -m owner !
--uid-owner \ 1235 -j REJECT --reject-with tcp-reset
iptables: Invalid argument

So what could be wrong?

Thanks,

John

-----Oorspronkelijk bericht-----
Van: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] Namens Joel Newkirk
Verzonden: dinsdag 6 mei 2003 1:46
Aan: john@guntenaar.nl
CC: netfilter@lists.netfilter.org
Onderwerp: Re: per user IP adresses

On Sun, 2003-05-04 at 14:38, John Guntenaar wrote:

I missed the start of this thread, so I backed up and reread it. :^)

> Hello,
> 
> I have a linux machine with 4 IP addresses, I have a couple of friends
> on that machine and I don't allow them to use IRC, so I simply blocked
> the IRC ports, but I want to use IRC from the 4th IP without the other
> users being able to use it. I think I can reach that goal by using the
> owner match facility of iptables, though I can't find any good
examples
> with google, is it correct and can somebody post an example?
> 
> Thanks in advantage,
> 
> John

You need something constructed like this:

iptables -A OUTPUT -p tcp --dport 194 -m owner ! --uid-owner \ 1235 -j
REJECT --reject-with tcp-reset

or:

iptables -A OUTPUT -p tcp --dport 194 -m owner --uid-owner  \ 1235 -j
ACCEPT

I use a similar rule to prevent any user except root from being able to
connect to my LAN computers from my server.  You can add an additional
match to either rule to match outgoing interface or sourceIP if needed.
Is it really necessary to restrict IRC to only that single IP?
 
j







