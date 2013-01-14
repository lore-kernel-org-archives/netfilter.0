From: Sebastian Poehn <sebastian.poehn@googlemail.com>
Subject: Re: How to use TROXY target only for specific outgoing interface
Date: Mon, 14 Jan 2013 20:12:15 +0100
Message-ID: <1358190735.2257.12.camel@localhost.localdomain>
References: <1358067281.1669.27.camel@localhost.localdomain>
	  <alpine.LNX.2.01.1301131229450.31714@nerf07.vanv.qr>
	 <1358095169.1668.9.camel@localhost.localdomain>
	 <50F33624.3010208@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=mgEgUiheUkhr7g88wfeSS0LU6IogQalyq5OnC5cqOwA=;
        b=psL18oq462dhgHSdnBGkBTauxLyh8O+vxPIOHeZgLP/gVKNJiE6GQEyboWHsE0qSnp
         Kz9jibSEGtOBRnB4wQ/E/KpdWRLpeLttwnaJ76sH5uOXwk0EtherJ8svBfGuBYt6fszc
         nlFCRdJQOtSymIZXtXlhiQC2w+3fCKaGrkNrYGtewJzPtB6jHbVXC4urXOU8AKQu8Cds
         rRTeI7TQ+nub4fKluIW0RPpuWz34554jclRnXStSZ95zLXxch/qszWk71Ua1Jd4eNYbf
         hP+Ya3GYSRQoIARGptJLMHLbxH0hr1yp9JExRNA52XbeiPl9+FeCs5qffddkIIGS0vzI
         FsNg==
In-Reply-To: <50F33624.3010208@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: jengelh@inai.de, netfilter@vger.kernel.org

I've drawn a new picture. We want to connect from Node 1 to the 'internet'. All traffic via wan1 shall be proxied, traffic over lan1 not.

The only valid match for this situation is the outgoing interface ( oif == wan1 do proxy, else no proxy). It is not possible to match for
dst networks, as routing metrics may change and so even the use of wan1 or wan2 (for the uplink).

I can not -A POSTROUTING -o wan1 -j TPROXY as TPROXY must be called in PREROUTING (there -o is not present).

               internet
  ____________________________________
   A                              A
   |wan1                          |wan2
   |                              |
#########      #########      #########
#ROUTER1# lan1 #ROUTER2# lan3 #ROUTER3#
#   +   #<---->#       #<---->#       #
#TPROXY #  igp #       # igp  #       #
#########      #########      #########
   |
   | lan2
   |
#########
# NODE 1#
#       #
#       #
#########






On Mon, 2013-01-14 at 00:33 +0200, Eliezer Croitoru wrote:
> If you would give an ip example rather then a sketch I think I have an 
> idea on how to do it using some local routing daemon on the router machine.
> 
> Another thing to notice is that if you are using tproxy it should be 
> used based on a known network data or globally with specific exceptions.
> else then these situation you will need to plan some iptables structure 
> to fit maybe ipset or any other way of organizing the dynamic tproxy rules.
> 
> Eliezer
> 
> On 1/13/2013 6:39 PM, Sebastian Poehn wrote:
> > For a simple setup this is more than sufficient. But I want to realize
> > something with dynamic routing. So to clarify:
> >
> >          ospf            lan1 ############
> > local3 <----> local1 <-------#  ROUTER  # wan
> >                               #    +     #-------------> internet
> >                local2 <-------#  TPROXY  #
> >                          lan2 ############
> >
> > For me it's not possible to even know every subnet which is on the local
> > side. It would even be possible that there is a multi-homed environment
> > with e.g. local3 connected to the internet, too. (Thank means that even
> > a non-local destination could go from local2, via lan2, lan1, local1 and
> > local3 to the "internet" ).
> >
> > Thank for your reply Jan


