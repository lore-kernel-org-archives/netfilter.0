From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: senseful setup against flooding attack
Date: Thu, 11 Oct 2012 19:45:30 +0200
Message-ID: <k570jp$88c$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

i have problems and i am not not sure how to setup my flooding attack 
rule withe senseful values. Here is my iptable-rule:

> iptables -A attacksinput -p tcp -m conntrack --ctstate NEW -m multiport --dports 1:79,81:442,444:65535 -m hashlimit --hashlimit-name attacksinnot_80 --hashlimit-upto 6/hour --hashlimit-burst 20 --hashlimit-mode srcip -j LOG --log-level info --log-prefix "attacksinput(!80): " && \

So my hashlimit-burst is only 20 and my hashlimit-upto is 6/hour. I want 
to run a server application which doesnt fit with this setting. The 
incoming connection is really fast blocked. Which values are critical or 
the maximal limit for a mini-ITX server with intel atom N270 cpu? I have 
DSL 6000.

regards Markus

