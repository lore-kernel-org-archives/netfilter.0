From: Steve Mickeler <steve@warning.ca>
Subject: RE: SNAT interfering with source IP of a DNAT
Date: Wed, 5 Mar 2003 01:39:58 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303050138400.30180@gypsy>
References: <465F8149.1F5B7F36.0256A0D0@netscape.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <465F8149.1F5B7F36.0256A0D0@netscape.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ImpulseFG@netscape.net, netfilter@lists.netfilter.org


I just got it to work with marking the packets

# mark PREROUTING packets with a dest of 10.10.10.8 to 108
$IPT -t mangle -A PREROUTING -d 10.10.10.8 -j MARK --set-mark 108

# ACCEPT any packets on the POSTROUTING chain with a mark of 108
# This will stop the SNAT rule in the POSTROUTING chain later on
# from playing with the source IP
$IPT -t nat -A POSTROUTING -m mark --mark 108 -j ACCEPT

# Regular DNAT rule here now.
$IPT -t nat -A PREROUTING -d 10.10.10..8 -j DNAT --to 192.168.32.12



On Wed, 5 Mar 2003 ImpulseFG@netscape.net wrote:

>
>
> The DNAT command looks good, but be careful, or you will end up routing,
> the ssh port to the 192.168.32.6 network and not be able to ssh in.
>
> I thik the second command you want is $iptalbes -t nat -A PREROUTING -s
> 192.168.32.6 -j SNAT --to 10.10.10.8 . This will take all packets
> comming from 192.168.32.6 and make them look like they are coming from
> 10.10.10.8.
>
> The command you were using would make all teh packets coming from
> 172.17.0.0 subnet going to 192.168.32.12 . Look like they are coming
> from 192.168.32.6 . This would most likely get these packets lost,
> because the repling comuter 192.168.32.12 would send packets to
> 192.168.32.6 to reply instead of 172.17.0.0/19 . They would be lost.
>
> >
> >I've been beating my head against the table for the past couple of hours
> >trying to get this working properly.
> >
> >I'm doing a PREROUTING DNAT that will send any traffic destined to
> >10.10.10.8 and DNAT it to 192.168.32.12
> >
> >The DNAT works, but what keeps happening is the POSTROUTING rules further
> >down the chain is changing the source IP to 192.168.32.6 instead of
> >retaining the original source IP.
> >
> >What I need is the POSTROUTING SNAT rule to -ONLY- take place when an
> >attempt to access 192.168.32.12 is established from anything else except
> >the PREROUTING DNAT.
> >
> >here are the 2 PREROUTING and POSTROUTING entries:
> >
> >$IPT -t nat -A PREROUTING -d 10.10.10.8 -j DNAT --to 192.168.32.12
> >
> >...skip a bunch of other rules.
> >
> >$IPT -t nat -A POSTROUTING -s 172.17.0.0/19 -d 192.168.32.0/24 -j SNAT
> >--to-source 192.168.32.6
> >
> >Right now, when I ssh to 10.10.10.8 it changes my source IP to
> >192.168.32.6 because I'm coming from 172.17.3.24, but I'd like to avoid
> >that unless I'm ssh'ing to 192.168.32.12 directly.
> >
> >The easiest thing to do would be to avoid the POSTROUTING SNAT but its a
> >requirement I have to make sure anything going to 192.168.32.0/24 gets
> >nat'ed to 192.168.32.6
> >
> >Any ideas of how to get around this ?
> >
> >Thanks.
> >
> >
> >
>
> __________________________________________________________________
> The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp
>
> Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/
>

