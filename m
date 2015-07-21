From: alvin <alvin.sm@Mail.Linux-Consulting.com>
Subject: Re: Creating, editing, removing rules from C(++)
Date: Tue, 21 Jul 2015 15:30:26 -0700 (PDT)
Message-ID: <201507212230.t6LMURFX024196@Mail.Linux-Consulting.com>
References: <55AEBC86.5010604@fundamental-software.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55AEBC86.5010604@fundamental-software.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Delrue <thomas.delrue@fundamental-software.net>
Cc: netfilter@vger.kernel.org, alvin <alvin.sm@Mail.Linux-Consulting.com>


hi thomas

> Is there a way to interact with the firewall rules from a C(++) program?
> What I'm really trying to do is have a program that only allows a
> certain set of CIDRs through the firewall through a particular port.
> However these CIDRs change from time to time and so my application is
> there to update the firewall rules to make sure that the firewall rules
> contain the latest and greatest information that says: "drop everything
> trying to connect to port P EXCEPT for stuff originating from these CIDRs=
> ".

yes, i update iptables rules randomly and on the fly

iptables recent module did not do what i wanted so i wrote the 
add or delete iptables rules in C

it has a command line interface or web pages with cgi-bin 

modifying iptables rules from apache requires visudo to 
allow apache to modify iptable rules which is kinda dangerous :-)

# eg. add incoming ddos attackers to iptables blacklist
# iptables-gui -autoadd ... 'a.b.c.d|w.x.y.z'

# the corresponding actual iptable rule:
  iptables -I BlackList -p tcp -s a.b.c.d -d myLAN/24 -j TARPIT

# eg. remove inactive ddos attacks from the blacklist
# iptables-gui -autodelete ... w.x.y.z

# the corresponding actual iptable rule:
  iptables -D BlackList -p tcp -s a.b.c.d -d myLAN/24 -j TARPIT

- online demo:  http://DDoS-Mitigator.net/cgi-bin/IPtables-GUI.pl

have fun
alvin

> The information I've found so far seems to indicate I should look at
> libnftnl and nftables but I'm not sure this is right.
> Can you point me to the documentation for this? I've been looking online
> for information on how to do this but haven't found anything really.
> 
> Thanks,
> Thomas
