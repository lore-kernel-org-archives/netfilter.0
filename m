From: "Hansa" <mythtv@logic-q.nl>
Subject: RE: Is the current firewall model static?
Date: Wed, 21 Dec 2011 10:18:13 +0100
Message-ID: <002201ccbfc1$7743d7f0$65cb87d0$@nl>
References: <000301ccbef9$4a8dc180$dfa94480$@nl> <1324375868.21032.1.camel@steve-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1324375868.21032.1.camel@steve-pc>
Content-Language: nl
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Andrew Beverley' <andy@andybev.com>
Cc: netfilter@vger.kernel.org

From: Andrew Beverley [mailto:andy@andybev.com]
Sent: dinsdag 20 december 2011 11:11
> On Tue, 2011-12-20 at 10:25 +0100, Hansa wrote:
> > Hi there,
> >
> > Fedora is running a project called firewalld. Firewalld manages the
> firewall
> > dynamically via D-BUS
> > (http://fedoraproject.org/wiki/FirewallD/#Why_A_Firewall_Daemon).
> They say:
> > "the current firewall model is static and **every** change requires a
> > complete firewall restart. This includes also to unload the firewall
> > netfilter kernel modules and to load the modules that are needed for
> the new
> > configuration."
> >
> > I would be very surprised if their claim is true. Because that would
> break
> > statefull connections when changing the rules. I'm not familiar with
> the
> > code so I can't comment on that. Hence my question. Is the current
> firewall
> > model static?
> 
> I think that what they mean is that the current *Fedora* firewall model
> is static. It looks like firewalld still uses iptables, but is slightly
> more intelligent as to how it processes changes to rules and so on.

I wasn't aware the firewall model is implemented differently across different Linux flavors. I thought netfilter implements a packet filtering framework into the Linux kernel. Shouldn't it work the work the same on every Linux flavor? I did the following test.

Ssh on port 22 into a Linux box with following filter rules
# iptables -L -n --line-numbers
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
3    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22
4    REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited

Remove line 3, so new ssh connections are rejected. The current ssh session however should be working because of rule number 1.

# iptables -D INPUT 3
# echo "yup it does"
yup it does

Seems pretty much dynamic to me :)
Am I missing something?

-Hansa

