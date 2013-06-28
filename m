From: richard lucassen <mailinglists@lucassen.org>
Subject: iptables-restore
Date: Fri, 28 Jun 2013 22:57:35 +0200
Message-ID: <20130628225735.3ba1a655d45c1d455b88ac61@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm just mucking about with iptables-restore. I noticed some very nice
behaviour which AFAIK is undocumented and I'd like to know if this
behaviour can be used in a production environment. I set up some rules
using a shell script, without using "iptables-restore". This works
fine.

Now, without restarting the script, I will insert a new user
defined chain called CH_INP_TEST using "iptables-restore". Mind that I
do NOT re-invoke the original script:

# cat CH_INP_TEST.txt 
*filter
:CH_INP_TEST - [0:0]
-A CH_INP_TEST -s 10.0.0.0/8 -j ACCEPT
-A CH_INP_TEST -s 172.16.0.0/12 -j ACCEPT
-A CH_INP_TEST -j RETURN
COMMIT

Ok, lets go:

# iptables-restore --noflush < CH_INP_TEST.txt

Check:

# iptables-save | grep CH_INP_TEST
:CH_INP_TEST - [0:0]
-A CH_INP_TEST -s 10.0.0.0/8 -j ACCEPT
-A CH_INP_TEST -s 172.16.0.0/12 -j ACCEPT
-A CH_INP_TEST -j RETURN

A thing that is undocumented but very useful AFAIK is this: I can alter
the entries of this particular user defined chain, simply by invoking
the iptables-restore again (I changed the /12 into /16):

iptables-save | grep CH_INP_TEST
:CH_INP_TEST - [0:0]
-A CH_INP_TEST -s 10.0.0.0/8 -j ACCEPT
-A CH_INP_TEST -s 172.16.0.0/16 -j ACCEPT
-A CH_INP_TEST -j RETURN

Apparently the "iptables-restore --noflush" flushes the user defined
chain "CH_INP_TEST" and replaces the old entries.

This is all very useful of course, but is it documented somewhere or am
I hitting a bug?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
