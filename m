From: "Mike Tubby" <mike.tubby@thorcom.co.uk>
Subject: Re: finding out the culprit ip
Date: Thu, 4 Sep 2003 20:07:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006b01c37317$c1cfd0d0$0a90a8c0@zen>
References: <20030905183420.GA1850@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Payal Rathod" <payal-iptables@staticky.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, September 05, 2003 7:34 PM
Subject: finding out the culprit ip


> Hi,
> A particular machine in my LAN is affected by SoBig virus and is sending
> mails to remote sites. I need to find that IP. The only lead I have is
> that it is that IP which is generating maximum SMTP traffic. How do I
> find it out and block it (or maybe clean it)?
>
> Any ideas on this?
> With warm regards,
> -Payal
>


Here's my ideas:

**Assumption** :- you have a private internal network connected via a Linux
box as a firewall using NAT to the outside world.

then:

a) log and block direct SMTP connections

Log direct connection attempts from your clients to the world:

$IPTABLES -A FORWARD -i $LAN_IFACE -p tcp --dport 25 -m limit --limit
20/minute --limit-burst 10 -j LOG --log-level DEBUG --log-prefix "Fw: Deny
SMTP:"

this will cause entries in syslog. And block your internal machines from
doing
direct SMTP connections to the outside world with something like this:

$IPTABLES -A FORWARD -i $LAN_IFACE -p tcp --dport 25 -j REJECT --reject-with
icmp-port-unreachable

where $LAN_IFACE is the name if your inside interface.


b) on your Linux box install a good quality SMTP agent, like Exim
(www.exim.org)
or god-forbid sendmail (if you must).


c) arrange so that all internal machines send their legitimate email via the
mail relay on box


d) now inspect the Exim/Sendmail logs - you should see only good emails here


e) inspect /var/log/messages you should see machines that try to email
direct
being logged here


f) you can test the blocking is working from a machine on the inside with
something
like:

        C:> telnet post.thorcom.com 25

If you get the SMTP greeting then the blocking is NOT working - if you get a
Connection Refused error message then the blocking IS working.



Mike


