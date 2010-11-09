From: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Subject: Redirecting flows among one machine's interfaces
Date: Tue, 9 Nov 2010 14:59:46 -0800 (PST)
Message-ID: <764497.89064.qm@web31604.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1289343586; bh=bh6JBygNIpPgR8CUZxNETkeZGhf4H6zED27WeP/RBzs=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=SHN6WtKG5sfTMJBVzWLrb8ZospgqJVJajEBDIUjdCLAyRZAjAx82ZPBbK4k4hdy+gXnL6WuvjMLLfxh8MCdWh+YS38/dMTsaEHY8hxzhoi7l1menRlujk3G87WF4gSU+kMWPJ8DMHxT5czur1W0jWuu4CcMutjGfpTkkIvpfSmo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I am not very familiar with iptables, but what I am trying to achieve is the following:

I have a machine with two interfaces (let's say if1 -- with ip address a.b.c.d -- and if2 -- with ip address x.y.z.w) both connected to the internet. One of the two interfaces is the default interface (e.g., if1).  Whatever flow is initiated towards a destination in the Internet is going out if1.  I want to use iptables in order to redirect some of the flows to if2.  Is there a way to do this using iptables?  

I have tried some rules (e.g., iptables -A FORWARD -d k.l.m.n -o if2 -j ACCEPT // where k.l.m.n is the destination ip address of the flow I want to redirect) but with no luck.  From what I could figure out the rule FORWARD is mainly for packets that go through the machine and not that much for packets originating from the machine.  Is there a way to perform what I want with iptables ?  Given that this is possible, another question is weather iptables changing the source ip address from a.b.c.d to x.y.z.w or not.

Thanks a lot and hopefully someone can seed light on this.

Best,
Kostas


      
