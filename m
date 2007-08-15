From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: change from eth0 ---- router interface , to ppp0 --- ethernet
 modem interface
Date: Wed, 15 Aug 2007 09:58:22 -0500
Message-ID: <46C3148E.6090103@riverviewtech.net>
References: <46C21167.8050005@gabrix.ath.cx>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C21167.8050005@gabrix.ath.cx>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>
Cc: gabrix@gabrix.ath.cx

On 08/14/07 15:32, gabrix wrote:
> ARGO="`ifconfig ppp0 | grep inet | cut -d : -f 2 | cut -d \  -f 1`"
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d $ARGO --dport 25 -j DNAT 
> --to $MAIL:25
> $IPT -A FORWARD -i $IF0 -o $IF1 -p tcp --dport 25 -d $MAIL -j ACCEPT
> 
> I have problems with http e https where i'm using this code:
> 
> IF0=ppp0
> IF1=eth1
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d $ARGO --dport 80 -j DNAT 
> --to $WWW:80
> $IPT -t nat -A PREROUTING -p tcp -i $IF0 -d $ARGO --dport 443 -j DNAT 
> --to $WWW:443
> $IPT -A FORWARD -i $IF0 -o $IF1 -p tcp --dport 80 -d $WWW -j ACCEPT
> $IPT -A FORWARD -i $IF0 -o $IF1 -p tcp --dport 443 -d $WWW -j ACCEPT

I do not see any thing wrong with the IPTables rules that you have
presented.  However apparently something else is preventing things from
working correctly.

> I'm using apache2 with mod_rewrite rewriting connecions from port 80 
> to 443.  What's wrong with my configuration ? I will try to remove 
> that -d $ARGO like this:

I am curious if you see any traffic comming in to your web server at
all, be it via netstat, TCPDump, logs, etc.

I also wonder what else may be in your IPTables rules that is not
presented that may be causing problems.  Can / will you do an
iptables-save and show us the output of your entire IPTables configuration?

> And invite you to give it a try http://www.gabrix.ath.cx let's see 
> how it goes.
> 
> Thanks for the attenction !

*nod*



Grant. . . .

