From: Mark Baker <mbaker824@gmail.com>
Subject: Site-specific filter rules problem
Date: Sun, 25 May 2008 00:55:39 -0700
Message-ID: <1211702139.7164.22.camel@u804mbr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:content-type:date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=2N0ujl/oZZZ2P2Czj2v2SjjJm0kvPWJQCNVrq6YEcS0=;
        b=XWohUl/tqENz+ny5ir6fdmwMaZlbk+tUJC8it8lPL9+7F9tplr4MxkQBbsxf160qLCNWk2oYl1tbz1hMh2nxCEUpF+EChV3C5eEO+fhwHcYPuUp9SLBt/I31DBmVh72wk5ggci/QzDaK6XpLnxCOuweXD4HDzpe28ngXP83/YO0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello, All -

I'm just getting started with netfilter, although I understand packet
filtering and have configured other firewalls. This is a very simple
desktop machine firewall that works fine in general, but is giving me
problems with one site in particular that's very important.

My rule set is extremely simple at present:

:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [6:358]
:U804-input - [0:0]
-A INPUT -j U804-input 
-A U804-input -i lo -j ACCEPT 
-A U804-input -p icmp -j ACCEPT 
-A U804-input -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A U804-input -p tcp -m tcp --dport 22 -j ACCEPT 
-A U804-input -j DROP

The one site that gives me problems is an online classroom environment
running Angel LMS.  With the above rules installed changing pages often
takes 15-20 minutes, but will usually work eventually. If I flush the
chains, the site responds normally.

I have packet captures from connections to this site, with and without
firewall rules installed.  I don't see anything that should be blocked
based on these rules - the only thing odd is that when the problem
occurs I get a ton of retransmissions from the server.  Another oddity
in both cases is that virtually every packet coming from the server is
fragmented; but from what I've read, connection tracking (which is
running on this machine) should completely reassemble fragmented packets
before delivery to the filter table.  Still, could fragmentation be the
problem?

What little I know about the server end is that it is running the Angel
Learning Management System (LMS) on IIS.  I don't yet know the path MTU,
but my local machine and router are both set to 1500, which is what I
would normally use for a high-speed connection.

Any ideas appreciated.

Thanks,
Mark Baker

