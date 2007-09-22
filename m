From: "Dean Montgomery" <dmonty@sd73.bc.ca>
Subject: Redirect outgoing traffic
Date: Fri, 21 Sep 2007 17:50:48 -0700 (PDT)
Message-ID: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We have a program for that allows teachers to turn off the Internet their
school classrooms.  Thea script shells into each workstations and blocks
outgoing traffic to any computer port 80, 8080, etc.

This works great.  However we would like something more end-user friendly.

I would like to change this so that the outgoing web traffic gets redirected
to a small web daemon that displays a message "The teacher has turned off the
internet".

Setting up the web daemon was easy.

However I do not know how to write an iptables firewall rule to redirect all
outgoing web traffic from the local workstation to a different ip and port.

e.g.
redirect any outgoing traffic to any ip on port 80,443,3128,8080 -to-
192.168.0.1 port 55580

Any ideas?

