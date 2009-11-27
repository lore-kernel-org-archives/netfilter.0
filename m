From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: [patch] iptables.8 - add UNTRACKED state
Date: Fri, 27 Nov 2009 21:05:09 +0100
Message-ID: <4B1030F5.7030702@chello.at>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040500080207040900080107"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------040500080207040900080107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I hope the diff is useful. It adds the UNTRACKED state to the state and 
conntrack --ctstate descriptions.

diff -cB /usr/local/src/iptables-1.4.5/iptables.8 /tmp/iptables.8 > 
iptables.8.diff

Best regards

Mart

--------------040500080207040900080107
Content-Type: text/plain;
 name="iptables.8.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables.8.diff"

*** /usr/local/src/iptables-1.4.5/iptables.8	2009-10-19 19:50:25.000000000 +0200
--- /tmp/iptables.8	2009-11-27 20:45:08.000000000 +0100
***************
*** 607,614 ****
  .PP
  States for \fB\-\-ctstate\fP:
  .TP
  \fBINVALID\fR
! meaning that the packet is associated with no known connection
  .TP
  \fBNEW\fR
  meaning that the packet has started a new connection, or otherwise associated
--- 607,618 ----
  .PP
  States for \fB\-\-ctstate\fP:
  .TP
+ \fBUNTRACKED\fR
+ meaning that the packet will not to be tracked by connection tracking.
+ This state can be set using the \fBNOTRACK\fP target.
+ .TP
  \fBINVALID\fR
! meaning that the packet is associated with no known connection.
  .TP
  \fBNEW\fR
  meaning that the packet has started a new connection, or otherwise associated
***************
*** 1189,1194 ****
--- 1193,1201 ----
  [\fB!\fP] \fB\-\-state\fP \fIstate\fP
  Where state is a comma separated list of the connection states to
  match.  Possible states are
+ .B UNTRACKED
+ meaning that the packet will not to be tracked by connection tracking.
+ This state can be set using the \fBNOTRACK\fP target.
  .B INVALID
  meaning that the packet could not be identified for some reason which
  includes running out of memory and ICMP errors which don't correspond to any

--------------040500080207040900080107--
