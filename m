From: "Anthony M. Rasat" <a.m.rasat@palangkaraya.speed.net.id>
Subject: Re: looking for rules for samba-related traffic
Date: Mon, 7 Apr 2003 11:13:00 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003301c2fcbb$faf6d700$7e00a8c0@speednet6>
References: <Pine.LNX.4.44.0304061428160.14285-100000@dell>
Reply-To: "Anthony M. Rasat" <a.m.rasat@palangkaraya.speed.net.id>
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
To: netfilter@lists.netfilter.org

Dear Robert,

Most times, when configuring a firewall, people blocked everything first
then allow any service required. This goes for any incoming traffic rule.
Now, outgoing rule may vary. Some people like to let any outgoing traffic
may pass unchanged, some are not. In your case, if you wish to do so, your
can set rules to block outgoing TCP and UDP port 137 - 139. This rules will
not affecting Samba (or Microsoft Windows Network Sharing Service)
communication inside your internal network.

Examples? I think
http://www.linuxguruz.org/iptables/scripts/rc.firewall_002.txt should
answered the question.

 Regards,

A.


----- Original Message -----
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: "iptables mailing list" <netfilter@lists.netfilter.org>
Sent: Monday, April 07, 2003 1:31 AM
Subject: looking for rules for samba-related traffic


>
>   (sorry if you already saw this -- due to the fact that i've
> been messing with my iptables setup, i'm not sure this made
> it out the first time.)
>
>   i'm looking for the ruleset to filter all samba-related
> traffic.  i realize that this involves ports 137-9, based
> on what i see in /etc/services.  but i did a quick google
> search and a couple sample sets i've seen refer to TCP
> traffic, when i've already confirmed that, for example,
> nmblookup is UDP.
>
>   so, anyone have a pointer to a nicely-annotated set of
> rules for samba, mounting filesystems, printing, etc?
> thanks.
>
>   in the meantime, i'll just keep experimenting and
> watching the packets.
>
> rday
>
>
>
>
>


