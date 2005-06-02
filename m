From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Thu, 02 Jun 2005 11:43:44 -0500
Message-ID: <429F3740.8070105@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>	<4289E72F.7020901@wp.pl>	<428B3798.9050407@eccotours.dyndns.org>	<428C1C3F.9030600@riverviewtech.net>	<428C56C9.9000607@eccotours.dyndns.org>	<428CA51D.4080206@riverviewtech.net>	<428DDFBC.1080905@eccotours.dyndns.org>	<428DF9F1.9060602@riverviewtech.net>	<42920563.7070406@eccotours.dyndns.org>
	<1117728830.10257.15.camel@debianbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1117728830.10257.15.camel@debianbox>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Sadus . wrote:
> Is there a way to parse the attacker's IP and block it permanantly via:
> iptables -A INPUT -s $IP -j DROP
> and cat > /etc/hosts.deny ?

The closest thing that I can think of at the moment would be to LOG the packet with a custom "--log-prefix" that is being watched for by a user space daemon and have this daemon add the IP in question to an ipset set list and /etc/hosts.deny.  To take advantage of the ipset set list you would have to use the set match extension to see if the IP was in the set list or not and take action based on that.  If you would like I could ponder this for a while and get back to you on how I would go about doing this.

> something close to what portsentry does, but using that SSH iptables
> Brute force script.

I'm not familiar with port sentry, can you tell me more about it or give me a URL to look at?  I'll Google for it and take a look when I have some more time to spare to see if I can better answer your question(s).

> This thread went big and confusion reigned on the latest version of the
> Brute Force script, kindly post the latest/best iptable rules :)

I will repost the script as it is presently in a new reply to the original message so that it is at the bottom of the thread.  I'll also include a version number in the subject line to make this easier to look at in the future.  For now you can see the most current version of the script in this message available here https://lists.netfilter.org/pipermail/netfilter/2005-May/060734.html .  I'll post a friarly lengthy email with the basic script in a couple of different forms and the various pros and cons to each form.  For now the main difference is that I'm not jumping to the SSH_Brute_Force chain the way that is posted in the list for various reasons I'll explain in the forthcoming email.

> thanks

No problem.



Grant. . . .

