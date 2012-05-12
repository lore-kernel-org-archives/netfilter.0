From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Problems with a forward rule
Date: Sat, 12 May 2012 17:47:12 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "C. L. Martinez" <carlopmart@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2012-05-11 17:04, C. L. Martinez wrote:

>Hi all,
>
> I have setup the following rules in a centos6 gateway:
>[ugly iptables -L]

*Use* iptables-save and provide a *full* ruleset.

>All works ok, except when I try to restrict one host to go out via
>external interface. My problem is with the following rule:
>
>   0     0 ACCEPT     all  --  *      *       172.24.50.3
>0.0.0.0/0           state NEW
>
>If I try to restrict destination, doesn't works. For example using this rule:
>
>iptables -A FORWARD -s 172.24.50.3 -d 1.1.1.0/24 -m state --state NEW -j ACCEPT
>
>only works if I do:
>
> iptables -A FORWARD -s 172.24.50.3 -m state --state NEW -j ACCEPT
>
>then, what am I doing wrong??
