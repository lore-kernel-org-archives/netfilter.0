From: David Acker <dacker@rajant.com>
Subject: how to disable building extensions
Date: Tue, 23 Feb 2010 13:17:32 -0500
Message-ID: <a970a86d1002231017l54df3e49xebd63fc1afde6d6e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello iptables list,
I would like to disable some iptables extensions at build time.  I
work on an embedded system and would like to avoid creating any
libraries that we are not going to use.  I would also like to keep the
build times for our system as small as possible.  Can this be done
through a configure call?
--
Dave Acker
