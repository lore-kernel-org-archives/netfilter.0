From: Gilles <gilles.ganault@free.fr>
Subject: iptables enough to handle brute force attacks?
Date: Tue, 05 Apr 2011 12:02:38 +0200
Message-ID: <pvplp6t1hsoea6n5sriuna0375k5s79pmm@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello

	I need to connect an Asterisk server to the Net so that 1) remote
users can register and 2) Internet users can ring any extension on the
server.

I'll use iptables to prevent hackers from trying to register.

I was wondering what solution to use to block brute force attempts:

- just rely on iptables since it offers a way, eg. "iptables -I INPUT
-p udp --dport 5060 -m state --state NEW -m recent --update --seconds
600 --hitcount 2 -j DROP"

- add Brute Force Detection (BFD), which is a shell script that is
called by CRON (ie. every minute at most)
www.rfxn.com/projects/brute-force-detection/

- add SSHGuard, which is apparently a stand-alone binary program that
doesn't rely on CRON
www.sshguard.net

This is on an embedded Linux, so there isn't enough RAM to run
Python-based fail2ban.

If you have installed Asterisk and iptables, which solution did you
end up using?

Thank you.

