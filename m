From: Jon Lewis <jlewis@lewis.org>
Subject: ebtables counters oddity
Date: Tue, 3 Nov 2009 11:03:05 -0500 (EST)
Message-ID: <Pine.LNX.4.61.0911031044040.22812@soloth.lewis.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm using ebtables-v2.0.9-1.tar.gz with CentOS 5.3
2.6.18-164.el5xen #1 SMP Thu Sep 3 04:03:03 EDT 2009 x86_64 x86_64 x86_64 
GNU/Linux

Using ebtables, I've setup a number of user-defined chains.  In the INPUT 
and FORWARD chains, I have rules to jump to these user-defined chains.

While getting ready to setup graphing of the counters provided by ebtables 
-L --Lc, I noticed that any change (adding or deleting a rule) to any 
table (at least the INPUT, FORWARD, or any other user-defined one) causes 
the counters for the last user-defined table to be reset to 0's.

Has anyone else encountered this?

I just verified the same behavior on a RHEL 5.4 system running
2.6.18-164.2.1.el5 #1 SMP Mon Sep 21 04:37:42 EDT 2009 x86_64 x86_64 
x86_64 GNU/Linux
with

Name        : ebtables                     Relocations: (not relocatable)
Version     : 2.0.8.2                           Vendor: Dag Apt Repository, http://dag.wieers.com/apt/
Release     : 1.el5.rf                      Build Date: Fri 14 Mar 2008 12:17:48 AM EDT
Install Date: Sat 31 Oct 2009 03:09:00 PM EDT      Build Host: lisse.leuven.wieers.com
Group       : System Environment/Base       Source RPM: ebtables-2.0.8.2-1.el5.rf.src.rpm
Size        : 558998                           License: GPL
Signature   : DSA/SHA1, Sat 15 Mar 2008 12:52:06 AM EDT, Key ID a20e52146b8d79e6
Packager    : Dag Wieers <dag@wieers.com>
URL         : http://ebtables.sourceforge.net/

----------------------------------------------------------------------
  Jon Lewis                   |  I route
  Senior Network Engineer     |  therefore you are
  Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
