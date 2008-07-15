From: Arnaud MARTIN <arnaud@bsa.net.my>
Subject: Re: ebtables brouting of all tcp and udp traffic
Date: Tue, 15 Jul 2008 17:25:53 +0800
Message-ID: <200807151725.53633.arnaud@bsa.net.my>
References: <200807151526.21545.arnaud@bsa.net.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200807151526.21545.arnaud@bsa.net.my>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I think I found the solution. I just needed to replace the 2nd rule by:

ebtables -t broute --flush
ebtables -t broute -A BROUTING -d $MAC_OF_BR0 -j ACCEPT
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp -i eth0 -j DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp -i eth1 -j DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto udp -i eth0 -j DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto udp -i eth1 -j DROP

Like that the traffic directed to the server itself will be processed by the bridge "as normal" and not be brouted.


