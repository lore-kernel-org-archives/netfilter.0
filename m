From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 00:49:45 -0400
Message-ID: <CAHEKYV4NAdedVx0JM6O5Q4SNaDxk+2mVw_YvNJiQrt7OwQbsKA@mail.gmail.com>
References: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=kK+BbLoB+h10C0P8iIXHUsCNRqZtMwiqgMLFf9rcU5c=;
        b=fOB+2zbHBAULG6oBVafs5LPX79/m8opTPvpmB0+C0J5i60usw6z3nuI5GL6Tec5BHc
         hKjU/eh+rg7Lc02cp02+BzOmypw1YbzmRlyL2LRj6MJS3NaXcuPWWX04uBpSjGTNW7Ot
         hYfwRbGAvr9YH9md8xyC7t4yjGcnM/dCPMkDQ=
In-Reply-To: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Wed, Oct 5, 2011 at 12:24 AM, Netravali Ganesh
<gnetravali@sonusnet.com> wrote:
> Hi..
>
> I have multiple Ethernet =A0interface on the system. I need to enable=
 the ssh on eth0 and block the ssh on all the other interfaces. Below i=
s the iptables rules I am using. This is not working form pls lls let m=
e know what is wrong. I am using RHEL6.1 system.
>
> =A0[root@localhost ~]# iptables -A INPUT -i eth1 -p tcp -m tcp --dpor=
t 22 -j DROP
> =A0[root@localhost ~]# iptables -L -v -n
> Chain INPUT (policy ACCEPT 40 packets, 5240 bytes)
> =A0pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=
=A0 source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 destination
> =A0=A0=A0 0=A0=A0=A0=A0 0 DROP=A0=A0=A0=A0=A0=A0 tcp=A0 --=A0 eth1=A0=
=A0 *=A0=A0=A0=A0=A0=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.0.=
0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:22
>
      I do not know what are your other rules, but I tend to have my
iptables blocking everything by default and only opening the ports I
need. Something like

iptables -P INPUT  DROP -m comment --comment "drop everything"
[...]
iptables -A SERVICES  -i eth0 -p tcp -m tcp --dport 22 -m comment
--comment "allow ssh into machine, from eth0" -j ACCEPT
