From: Tim Lank <timlank@timlank.com>
Subject: how does NOTRACK work?
Date: Tue, 27 Dec 2011 21:12:37 -0500
Message-ID: <CAHyifnRkaVncFdpu6M7Op0tDuyhzBQqkokQJ+Oq9k-CbP5FScg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Netfilter list:

I have this in my iptables and it seems to work in that it doesn't
track the connections on the eth1 interface.

*raw
:PREROUTING ACCEPT [1327:114702]
:OUTPUT ACCEPT [2012:272100]
-A PREROUTING -i bond1 -j NOTRACK
-A OUTPUT -o bond1 -j NOTRACK
COMMIT

However, it never gets to the sshd or httpd service and reply to the client.

What else do I need to do in order to get the NOTRACK to accept sshd and httpd?

Thanks in advance for your help.
Tim
