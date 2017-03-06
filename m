From: Robert White <rwhite@pobox.com>
Subject: Re: iptables ip tracking buffer size?
Date: Mon, 6 Mar 2017 20:30:14 +0000
Message-ID: <e9d24023-89a0-2704-5ec3-e6c2b1b9ac2d@pobox.com>
References: <CAJV-0PdPVVBbMR+HcE5mjjkuKquR60c-n=D3b6N_j_+HK6wx6w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJV-0PdPVVBbMR+HcE5mjjkuKquR60c-n=D3b6N_j_+HK6wx6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew Sims <matt@simsweb.org>, netfilter@vger.kernel.org

On 03/03/17 18:20, Matthew Sims wrote:
> Quick backstory. I recently took over an unused project from a co-worker
> who left over a year ago. The idea was to block IPs that reached a certain
> hit_count limit within a minute.

You don't need "a project" you just need the "recent" match and a branch 
chain.

Consider this set of rules for throttling SSH attempts to five per hour.


iptables --new-chain SSHTHROTTLE

iptables --append SSHTHROTTLE --match recent --name bad_actors --update 
--seconds 86400 --jump DROP

iptables --append SSHTHROTTLE --match hashlimit --hashlimit-name 
ssh_throttle --hashlimit-upto 5/hour --hashlimit-mode srcip 
--hashlimit-burst 2 --jump ACCEPT

iptables --append SSHTHROTTLE --match recent --name bad_actors --set 
--jump DROP

iptables --append INPUT --in-interface ext+ --proto tcp --match 
conntrack --ctstate NEW --dport 22 --syn --jump SSHTHROTTLE


So the core thing is the three rules in the SSHTHROTTLE chain. How does 
it do what you want?

In the _last_ rule of the chain, the source ip address is added to the 
"bad_actors" set and the packet is dropped.

In the first rule the "--match recent" with "--update" is only true if 
the packet's source ip address is already in the "bad_actors" set. So it 
only does the DROP if some previous pass through the chain got all the 
way to the end of the chain.

So the middle rule, the hashlimit rule will ACCEPT up to five attempts 
an hour. Since "ACCEPT" stops the chain evaluation the "hashlimit" 
allows up to five connections an hour. So as long as the client never 
does six or more an hour he's fine.

Now back to that first rule. The --seconds value (one day in this case) 
acts as a grace period. If the bad actor goes away for a day then the 
match will miss and they can proceed with a new connection. Since the 
recent match is less than the penalty time they are forgiven their past 
sins and they are back to five connections an hour.

NOTE: using "-j RETURN" instead of "-j ACCEPT" will make this logic work 
without actually accepting the packet, so you can have this kind of gate 
without the gate needing to be the point of authorization. By that I 
mean that the throttling doesn't have to be tied to the details of the rule.

So playing around with timing and other parameters, and using other 
conditions on the call rule can let one gate/throttle be part of many 
sequences without making things hard.

You need one chain per throttle group, but you can have lots of 
different throttles by using different names in the recent and 
[hash]limit stanzas.

Eventually you will hit limits if you've got thousands of entries in the 
limits and whatnot because memory is a finite resource.

But you don't need complex code or any kind of external program to pull 
off these throttles.
