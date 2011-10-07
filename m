From: "Netravali Ganesh" <gnetravali@sonusnet.com>
Subject: RE: How to block ssh on specific ethernet interface
Date: Fri, 7 Oct 2011 08:31:01 +0530
Message-ID: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8BD0@sonusinmail02.sonusnet.com>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com> <CAB1A4CB.C258%jlay@slave-tothe-box.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <CAB1A4CB.C258%jlay@slave-tothe-box.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Lay <jlay@slave-tothe-box.net>, Netfilter <netfilter@vger.kernel.org>

I don't want to make any dependency on IP. If IP get changes for any
reason ssh will be allowed.

Thanks
Ganesh

-----Original Message-----
From: James Lay [mailto:jlay@slave-tothe-box.net] 
Sent: Wednesday, October 05, 2011 5:39 PM
To: Netravali Ganesh; Netfilter
Subject: Re: How to block ssh on specific ethernet interface



On 10/4/11 10:24 PM, "Netravali Ganesh" <gnetravali@sonusnet.com> wrote:

>Hi..
>
>I have multiple Ethernet  interface on the system. I need to enable the
>ssh on eth0 and block the ssh on all the other interfaces. Below is the
>iptables rules I am using. This is not working form pls lls let me know
>what is wrong. I am using RHEL6.1 system.
>
> [root@localhost ~]# iptables -A INPUT -i eth1 -p tcp -m tcp --dport 22
>-j DROP
> [root@localhost ~]# iptables -L -v -n
>Chain INPUT (policy ACCEPT 40 packets, 5240 bytes)
> pkts bytes target     prot opt in     out     source
>destination
>    0     0 DROP       tcp  --  eth1   *       0.0.0.0/0
>0.0.0.0/0           tcp dpt:22
>
>Thanks
>Ganesh
>
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html


Why not just have sshd only listen to the interface you want?  From
sshd_config:

#Use these options to restrict which interfaces/protocols sshd will bind
to
ListenAddress ::
ListenAddress 0.0.0.0

James


