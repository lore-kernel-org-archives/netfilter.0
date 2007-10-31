From: "Jason Sigurdur" <jason.sigurdur@aspenview.org>
Subject: mangle table question
Date: Wed, 31 Oct 2007 08:54:01 -0600
Message-ID: <65CCDBD675D4F545AF59400EBEFE479D014700@av-mail01.aspenview.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, I have the following rules:

 

iptables -t mangle -A FORWARD -o net+ -p tcp --dport 3389 -j DSCP
--set-dscp-class af31

iptables -t mangle -A FORWARD -o net+ -p tcp --sport 3389 -j DSCP
--set-dscp-class af31

iptables -t mangle -A FORWARD -o net+ -p tcp --dport 23 -j DSCP
--set-dscp-class af31

iptables -t mangle -A FORWARD -o net+ -p tcp --sport 23 -j DSCP
--set-dscp-class af31

iptables -t mangle -A FORWARD -o net+ -p tcp --dport 25 -j DSCP
--set-dscp-class af31

iptables -t mangle -A FORWARD -o net+  -j DSCP --set-dscp-class af11

 

 

If the last rule is enabled, it resets all the DSCP values to af11. If a
specific rule is matched, does it not exit the chain?

 

jason

 

