From: Chip Upsal <cupsal@cyberwolf.com>
Subject: RE: netfilter hangups
Date: Mon, 17 Mar 2003 09:10:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3019863CF306D211BA4500A0CC30812DC67926@exchange.cyberwolf.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'Alexander W. Janssen'" <alexander.janssen@gmx.de>
Cc: netfilter@lists.netfilter.org

The script has the flush scripts. However sometimes it will not flush the
tables. A suggestion posted earlier fixed the problem. Instead of using the
init.d script directly i used service (service iptables restart) and the
script ran as expected. 

I cannot figure out why the flush scripts fail to run from time to time. But
it has happened more the once.

Chip

-----Original Message-----
From: Alexander W. Janssen [mailto:alexander.janssen@gmx.de]
Sent: Tuesday, March 11, 2003 10:52 PM
To: Netfilter Mailinglist
Subject: Re: netfilter hangups


On Tue, Mar 11, 2003 at 03:00:20PM -0700, Chip Upsal wrote:
> [root@iptables1 root]# /etc/sysconfig/iptables condrestart
> iptables: Chain already exists
> iptables: Chain already exists
> iptables: Chain already exists
> iptables: Chain already exists
> iptables: Chain already exists

The error is, what is says. If you create a custom chain with the -N switch
and fill it with data, the following can happen:

castor:~# iptables -N bla                   # New chain
castor:~# iptables -A bla -j REJECT         # some rule
castor:~# iptables -X bla                   # try to delete
iptables: Chain is not empty                # doesn't work. surprise
castor:~# iptables -N bla                   # that seems to be your problem
iptables: Chain already exists              # oh, well...
castor:~# iptables -F bla                   # flush the chain
castor:~# iptables -X bla                   # delete it
castor:~# iptables -N bla                   # be a lucky boy
castor:~# echo $?
0                                           # yeah, baby

 
> Or if i get no error the firewall will not recognize any of the changes i
> have made.

What i gues what happens is that:

1. Create chain
2. Fill chain
3.1. Try to delete chain without flushing it first -> will fail
3.2. Forget to delete chain
4. Try to create chain -> chain allready exists
5. Fill chain with rules -> since the chain was never flushed, it just keeps
up filling with rules

> In either case i am forced to reboot the firewall to get things going
again.

Na, i don't think so. Look into your script into the "stop" section (i don't
really know that script, but SYSV-init-style scripts should be the same
everywhere). Look if you custom created chains are getting flushed and
deleted. If they arent't do it there. Save. Try.

If it doesn't work: Send the script.

> Chip Upsal
> SysAdmin

Alex.

-- 
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so
literal."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

