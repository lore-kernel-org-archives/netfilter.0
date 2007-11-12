From: Diego Alencar Alves de Lima <listas@diegolima.org>
Subject: Can't use statistic target on iptables
Date: Mon, 12 Nov 2007 12:23:59 -0200
Message-ID: <1194877442.16101.13.camel@ws-diego.consuldata.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter mailing list <netfilter@vger.kernel.org>

Greetings,

I am trying to use the "random" and "nth" methods on iptables. I have
already compiled and loaded the xt_statistic kernel module but I can't
figure out how to compile the statistic iptables object. I have compiled
from v1.3.8 source and I get the following message:

iptables v1.3.8: Couldn't load match
`statistic':/usr/local/lib/iptables/libipt_statistic.so: cannot open
shared object file: No such file or directory

Do I have do add any parameter when I compile iptables to enable
statistic?

