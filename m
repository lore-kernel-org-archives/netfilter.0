From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: Question about conntrack
Date: Mon, 26 Oct 2009 08:52:16 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509E5@HSSBS.holdstead.local>
References: <4AE2F853.4010907@unipex.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AE2F853.4010907@unipex.it>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 'Michele Petrazzo - Unipex' <michele.petrazzo@unipex.it>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> Hi list,
> I have a server that nat a network lan where there are some pcs. My
> provider say me that I'm uploading contents from an high (5XXXX)
> external udp port. For see if it's true :) and which lan ip do the
> upload (of course excluding the server) I "tcpdump" the connection and
> I
> see that yes, there is an upload that goes out from the wan (that has a
> public IP) at that specific port, but no corresponding lan traffic on
> the lan port.
> 
> Here are my question: why I see the traffic on that port only on the
> external port? nat does also port translation?
> Is there another, better, solution for look for the data that I need?

Identify if it is the firewall or the lan by adding a logging rule to iptables.  We do this by setting something like this up when we really want to see what's going on (this will generate lots of data).

-I INPUT  -j LOG --log-prefix "FW I: "
-I FORWARD -j LOG --log-prefix "FW F: "
-I OUTPUT -j LOG --log-prefix "FW O: "

When finished:

-D INPUT  -j LOG --log-prefix "FW I: "
-D FORWARD -j LOG --log-prefix "FW F: "
-D OUTPUT -j LOG --log-prefix "FW O: "

If you think it's coming from the firewall itself, run "netstat -atunep" and see if there are any connections that match that port.  That should also list which app is using that port as well.
