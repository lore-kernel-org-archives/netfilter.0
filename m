From: Diego Alencar Alves de Lima <listas@diegolima.org>
Subject: DNAT'ing IP ranges
Date: Fri, 01 Feb 2008 17:00:32 -0200
Message-ID: <1201892435.9016.4.camel@ws-diegolima.consuldata.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter mailing list <netfilter@vger.kernel.org>

Greetings list,

I'd like to know if there is any way I can add a DNAT rule that will nat
an entire range of IP addresses to another range (which has the same
network mask). Something like this:

-t nat -A PREROUTING -d 192.168.0.0/24 -j DNAT --to 192.168.1.0/24

I need to keep the host address, just change the destination network
address. Thank you,

-- 
Diego Alencar Alves de Lima
http://www.diegolima.org


