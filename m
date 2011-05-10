From: netfilter@buglecreek.com
Subject: Interpret Invalid Log Entry
Date: Tue, 10 May 2011 12:46:03 -0600
Message-ID: <1305053163.30464.1450420905@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com; h=message-id:from:to:mime-version:content-transfer-encoding:content-type:subject:date; s=smtpout; bh=FYlYAsWfnitUuSg1QH4cd17x8tE=; b=s7hFAai6aHylUAvJWoanXsjiCz4/Y2mPBOUDtEBXte+8k4cvVZ0DpyORCVaWOJqVNB4n112XywVaEdB4nbp38eVIOT0IJKRj4Ua8otZ84KCOOQJMoRilmnEjsZq3ob8DhIjFSuSJJgLWT49u19uZnNH2NxWX1ogj22qPnnSRV1E=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

I'm hoping someone can help me interpret some log entries that show up
in my logs a couple of times a day.  These systems are on an internal
network and are not directly connected to the Internet.  The rules that
generate the log entries are:

iptables -A INPUT -i $EXT_INTERFACE -m state --state INVALID -m limit -j
LOG --log-prefix "Invalid: " --log-level 6
iptables -A INPUT -i $EXT_INTERFACE -m state --state INVALID -j DROP

The log entries are something like this (the Internet IP changes):

Apr 28 22:45:00 hostname kernel: Invalid: IN=eth0 OUT= MAC=XX:XX . . 
SRC=Internet_IP DST=192.168.100.100 LEN=76 TOS=0x00 PREC=0x20 TTL=53
ID=15756 PROTO=ICMP TYPE=3 CODE=2 [SRC=192.168.100.100 DST=Internet_IP
LEN=48 TOS=0x00 PREC=0x00 TTL=114 ID=766 DF PROTO=32 ]

I'm not sure what it is telling me.  These systems are internal servers
and shouln't have any reason to contact the Internet except maybe for
patching.  Is this trying to tell me that my system (192.168.100.100)
tried to talk to Internet_IP and got back a ICMP protocal unreachable. 
This doesn't seem likely given what they are used for.  The square
bracket info has me confused especially with PROTO=32.
