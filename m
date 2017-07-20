From: iptables@trodman.com
Subject: Re: quick cut-over iptables to firewalld
Date: Thu, 20 Jul 2017 16:54:30 -0500
Message-ID: <201707202154.v6KLsUWv027985@epjdn.zq3q.org>
References: <201707201934.v6KJYcj6029286@epjdn.zq3q.org> <CAP9CGvgPiR2f3vwqYXG5GVz8bLEX-v3S+7_h+RxOCZ0JadtGAA@mail.gmail.com> <CAP9CGvh=x+n3XPw51rx7SVNF41J-0pfDDNj5PKH0J9jqeZepSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CAP9CGvh=x+n3XPw51rx7SVNF41J-0pfDDNj5PKH0J9jqeZepSg@mail.gmail.com>
Content-ID: <27982.1500587670.1@epjdn.zq3q.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Chris:

On Thu 7/20/17 16:23 -0500 Chris Clark wrote:
> http://www.firewalld.org/documentation/man-pages/firewall-cmd.html
> https://fedoraproject.org/wiki/Firewalld?rd=FirewallD

Thanks.

> you can always use iptables-save to dump out an iptables rules set
> and then maybe come up with a way to integrate it into the iptables
> hierarchy that firewalld has.

My rules are simple, so that is not an issue.

I switched over a test box in about 5 minutes,  First command I used was:

    systemctl stop iptables && systemctl enable firewalld && systemctl start firewalld && systemctl status firewalld

Then I manually added the rules, did a reload, ran tests (all good), and then

    less /etc/firewalld/zones/public.xml
        # Probably should be under version control?
    systemctl disable iptables

--
regards,
Tom    
--
Is there no way to swap in / reload a new hand edited version to /etc/firewalld/zones/public.xml?

--snip
