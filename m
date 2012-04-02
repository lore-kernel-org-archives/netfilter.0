From: richard lucassen <mailinglists@lucassen.org>
Subject: ip a a /32 or used netmask
Date: Mon, 2 Apr 2012 23:05:10 +0200
Message-ID: <20120402230510.8b17b5dbc6d1f421fe9476aa@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

Just a question:

I have a NIC eth0 with address 10.0.0.1/24

I want to add an ip address to that NIC. Both ways work:

ip a a 10.0.0.2/32 dev eth0

ip a a 10.0.0.2/24 dev eth0

Is there anyhow some or other difference between the two? And is one of
the two ways preferred?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
