From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Tue, 31 May 2005 00:07:14 -0500
Message-ID: <429BF102.6020906@riverviewtech.net>
References: <429BDF9F.7070707@mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429BDF9F.7070707@mindspring.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Larry Alkoff wrote:
> There is a nice feature of Zonealarm for Windows that will check 
> outgoing packets, and if that program sending is not on their list, ask 
> if you want to allow that program to access the web.
> 
> In addition, it will warn if a program is asking for server rights 
> although and ask for approval to grant that, although I don't understand 
> what they mean by "server rights".
> 
> Most Iptables scripts I've seen do very little OUTPUT filtering which 
> means a malicious program, if it got access somehow, could have free 
> range to send packets out.  Zombie or spyware perhaps.
> 
> The ability to block this by only allowing "approved" programs to access 
> the Internet would be a nice addition to Iptables.

The ability to only allow "approved" programs to send traffic out *IS* available now.  You are asking for asking for something that the "owner" match extension will provide via the "--cmd-owner", possibly in combination with the "--uid-owner".

> I heard this could be done in userspace with the QUEUE target in 
> iptables although I haven't been able to dig up much information about 
> QUEUE and it's use.
> 
> Does anyone have some ideas on how to implement this?

If I did I would have stated so in my original post about the QUEUE target.  Sorry.  :(

> If I had some ideas I'd be willing to take a first cut at it.  I know 
> just enough Iptables to be dangerous <g>.

I'll give you warning about this type of firewall setup.  If you are wanting to run this on a firewall that has multiple people behind it, as in a firewall that NATs for at LAN, you will not be able to run the owner match support as the owner of the traffic will not even be on the box that is running this firewall.  To be able to use any thing like what you are stating ZoneAlarm will do you will have to run it on the machine(s) that is (are) generating the original traffic in the filter table OUTPUT queue.  Bearing this in mind I do think that it would be possible to set up rules in the filter table OUTPUT chain like the following to prevent any one but the apache user and the apache command to send out traffic from port 80:

iptables -t filter -A OUTPUT -o ${INet} -p tcp --sport 80 -m owner ! --uid-owner ${Apache_user} ! --gid-owner ${Apache_group} --cmd-owner httpd -j DROP

Below is a similar rule for sendmail:

iptables -t filter -A OUTPUT -o ${INet} -p tcp --sport 25 -m owner ! --uid-owner ${Sendmail} ! --gid-owner ${Sendmail} --cmd-owner sendmail -j DROP

One *MAJOR* problem that I have with this solution for you is that it is *VERY* static and probably is not flexible enough for an end user system.  However I do think that such rules could be used with the assistance of a user space daemon managing rules like these in their own chain.  Such a setup would be as follows:

iptables -t filter -N IPTablesAlarm
iptables -t filter -A IPTablesAlarm -o ${INet} -p tcp --sport 80 -m owner ! --uid-owner ${Apache_user} ! --gid-owner ${Apache_group} --cmd-owner httpd -j DROP
iptables -t filter -A IPTablesAlarm -o ${INet} -p tcp --sport 25 -m owner ! --uid-owner ${Sendmail} ! --gid-owner ${Sendmail} --cmd-owner sendmail -j DROP
#< other rules (dynamicaly created) here >

I think I would evolve this chian a bit farther though.  I would personaly do something more along the lines of this on my home system(s):

iptables -t filter -N IPTablesAlarm
iptables -t filter -A IPTablesAlarm -o ${INet} -p tcp --sport 80 -m owner --uid-owner ${Apache_user} --gid-owner ${Apache_group} --cmd-owner httpd -j RETURN
iptables -t filter -A IPTablesAlarm -o ${INet} -p tcp --sport 25 -m owner --uid-owner ${Sendmail} --gid-owner ${Sendmail} --cmd-owner sendmail -j RETURN
#< other rules (dynamicaly created) here >
iptables -t filter -A IPTablesAlarm -j LOG --log-prefix "IPTablesAlarm:  "
iptables -t filter -A IPTablesAlarm -j DROP

This would facilitate ensuring that only the appropriet programs run by the appropriate users can send traffic out any given port and that any thing else will get LOGed and DROPed.

Any way that you go about any thing like this you *WILL* *NEED* some sort of user space program / daemon managing the firewall chain if you do choose to do this in IPTables.  If you do choose to do this in user space via the QUEUE target you will need a daemon to handle that QUEUE as well as something to administer the dynamic rules that it uses.  Either way you go about it you are looking at some sort of daemon and user interface.  As sated before I am not qualified to help with the user space QUEUE target in any way shape or form.



Grant. . . .

