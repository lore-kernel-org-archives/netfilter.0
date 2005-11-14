From: "P theodorou" <props666999@hotmail.com>
Subject: Re: SSH fails on 22 - Restrictive rules
Date: Mon, 14 Nov 2005 14:53:12 +0000
Message-ID: <BAY102-F405D69AB559F79D8127D1AAE5A0@phx.gbl>
References: <49164.193.173.147.3.1131974074.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49164.193.173.147.3.1131974074.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Basically i've got a log rule before the drop in my script , but i didn't 
want to create a large post.

Very  good poing though to check the logs . I should have done it  before 
posting

here.  That's why are log target is for.


Regards

>On Sun, November 13, 2005 23:44, P theodorou wrote:
> > Hello
> >
> > i'm testing my SSH server from an external IP (my mate's pc)
> > and i've noticed than whenever i allow connections on eth0 with dport
> > 22 i can see the username login page BUT, if apply the following
> > rules the usual user name cannot be displayed
> >
> > $IPTABLES -A TCPbad -p tcp --tcp-flags SYN,ACK SYN,ACK -m state
> > --state NEW -j REJECT --reject-with tcp-reset
> > $IPTABLES -A TCPbad -p tcp ! --syn -m state --state NEW -j DROP
> > $IPTABLES -A TCPbad -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> > $IPTABLES -A TCPbad -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> > $IPTABLES -A TCPbad -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
> > $IPTABLES -A TCPbad -p tcp --tcp-flags ALL FIN -j DROP
> > $IPTABLES -A TCPbad -p tcp --tcp-flags ALL NONE -j DROP
> > $IPTABLES -A TCPbad -p tcp --tcp-flags ALL ALL -j DROP
> >
> > any help very appreciated
>
>I don't know what rule would cause that, but you could of course add a
>logging rule before each DROP so you know which rule is the problem.
>Or, start without these rules, and add them each at a time so you can
>test when ssh doesn't work anymore.
>
>
>Gr,
>Rob
>
>



