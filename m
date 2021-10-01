From: "Jeff" <jnewman67@gmx.com>
Subject: netfilter 10,000' overview
Date: Fri, 1 Oct 2021 17:23:05 -0400
Message-ID: <010901d7b70a$86c8edf0$945ac9d0$@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633123387;
        bh=NgdGIeBrOFo5oQtOjc743akA1o8GzY5xT5/CNFZAblY=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=GLO8j+jxts2yxxO+O3+FMTce4Nvx9Bw/N0KXm4+xnttrfaEaf4GKDaUhHlKB+zhku
         sKQbA76KyHfylum+1fmoDo+e01i8+TKjcryaWVNjTKtMDXRQHDYXq+A1sOHI7GymhO
         ecpX+WpzwB/zRDtLBpzAmzYc7vcOjoINey5NKj8E=
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've had  a notion of how iptables worked on RHEL4 and CentOS 6 machines,
and am now using CentOS 8, and I think I need a little
re-education/realignment.  Could someone please verify I have this
understood generally correctly, or point out my missteps - I'd really
appreciate it.

On my previous 2 servers, I had been using iptables to create rules for
packet filtering - simple DROP rules targeted at IP addresses shown to be
attempting abusive behavior.  I just blocked them fully - zero traffic,
regardless of port was abused - done.  Starting and stopping the iptables
service would toggle this filtering on and off - very simple and it worked
as understood.  I also assumed it somehow was directly connected to the
kernel-level network traffic stream.  I assumed that iptables was the both
the function for making rules as well as the implementor of those rules,
based on the command line for making the rules and the same name used in
starting/stopping the function.  Easy peasy.  I have no idea if or where
netfilter fits into these two older servers, if at all.  Is it kernel-level
in these older OS versions?  Is it a secondary service that iptables just
sits on top of?  Is it really just iptables?

On my CentOS 8 machine, I think I've figured out that netfilter is the
kernel-level access to the network traffic stream that implements the rules,
and that iptables (now nftables) is the rule-maker that manages some global
set of netfilter-compatible rules.  And I think that netfilter is always
"running", and that the management of the rules, and the access those rules,
can be done using many different utilities, like nftables, firewalld,
bastille, ufw, etc.  And that when "starting" and "stopping" one of those
utilities, for example nftables, you're not really starting or stopping
those particular utilities or netfilter, you're really just controlling
access to that global ruleset as it's currently defined, essentially turning
netfilter on/off without really stopping that kenerl-level service.

Does that sound correct?

If that's all true, can any/all of the above utilities (nftables, firewalld,
ufw, bastille) all be installed and usable on the server at the same time
(not that I want to, but wondering if they somehow would conflict)?  Does
making one rule in one utility interfere with making some other rule using
another utility?  Does starting one "service" (nftables for example) somehow
adversely affect netfilter if there are rules made by firewalld or bastille?

I hope the questions are well phrased and close enough to the truth make
answering worth your time.

Thank you.

Jeff


