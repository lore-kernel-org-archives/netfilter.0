From: Jean Weisbuch <jean@phpnet.org>
Subject: Re: Can I use iptables instead of hosts to block adservers?
Date: Sat, 14 Oct 2017 03:24:24 +0200
Message-ID: <a5bfb9ec-e4f6-f1b8-4757-21a984295785@phpnet.org>
References: <20171014010204.GA1316@waltdnes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20171014010204.GA1316@waltdnes.org>
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfliter list <netfilter@vger.kernel.org>

Le 14/10/2017 à 03:02, Walter Dnes a écrit :
> 3) Any suggestions for improvements?
Using ipset to store the list of IPs/prefixes is better suited than 
using an iptables rule for each IP, it would work like this :

ipset -N adblocklist iphash
ipset -A -exist adblocklist <ipaddress1>
ipset -A -exist adblocklist <ipaddress2>
iptables -A OUTPUT -m set --match-set adblocklist dst -j DROP
