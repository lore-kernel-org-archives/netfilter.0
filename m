From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Documentation.
Date: Sat, 6 Jun 2020 18:09:22 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2006061631470.11442@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

Thank you very much for netfilter and conntrack. :)

Although I'm a long-time user of netfilter/iptables, this is my first
time with the conntrack tools.  The things that I've found below came
from searches resulting from very specific requirements, which I have
so far achieved only in part.  Briefly, I want to see from user space
which running process is associated with a particular TCP connection,
and I especially want to know when the connection is terminated.  At
any one time on the box (which is a mail server) there may be just a
few of these processes running, or a few hundred.  Each connecting IP
may make one or several simultaneous connections, and each connection
will have up to three process spawned to handle it.  One of the three
processes will be a Sendmail child; it will handle these connections
directly, and it will communicate with the other process or processes
(milter processes) about the connection.  There may in total be many
thousands of connections, both TCP and UDP.  The UDP connections will
almost all be local IPC, and at the moment I'm not interested in them.

Firstly, it is _almost_ enough to see that _no_ connection from some
IP is now in the conntrack table, but it is not quite good enough for
my purpose.

Ideally I'd like to know which process ID is using which connection.
Because there may be simultaneous connections, if I don't know which
one is which, then I have to wait for all of them to go away before
cleaning up, and this can sometimes take hours.  When a connection is
first created I could mark it from user space.  Then I can look for
the mark when it's time to clean up, but I'd prefer not to have to do
that if there's a way of identifying it which does not involve this
separate marking operation.  Is there such a way?

Secondly, I wanted to get conntrackd to log via syslog using facility
'mail'.  It won't do it.  It will log using 'local0' etc., but claims
that facility 'mail' is not a known syslog facility (even though I am
using it extensively in my milters).  This is my configuration, it is
only very slightly edited from the Debian original:

8<----------------------------------------------------------------------
mail6:/etc/conntrackd# >>> cat conntrackd.conf
General {
         HashSize 8192
         HashLimit 65535

         Syslog mail

         LockFile /var/lock/conntrackd.lock

         UNIX {
                 Path /var/run/conntrackd.sock
#               Backlog 20
         }

         SocketBufferSize 262142
         SocketBufferSizeMaxGrown 655355

         # default debian service unit file is of Type=notify
         Systemd on
}

Stats {
         LogFile on
         Syslog mail
}
8<----------------------------------------------------------------------
mail6:/etc/conntrackd# >>> service conntrackd restart
[....] Stopping conntrackd[Sat Jun  6 17:22:07 2020] (pid=6268) [warning] 'mail' is not a known syslog facility, ignoring
[Sat Jun  6 17:22:07 2020] (pid=6268) [warning] 'mail' is not a known syslog facility, ignoring.
. ok 
[....] Starting conntrackd[Sat Jun  6 17:22:09 2020] (pid=6292) [warning] 'mail' is not a known syslog facility, ignoring
[Sat Jun  6 17:22:09 2020] (pid=6292) [warning] 'mail' is not a known syslog facility, ignoring.
. ok 
8<----------------------------------------------------------------------

The man page is not clear on what facilities I can use; if I change
facility 'mail' (for example) to 'local1' the warnings go away, but of
course I don't want to do that.  It isn't a show-stopper, I can do it
some other way, but it's a nuisance.

Thirdly, it seems that

http://conntrack-tools.netfilter.org/

and

http://conntrack-tools.netfilter.org/manual.html

haven't been updated since 2012.  Am I expected to be reading these,
or is there something else more recent which replaces it?  The latest
release of conntrack-tools mentioned on the site is 1.4.0, although my
version of conntrack is 1.4.5 (- and it's a Debian package! -) and the
man page does refer me to the conntrack-tools.netfilter.org Website.

Examples in chapter 5, "Using conntrack: the command line interface":

[QUOTE]
# conntrack -U -p tcp --dport 3486 --mark 10
  tcp      6 431982 ESTABLISHED src=192.168.2.100 dst=123.59.27.117\
  sport=34846 dport=993 packets=169 bytes=14322 src=123.59.27.117\
  dst=192.168.2.100 sport=993 dport=34846 packets=113 bytes=34787\
  [ASSURED] mark=1 secmark=0 use=1
conntrack v0.9.7 (conntrack-tools): 1 flow entries has been updated.
[/QUOTE]

(1) The mark in the command line is '10', not '1'.
(2) The dport in the example is '993', not '3486' and not '34846'.

Point (2) applies to other examples in the same section.  All give me
the impression of having been hand-crafted, rather than cut-n-pasted,
for example because on updates and deletes the tool does not print the
text "has been deleted"; it prints "have been deleted".

If the documents I'm reading are obsolete, I would suggest that they
should be taken down, and that the man pages for conntrack, conntrackd
and conntrackd.conf should be updated.  I'd be very happy to produce a
few patches if I can get the right information.

-- 

73,
Ged.
