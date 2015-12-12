From: =?UTF-8?B?RMOibmllbA==?= Fraga <fragabr@gmail.com>
Subject: Linux 4.3.1 regression: -m state returns "Protocol wrong type for
 socket"
Date: Sat, 12 Dec 2015 01:38:48 -0200
Message-ID: <n4g4s8$4pr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

	After upgrading the kernel from 4.3.0 to 4.3.1 (with the same
configuration), -m state doesn't work anymore.

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

	returns:

iptables: Protocol wrong type for socket.

	I'm using iptables v1.4.21.

	Any hints?

-- 
Linux 4.3.2: Blurry Fish Butt
http://www.youtube.com/DanielFragaBR
http://exchangewar.info
Bitcoin: 12H6661yoLDUZaYPdah6urZS5WiXwTAUgL


