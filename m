From: Sebastian Poehn <sebastian.poehn@googlemail.com>
Subject: Re: How to use TROXY target only for specific outgoing interface
Date: Tue, 15 Jan 2013 19:37:40 +0100
Message-ID: <1358275060.1792.8.camel@localhost.localdomain>
References: <1358067281.1669.27.camel@localhost.localdomain>
	   <alpine.LNX.2.01.1301131229450.31714@nerf07.vanv.qr>
	  <1358095169.1668.9.camel@localhost.localdomain>
	  <50F33624.3010208@ngtech.co.il>
	 <1358190735.2257.12.camel@localhost.localdomain>
	 <50F54560.4080200@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=OcvQFvHomMIh/wfXflD3tmCgnREFZ1Gw1ltqSh4PCwI=;
        b=CA84rYbZFQrfiv1BtFgS5ukMcuhycOrOb42Tp3+m2XJ52qvOvwLhsaTkue4V4irRDM
         zrDCVgDGFkGtDh5n4t6IYL8gtiTHYKT1OFplmH7g5YV8vnAsT7huv8/BzeAeJkRwWtaa
         v8kQUH8b2i57ADy0N3fTMU9bgemCYDUJdMNJnR/SzQz3XtI/LnQGNydICrUFpx6ob8Kt
         n5K/OetKaRTnmMMfnRw5LtLdh9PkiI6UnOJQQGXTDD/OjR+PyqqZJ4LuhbtPPjsatkSG
         ryeO0mpRkMh0eoG98FJQgi1HJIVq8U34wxWz389iNpAyu8RG29EWE49jrrCbiFu20mR8
         GAag==
In-Reply-To: <50F54560.4080200@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: jengelh@inai.de, netfilter@vger.kernel.org

Thanks Eliezer. You are right. Creating a ipset containing all routes is
the only thing you can do in PREROUTING. As this solution is not useable
for me, I ended up writing a small piece of code taking a packet from
NFQUEUE and performing a nexthop lookup and outgoing if and accordingly
setting a fwmark.

-m mark --mark LOCAL -j CONNMARK --set-mark LOCAL
-m mark --mark WIDE -j CONNMARK --set-mark WIDE
-m connmark --mark LOCAL -j ACCEPT
-m connmark --mark WIDE -j TPROXY
-m TPROXYTRAFFIC -j NFQUEUE

Notice the usage of connmark so only one lookup is needed for a stream. 

On Tue, 2013-01-15 at 14:02 +0200, Eliezer Croitoru wrote:
> On 1/14/2013 9:12 PM, Sebastian Poehn wrote:
> > I've drawn a new picture. We want to connect from Node 1 to the 'internet'. All traffic via wan1 shall be proxied, traffic over lan1 not.
> >
> > The only valid match for this situation is the outgoing interface ( oif == wan1 do proxy, else no proxy). It is not possible to match for
> > dst networks, as routing metrics may change and so even the use of wan1 or wan2 (for the uplink).
> >
> > I can not -A POSTROUTING -o wan1 -j TPROXY as TPROXY must be called in PREROUTING (there -o is not present).
> >
> >                 internet
> >    ____________________________________
> >     A                              A
> >     |wan1                          |wan2
> >     |                              |
> > #########      #########      #########
> > #ROUTER1# lan1 #ROUTER2# lan3 #ROUTER3#
> > #   +   #<---->#       #<---->#       #
> > #TPROXY #  igp #       # igp  #       #
> > #########      #########      #########
> >     |
> >     | lan2
> >     |
> > #########
> > # NODE 1#
> > #       #
> > #       #
> > #########
> >
> >
> Hey there,
> 
> Thanks for the new picture.
> I understand what is your problem since it's a very common concept.
> But you must understand that most of TPROXY systems are very static.
> 
> Take a deep breath and accept(like a server\socket) that the connections 
> can be intercepted only in a prerouting table.
> what I do suggest you is to use a synamic ipset to allow you this 
> specific thing you need.
> 
> Since you can only use ip addresses as a match in the prerouting or an 
> incoming interface.
> Your problem is that you are using IGP which limits you to a specific 
> protocol which I think BIRD or QUAGGA doesn't work with.
> 
> What you can do if it was another protocol is to run a cron task every 
> once in a while to make sure the routing tables are still the same or 
> not and in a case of change to update an ipset that you will use to 
> either bypass or intercept the traffic into.
> 
> If you are working with ROUTING protocols it should be simple to know 
> what traffic is being routed to WAN1.
> 
> Best regards,
> Eliezer
> 


