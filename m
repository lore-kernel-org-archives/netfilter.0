From: Kevin Bailey <ke-linux@retriever.dyndns.org>
Subject: Pre-routing re-write
Date: Wed, 14 Oct 2009 16:10:17 -0700
Message-ID: <20091014231016.GA4580@retriever.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to get a re-write rule to occur after routing has occured.
My host has the address 192.168.10.1 and a gateway of 192.168.10.2
to 192.168.11.0/24.

The re-write rule I have is:

# Map 11 net to 10 net
iptables -t nat -A OUTPUT -d 192.168.11.0/24 -j NETMAP --to 192.168.10.0/24

It does the re-write but, as far as I can tell, isn't using the
default gateway to 192.168.11.0/24.

I assume a POSTROUTING rule might do this, but when I use the
POSTROUTING queue, it doesn't do the translation. Using mangle
or DNAT produce an error, not surprisingly.

Is there any way to do this ?
