From: Narendra Choyal <narendrachoyal@gmail.com>
Subject: Re: Possible IPTables bug in INPUT interface filtering?
Date: Wed, 21 Apr 2010 23:57:24 +0530
Message-ID: <t2p186ebf761004211127k7512fb29r5b4873627925fece@mail.gmail.com>
References: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=BT/vSG+x+bJOz2Fph0xC/6cZmWBfiqeHj8/BJ0sVWwc=;
        b=imARGkyUa0IOmjkkgVYxqeYXnlUYpUnLwMpJBx3nx3KjPagfYGbVOTAeqqAPWZ5Jus
         CgYYUeb7rvpyxjuFm46ogl4IGbgh1jb9ASq2aHbj2TS9esUzR1Jol+lrSVzTGbSFxscI
         nofHQcpThAb7bqGBUjFL8jQBPbfOxP0H+44g4=
In-Reply-To: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Engelke <john.engelke@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

  I am new in iptables but I know well about it.

I my suggenstion,

Here,

x.x.x.10 <== eth0
x.x.x.20 <== eth1   <---> If we want to deny/restrict this ethernet card.


#iptables -I INPUT -p tcp --dport 5900 -d x.x.x.20 -j DROP
#iptables -I OUTPUT -p tcp --sport 5900 -s x.x.x.20 j DROP

*** Default Policies of INPUT and OUTPUT must be ACCEPT

NOTE :
-i also not work when we have two virtual IPs like eth0 and eth0:1 .
In this case first rule will be applied whatever the interface is
written i.e eth0 or eth0:1 .
