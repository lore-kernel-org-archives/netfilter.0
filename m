From: alvin <alvin.sm@Mail.Linux-Consulting.com>
Subject: Re: Creating, editing, removing rules from C(++)
Date: Wed, 22 Jul 2015 10:01:54 -0700
Message-ID: <20150722170154.GA2610@Mail.Linux-Consulting.com>
References: <201507212230.t6LMURFX024196@Mail.Linux-Consulting.com>
 <55AECB5B.9090302@fundamental-software.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55AECB5B.9090302@fundamental-software.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Delrue <thomas.delrue@fundamental-software.net>
Cc: netfilter@vger.kernel.org, alvin <alvin.sm@Mail.Linux-Consulting.com>


hi thomas

On Tue, Jul 21, 2015 at 06:44:43PM -0400, Thomas Delrue wrote:
> Thank you for replying!
...
> On 07/21/2015 06:30 PM, alvin wrote:
...
> > # eg. add incoming ddos attackers to iptables blacklist
> > # iptables-gui -autoadd ... 'a.b.c.d|w.x.y.z'
> >
> > # the corresponding actual iptable rule:
> >   iptables -I BlackList -p tcp -s a.b.c.d -d myLAN/24 -j TARPIT
> 
> This is exactly the kind of thing that I would like to do
> Is the source for iptables-gui open source? 

it is not open source :-)

the idea is simple:
- ( tcpdump or any sniffer | cleanup and extract > traffic.data.txt ) &
--- iptables-gui need to sort the traffic data and insert or delete
--- incoming IP# of the DDoS at the right rule# in iptables chains
- crontab# iptables-gui -add or -delete

> Can you point me to it or to
> the documentation/resources you used to write this application.

#
# i assume ( require ) certain set or sequence of iptables rules
# and list of the other people's IPtables howto 
#
http://iptables-blacklist.net/Howto/

------

Neil murphy's idea of using iptables-restore is a good idea too
for add/deleting CIDRs that changes infrequently 

iptables-save -c > /tmp/iptables.txt

sed -e s/a.b.c.d/w.x.y.z/g < /tmp/iptables.txt > /tmp/iptables.new.txt

iptables-restore -c < /tmp/iptables.new.txt

#
# you'd need to verify save and restore works ... it didn't work
# for me when i tested on debian-testing, slackware-14.x, redhat variants
#
# save/restore seems to work on most all versions of OpenSuSE
# and rolling updates worked across 4 major patch levels from
# 11.x - 12.x - 13.x - factory
#
# i needed iptables rules to be independent of the distro's syntax
#

> # eg. remove inactive ddos attacks from the blacklist
> > # iptables-gui -autodelete ... w.x.y.z
> > 
> > # the corresponding actual iptable rule:
> >   iptables -D BlackList -p tcp -s a.b.c.d -d myLAN/24 -j TARPIT
> 
> Yep, this also is exactly what I'm trying to do
 
have fun
alvin
http://DDoS-Mitigator.net
