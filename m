From: Martin Mares <mj@ucw.cz>
Subject: Egress filters
Date: Wed, 26 Jan 2011 11:39:04 +0100
Message-ID: <mj+md-20110126.102650.14602.nikam@ucw.cz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, world!\n

I would like to set up an egress filter, which would process all outgoing
packets just before they hit the network interface (especially after all
NATing takes place).

Is there any table/chain for that?

				Have a nice fortnight
-- 
Martin `MJ' Mares                          <mj@ucw.cz>   http://mj.ucw.cz/
Faculty of Math and Physics, Charles University, Prague, Czech Rep., Earth
int random(void) { return 4; /* Random number chosen by a fair dice roll. */ }
