From: "Timothy Toole" <ttoole@toole.net>
Subject: Re: MAC Address masking/NAT
Date: Sat, 18 Oct 2008 17:22:19 -0600
Message-ID: <1460c7de0810181622t7c4c4717g47c280e3249b5596@mail.gmail.com>
References: <1460c7de0810162313t28b5cd7ete6dda27e534ae55d@mail.gmail.com>
	 <1460c7de0810171952naa78102l79536b3089035944@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=Xs67cIvKddaZ+yp5RSJY+oTMbDgF3fHNPL7hMGM54gU=;
        b=c7L8zfVssd/oIjeQ+nyz+VyFkkOJkiJoAYq4LIi39x1Rj4qOzv0WGirRnNN29j7WKN
         /VFpyFiBySkLgA9jV02XCLdF/IXruFh/HiJFkDkuezNVui3wAGQ6rxB4d3WlLk99I3+2
         nRqiH6ik/pATpqyzORL3f9vKTC2hIc1Y37f5A=
In-Reply-To: <1460c7de0810171952naa78102l79536b3089035944@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I think I found the solution (at least it works in my case). Not sure
why I couldn't figure this out earlier, it's actually quite simple.
Any packet with a source MAC address that we want to change needs a
rule, and any packet destined to out fake MAC address needs another
rule.

Starting again with the network diagram:
           ____________________
            |                    |
            |        br0         |
            |                    |
            | eth0.1      eth0.2 |
            |__/______________\__|
              /                \
             /                  \ <--- Translate MAC to
            /                    \     11:11:11:22:22:22
           /                      \
          /                        \
      ___|___                    ___|___
     |       |                  |       |
     |   A   |                  |   B   |
     |_______|                  |_______|
MAC: 00:11:22:33:44:55      MAC:55:44:33:22:11:00

We need to add two rules. The first rule will change the [real] source
MAC address to the new/faked MAC address.
# ebtables -t nat -A POSTROUTING -j snat -s 55:44:33:22:11:00 --to-src
11:11:11:22:22:22 --snat-arp

The second rule will change the any of the faked MAC address back into
the real one.
# ebtables -t nat -A PREROUTING -j dnat -d 11:11:11:22:22:22
--to-destination 55:44:33:22:11:00

Thanks to all that responded with help.

-tim
