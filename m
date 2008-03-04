From: "Andrea Bencini" <andrea.bencini@tin.it>
Subject: ebtables - invalid table name
Date: Tue, 4 Mar 2008 17:52:21 +0100
Message-ID: <003201c87e18$20f6f6f0$0200640a@wtlc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

I installed ebtables
I created sample rules in the file /etc/sysconfig/ebtables.filter, like 
those:

#! /bin/sh
EBTABLES=/sbin/ebtables

$EBTABLES -t filter -P INPUT DROP
$EBTABLES -t filter -P FORWARD ACCEPT
$EBTABLES -t filter -P OUTPUT DROP

When I start the service:
service ebtables start
I receive this messages:
File /etc/sysconfig/ebtables.filter contains invalid table name [FAILLED]

What does it mean? What do I have to add in the file ebtables.filter?

Can you help me?
Thanks
Andrea

