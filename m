From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 2 Oct 2005 16:13:23 -0500
Message-ID: <200510021613.23410.rob0@gmx.co.uk>
References: <dhmn38$hsk$1@sea.gmane.org> <200510021416.39103.rob0@gmx.co.uk>
	<Pine.LNX.4.58.0510022225450.26361@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0510022225450.26361@blackhole.kfki.hu>
Content-Disposition: inline
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

On Sunday 2005-October-02 15:38, Jozsef Kadlecsik wrote:
> > I know 2 things: RTFM and experience. From The Fine Manual: " ...
> > RELATED meaning that the packet is starting a new connection, but
> > is associated with an existing connection, such as an FTP data
> > transfer, or an ICMP error."
> >
> > How is this association known to conntrack?
>
> There are protocol-dependent helper modules, like ip_conntrack_ftp
> which job is to figure out the data channel parameters (RELATED
> connections) from the commands and messages issued/passed on the
> command channel.

Are you saying that RELATED is only known through the use of helper 
modules?

> > Experience tells me that my little ssh attack blocking ploy using
> > -m limit did not work if a --state RELATED,ESTABLISHED -j ACCEPT
> > rule preceded it, but it did/does work if the rule matches only
> > --state ESTABLISHED.
>
> Without knowing the exact rules one cannot explain why you found
> that.

I had what amounted to this:
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp --dport ssh -j Ssh
-A Ssh -m limit --limit 3/m --limit-burst 3 -j ACCEPT
-A Ssh -j DROP

That does nothing to deter the SSH attack bots. This works, however:
-A INPUT -p tcp --dport ssh -j Ssh
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A Ssh -m state --state ESTABLISHED -j ACCEPT
-A Ssh -m limit --limit 3/m --limit-burst 3 -j ACCEPT
-A Ssh -j DROP

The fundamental difference of course is that --state RELATED are not 
accepted before the --limit.

An SSH attack bot is a brute force attempt to gain shell access through 
common usernames and passwords. They scan for open sshd's on 22/tcp and 
then do this. Each connection (--syn) tries one username/password 
combination. They keep coming back with dozens of these whenever an 
open sshd has been found. If you run sshd open to the Internet you 
probably have seen these attacks in your logs.

Each subsequent --syn packet has the same source IP, and the same 
destination IP and port, as the first one which is by now in --state 
ESTABLISHED.

So you are telling me that those are not --state RELATED? My firewall 
disagrees. The rules above are blocking SSH brute force attacks after 
the 3rd attempt.

> > My inference therefrom was that the association is determined from
> > the IP addresses. For example if my MTA makes an outbound
> > connection to send mail to a remote site, and that site does an
> > identd query, we have a RELATED connection.
>
> No, there is no helper module for such a task.

Okay, so I think we need some more explicit wording in the 
documentation. What is RELATED? I have not found anything which 
explains it completely.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

