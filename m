From: Andrew Kraslavsky <andykras@hotmail.com>
Subject: RE: policy based routing question
Date: Wed, 5 Dec 2007 19:43:38 -0800
Message-ID: <BAY119-W11F48CE40651F810C15CBD66F0@phx.gbl>
References: <fj7m77$n14$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fj7m77$n14$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Neal Becker <ndbecker2@gmail.com>, netfilter@vger.kernel.org


> I'm interested in implementing policy based routing on a system with
> multiple interfaces. I'd like to use some kind of classifier to determine
> the type of traffic associated with a packet. I know iptables/mark + ip
> route can be used to classify packets by port #, but that isn't always
> sufficient.
>

Perhaps I have misunderstood your question but...all of the matches that are valid/meaningful in the mangle table's PREROUTING chain are at your disposal!

For example, assuming you define advanced routing rules that use mark 0x01 for your primary interface and mark 0x02 for your secondary interface and you wanted all outgoing HTTP traffic fron local subnet 192.168.10.0/24 to go out your primary interface and you wanted all outgoing HTTP traffic from local subnet 192.168.20.0/24 to go out your secondary interface you could use:

iptables -t mangle -A PREROUTING -s 192.168.10.0/24 -p tcp --dport 80 -j MARK --set-mark 0x01
iptables -t mangle -A PREROUTING -s 192.168.20.0/24 -p tcp --dport 80 -j MARK --set-mark 0x02

The appropriate matches to use would of course depend on what your interests are (classify by source IP address? source MAC address? input interface? destiantion port? etc...).

Putting it another way, beyond port number and the examples listed above or all that is covered on the iptables man page, what kind of classification are you after?

- Andrew
_________________________________________________________________
Connect and share in new ways with Windows Live.
http://www.windowslive.com/connect.html?ocid=TXT_TAGLM_Wave2_newways_112007