From: Patrick Chemla <patrick.chemla@perfaction.net>
Subject: Re: multiple public ips to multiple internal ips
Date: Sun, 31 Jan 2010 08:42:21 +0200
Message-ID: <4B65264D.8040508@perfaction.net>
References: <4B64A040.2080300@perfaction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <4B64A040.2080300@perfaction.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I would like to add a question:

I am quite a newbie in this field.

If one of my network interface is connected to the public side, and=20
receive 16 public ips from my ISP, do I have to declare 16 alias to my=20
network interface?

If there are 128 ips, I should declare 128 aliases???

Thanks
Patrick


Le 30/01/2010 23:10, Patrick Chemla a =E9crit :
> Hi,
>
> I need to setup a router to match multiple public ips to multiple=20
> internal ips.
>
> I need to do it one by one, because I want it to be dynamic.
>
> I mean: I want to be able to change external ip for a specific server=
=20
> at any time. I am building a set of scripts where an internal server=20
> will request from the router to change his external ip. The router=20
> will change and reload his configuration dynamically.
>
> I have a set of 10 public ip addresses for about 5 internal servers.
>
> My router is a Linux Fedora 11 box, kernel 2.6.30.10-105.fc11.x86_64=20
> with iptables-1.4.3.1-1.fc11.x86_64 installed.
>
> Is there somewhere a step by step howto to help me configure iptables=
?=20
> Maybe a thread in this list?
>
> I checked some threads but I found only configurations for range of=20
> ips, not for individual ips.
>
> I checked some iptables Howtos: There are a lot about one public ip t=
o=20
> multiple internal, I haven't found any on multiple to multiple.
>
> Thanks for help
> Patrick
>

