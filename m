From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Sun, 28 Nov 2010 20:50:48 -0600
Message-ID: <20101129025048.GQ23013@cardinal>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org> <72283C9ECA07450499E7F3DDA655791F@gericomfx5600>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <72283C9ECA07450499E7F3DDA655791F@gericomfx5600>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Nov 28, 2010 at 10:31:24PM +0100, Secure-SIP-Server wrote:
> @ Pascal Hambourg
>
>> > I'm suffering on a Denial-of-Service attack on my SIP(VoIP) UDP 
>> > port 5060, getting more then 70 REGISTER requests per second 
>> > since yesterday. All comming from the Japanese IP 
>> > 59.146.75.111:5088.
>> [...]
>> > How can this requests (UDP) be from a ESTABLISHED connection??? 
>> > They passed the firewall in the first two examples and therefore 
>> > they must be ESTABLISHED!?!
>>
>> UDP being connectionless by nature, the notion of "UDP connection" 
>> is rather loose. Therefore a continuous flow of packets with the 
>> same ports and addresses can be considered as one sigle connection 
>> even if they are actually unrelated requests.

This is the problem I too am having in trying to block SIP attacks, 
which I posted about ever so long ago, back in 2010 November: 

http://www.spinics.net/lists/netfilter/msg49598.html

The brute forcing generally seems to come with the same --sport, and 
since my Asterisk had replied with SIP rejections to the first few, 
it's ESTABLISHED.

Since that post, however, I have seen a few of these being detected 
and blocked, which makes me think there might be multiple attack bots 
(different code and owners) in the wild.

I think that the -m recent approach is not enough. We might also need 
something with -m limit. At this point I don't know enough about SIP 
and how it works, but I'm guessing that the SIP dialogue for a 
successful call is relatively short, so a --limit of 20 packets or so 
might help, preceding any --ctstate ESTABLISHED,RELATED -j ACCEPT 
rule, of course.

The bulk of a SIP call would be the RTP, which would be on ports 
other than 5060, in --ctstate RELATED (courtesy of the 
nf_conntrack_sip module.)

> Yes, looks like. I discovered that this only happens if I add the 
> FW-rule later then the first connection of the attacker to my 
> SIP-server happened. When I install the rule to DROP this requests 
> behind
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> I must reboot the server before it works. If I don't want to reboot 
> I must put the DROP rule before this rule.

Reboot is never necessary for this, unless you did something foolish 
with your kernel (built-in rather than modules?) See conntrack(8), 
and even without conntrack you can simply flush your rules, set all 
policies to ACCEPT, and remove the modules.

>> > Is there a way to tell iptables to lock only a specific IP:PORT 
>> > for a while if this IP transmits more then 50 requests per 
>> > second? If so, how?
>>
>> Check the "recent" match. Be sure you read carefully the man page 
>> about its default limits.
>
> Thanks for this!!! But ...
> The author of "recent" writes:
> "If the '--update' rule is before this check for ! NEW,INVALID 
> packets then ESTABLISHED connection or those in the process of 
> becoming ESTABLISHED could be disrupted by a malicious person who 
> can modify his/her source address."
> So in his opinion my
> iptables -A INPUT -p udp --dport 5060 -m recent --update --seconds
> 1 --hitcount 20 -j DROP
> must come behind
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> and this leads me to the problem from above. This ACCEPT rule lets 
> pass all packages, because the first 19 packets in the first second 
> are accepted and therefore the FW considers the continuous flow of 
> packets with the same port and address as a single connection - and 
> let them pass here.
>
> Is there a way to tell the FW that this continuous flow of packets 
> is not to be considered a ESTABLISHED connection?

We precede the ESTABLISHED --> ACCEPT rule with something to handle 
SIP specially. Ugly, but probably the only choice.

> ----------
> @marcos
>
>> i had the same trouble in the past , and beyond the rules for your 
>> FW on itself there is " other consideration" to get on mind , all 
>> people that are trying to steal Voip deploy you "brute force 
>> attack" first trying with few packets, then if they were not 
>> blocked , the real attacks begins later .  because don't have any 
>> sense keep attack to a blocked server, thay are bad no dummies .

This fits with my experience as well, but don't count on it always 
being like this. Remember, the vast majority of these attack bots are 
operating from stolen resources (compromised systems.) It doesn't 
matter to them if they waste those resources, because the bots are 
out there continually working to steal more.

That's why abuse reports might still be worth the trouble. If the 
REAL owners of the attacking machines are alerted to the problem, 
they might take action to fix it. At least in a small portion of 
cases, don't get your hopes up.

>> so the speed with you blocks these tries are so critical and will 
>> defines to your intruder how effective is the defense that you 
>> have.
>>
>> So will be so helpfull install some script that inspect your logs 
>> to detect the intrusion attack , i have very well result with 
>> FAIL2BABN, [...]
>
> Thank you for this idea and your other considerations!!!

I have complaints with fail2ban. Yes, I know it works, and it's 
simple, but it doesn't feel like the right approach to me. Why do we 
need another daemon running to scan log files? Logs are for humans. 
I'd like to see network services with the ability to trigger external 
events when they're under attack.

Failing that, -m recent is pretty effective, but in the case of SIP, 
apparently not quite enough. (It works very well for SSH.)
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
