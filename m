From: Brad Lhotsky <lhotskyb@grc.nia.nih.gov>
Subject: Re: SSHBrute Force: False Postives
Date: Thu, 01 Feb 2007 16:30:39 -0500
Message-ID: <45C25BFF.30509@grc.nia.nih.gov>
References: <02a601c745a8$9f7e1110$2904b00a@au.schpac.local>
	<7e36c7130702010832s7523c8a5vfaedca18e15f026a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7e36c7130702010832s7523c8a5vfaedca18e15f026a@mail.gmail.com>
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
To: fender <frozenspot@gmail.com>
Cc: netfilter@lists.netfilter.org

Here's what I do:

1) Add a group on your system that all shell users are a part of.  For
me, this group was called 'shellaccess' and root was _not_ in the group.
2) Create an public/private key pair for root.  (man ssh-keygen, I
recommend -t rsa -b 2048)
3) Install the public key in ~root/.ssh/authorized_keys
4) Add these lines to your sshd_config:
  # Root can only authenticate with keys
  PermitRootLogin without-password
  AllowGroup shellaccess
5) create a table that all traffic passes through, I use SSHD
  iptables -N SSHD
  iptables -I INPUT -j SSHD
6) download and install sec.pl (search google)
7) configure sec.pl to automatically block ip addresses after 5
unsuccessful login attempts by using a badhost script, here's mine:

#!/bin/bash
#
# Block a Host

IPTABLES=/usr/local/sbin/iptables
CHAIN=SSHD
INTOCHAIN="INPUT"

LINE=`${IPTABLES} -nL|grep Chain |grep $CHAIN |wc -l`
HOST=$1

#
# Add the  Rule
if [ $LINE == 0 ]; then
        $IPTABLES -N $CHAIN
fi;

#
# Add to the main chain
LINE=`${IPTABLES} -nL ${INTOCHAIN}|grep $CHAIN|wc -l`
if [ $LINE == 0 ]; then
        $IPTABLES -I $INTOCHAIN -j $CHAIN
fi;


#
# Check for the IP in the rule:
LINE=`${IPTABLES} -nL ${CHAIN}|grep $HOST|wc -l`
if [ $LINE == 0 ]; then
        $IPTABLES -I $CHAIN -s $HOST -j DROP
fi;


If you want to get more creative, fine.  This setup has worked for me by
 limiting the accounts that can be accessed over ssh, eliminating the
root password compromise, and actively blocking all machines that will
not quit.

I've looked into tarpitting and expiring those rules in my SSHD table,
but it's never really caused a problem.  There's multiple places I can
connect to my server from, so if I do accidentally block myself, I can
undo it fairly easily.

I'd also recommend that you make sure you have:

Protocol 2

in your sshd_config.

fender wrote:
> On 1/31/07, Dominic Caputo <jec6jec6@gmail.com> wrote:
> 
> 
> About the problem with ssh brute force attacks, you can use portknocking
> [1]. There are several portknocking projects, but you can use
> portknocko project [2]. This is a netfilter module that implements
> portknocking in an easy way. This module works in kernel 2.6.15, for
> now. It will work in newer versions soon. We need more feedback about
> this project.
> 
> We will be thankful for your comments.
> 
> 
> [1] http://www.portknocking.org
> [2] http://portknocko.berlios.de
> 
> -- 
> Federico

-- 
Brad Lhotsky <lhotskyb@grc.nia.nih.gov>
NCTS Computer Specialist
Phone: 410.558.8006
"Freedom, Privacy, Security.  Choose Two."

