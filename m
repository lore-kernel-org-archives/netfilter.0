From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: curious about address specification and port specification
Date: Thu, 10 Oct 2002 06:20:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c27014$5783fdc0$026410ac@honor>
References: <Pine.LNX.4.44.0210091755001.17555-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>, netfilter mailing list <netfilter@lists.netfilter.org>

From: "Robert P. J. Day" <rpjday@mindspring.com>

> just the other day, i was at a local LUG meeting and a guy was giving a
> quick tutorial on iptables and displayed a sample rule file that contained
> the rule:
>
>   iptables -A FORWARD --destination 172.16.0.2 --destination-port 25  \
> --jump ACCEPT
>
>   doesn't this represent an example of what i was asking about?  a
> reference to a port with no reference to protocol.

well, a flipchart, whiteboard or video beamer presentation wont spit out any
error messages...

a real computer will do, and it will tell you that --destination-port is an
invalid parameter in that case..

because you dont specify any protocol ;)

iptables v1.2.6a: Unknown arg `--destination-port'
Try `iptables -h' or 'iptables --help' for more information.



