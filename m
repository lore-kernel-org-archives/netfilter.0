From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: are these enough now?
Date: Fri, 4 Oct 2002 10:47:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210040947.g949lgL10535@vulcan.rissington.net>
References: <200210041218.26636@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210041218.26636@.>
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
To: netfilter@lists.netfilter.org

On Friday 04 October 2002 8:17 am, PayalR wrote:

> Hello,
> I am providing webspace, email services etc. to few institutes. I have
> drafted a firewall policy for my server. Can you please check if it is
> right and tell me if I have gone wrong anywhere? I have formulated
> suggestion by various list-members in past.
>
> The script contains,
>
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

I assume the services are actually running on the same machine as netfilter - 
this is not a routing firewall sitting in front of the real server/s ?

> iptables -A INPUT -i eth0 -p $proto --dport $port -j ACCEPT
> To keep the script short in this e-mail I am replacing $proto with tcp and
> udp in each line of the actual script.
> $port is replaced by,
> 21, 22, 23, 25, 53, 80, 110,143, 161, 162, 199, 953, ,993,3306, 8007, 8009

21 - ftp - okay
22 - ssh - good
23 - telenet - ugh !   Why ???
25 - smtp - fine
53 - dns - only one in this list I can see which needs UDP as well TCP
80 - http - okay
110 - pop3 - yup
143 - imap - yup
161 - snmp - are you managing this system from elsewhere, or is this machine 
the snmp monitor ?   UDP 161 only needs to be inbound if this machine is 
being monitored from elsewhere
162 - snmptrap - again, are you managing this from elsewhere, or is this 
machine managing others ?   UDP 162 only needs to be inbound if this is the 
monitoring machine
I don't immediately recognise any of the higher port numbers so won't coment 
on those.

> We are SNNP client, so I think I need 161 and 162 open, right?

SNMP ?   Yes :-)   But check the direction.   UDP 161 is inbound to machines 
being monitored, outbound from machines being monitored.   UDP 162 is the 
other way round.

> Also, nmap shows that 2002/udp globe is open. Shall I close it?

Suggest you close the port, and also check very carefully to see if your 
machine already has the Slapper worm on it, since that opens UDP port 2002 to 
provide remote access to a root command shell on your system :-)

>
> So for e.g each line will actually look like this in the script,
> iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 25 -j ACCEPT
>
> I understand that ACCEPT for udp for 21, 22, 23, 80, 3306 is not required.
> I just wanted to confirm this from the list.

That is correct, also for 25, 110, 143 and maybe some of your higher ports as 
well.   I recommend you do create separate lists for TCP and UDP because very 
few things (DNA 53 is the only common example) need both.

> Also, I want to know if I should put the same rules for OUTPUT? Shall I
> just copy the above rules and replace INPUT with OUTPUT in them?

I would recommend setting your OUTPUT chain to ESTABLISHED,RELATED and then 
add any rules for traffic which is supposed to originate on your server (such 
as DNS queries).

> Also, do I set FORWARD to DROP?

Yes, if this machine is not supposed to forward packets between other systems.

> I know that there must be a elegant way of doing this, but it is just a
> start for me. For now, I want to get the whole thing working properly. I am
> losing bandwidth due to some stupid programs from inside and outside.

Such as Slapper :-) ?

> Please tell me if I am making a mistake anywhere. I will be remotely login
> in the server to do this? I certainly don't want ssh to stop :)
>
> Thanks a lot in advance and eagerly waiting for the replies (especially
> about the OUTPUT part, of which I have some reservations which i will
> discuss later).

Go on then - discuss.....  :-)

Hope this hellps,

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

