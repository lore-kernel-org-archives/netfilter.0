From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: ipfilter on satellite receive only PC
Date: Sat, 26 Jun 2004 13:28:50 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e5040626012851d190ba@mail.gmail.com>
References: <40DD28BA.82DEE8DA@neduet.edu.pk> <200406260915.01035.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406260915.01035.Antony@Soft-Solutions.co.uk>
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

this is out im running on my slackware, adjust it to your needs :)

#!/bin/bash
#
# Basic script to keep the nasties out of slack-lap

# First we make the default policy to drop everything

iptables -P INPUT DROP

iptables -P FORWARD DROP

# Allow established connections and programs that use
loopback

iptables -A INPUT -m state --state ESTABLISHED,RELATED
-j ACCEPT

iptables -A INPUT -s 127.0.0.0/8 -d 127.0.0.0/8 -i lo
-j ACCEPT

# Lets allow ssh to connect

iptables -A INPUT -p tcp --dport 22 -i ppp0 -j ACCEPT

#end script


On Sat, 26 Jun 2004 09:15:01 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> 
> On Saturday 26 June 2004 8:41 am, yunus wrote:
> 
> > Dear netfilter gurus,
> >
> > I am new to iptables. The computer on which I want to use iptables is a
> > Redhat linux 7.3 with satellite pentanet card. I want to filter the
> > traffice forwarded to our LAN. When I use:
> >
> > iptables -P Forward DROP
> > iptables -A INPUT -m state --state RELATED, ESTABLISHED -j ACCEPT
> > iptables -A Forward -m state --state RELATED, ESTABLISHED -j ACCEPT
> >
> > It still does not allow me to browse from the LAN. Outgoing is through
> > router serial port.
> 
> Well, if that's your complete ruleset, the main problem is that you are
> allowing established connections, but you have no way to establish them (ie:
> you are not allowing any NEW packets through).
> 
> If that's not your complete ruleset, then please post it so we can see what
> your firewall is being told to do.
> 
> Regards,
> 
> Antony.
> 
> --
> All matter in the Universe can be placed into one of two categories:
> 
> 1. Things which need to be fixed.
> 2. Things which need to be fixed once you've had a few minutes to play with
> them.
> 
>                                                     Please reply to the list;
>                                                           please don't CC me.
> 
>

