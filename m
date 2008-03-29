From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT session tracking
Date: Sat, 29 Mar 2008 18:12:33 +0100
Message-ID: <47EE7881.6090607@plouf.fr.eu.org>
References: <005701c8918c$a15859b0$0d01a8c0@signet>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <005701c8918c$a15859b0$0d01a8c0@signet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ganesh Kumar N M <ganeshkumar@signal-networks.com>
Cc: netfilter@vger.kernel.org

Hello,

Ganesh Kumar N M a =E9crit :
> I am trying to understanding the nat connection tracking. my doubt is
> how can I see the existing nat sessions

cat /proc/net/ip_conntrack (/proc/net/nf_conntrack on recent kernels),=20
or netstat-nat.

> and is there any iptables command to track the nat sessions.

What do you mean exactly by "track the nat session" ?
