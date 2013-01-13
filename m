From: Sebastian Poehn <sebastian.poehn@googlemail.com>
Subject: Re: How to use TROXY target only for specific outgoing interface
Date: Sun, 13 Jan 2013 17:39:29 +0100
Message-ID: <1358095169.1668.9.camel@localhost.localdomain>
References: <1358067281.1669.27.camel@localhost.localdomain>
	 <alpine.LNX.2.01.1301131229450.31714@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version
         :content-transfer-encoding;
        bh=hX3fcK+TpbfgzVlscA0R4n2dQpb2sAOqMWkfBo70+0Q=;
        b=YC4pysoLC/a+rwPlP5U0E0y0M2f4mua55R5tGZ+x3sqR8RQ4HTtrpxiNmTsjlYeI2c
         xlieo/S0bTirgQfM/oy+8Q158jIs/fpcox959nepyXdvqakuqzvG/6fHjDEwQKGB88Ex
         Pkdk1VothClVXdK+ln8WPEegTxkNcXAH6anJQLdhRZJrWilkyZdCVy+/DbepgPxB5szV
         lydeSohzJx0pdxdjKj+enl/tg08fEiVPbtn2S4T9bJfdZBp/UJSqDAVFAtbGvQpozJ+9
         u9FD970aOvdzR2KwlAFNY3qxCo6I7pTdXVXi7/rpxk2awocyO0xfFlx28vjJ1bp9maT0
         qh3w==
In-Reply-To: <alpine.LNX.2.01.1301131229450.31714@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

For a simple setup this is more than sufficient. But I want to realize
something with dynamic routing. So to clarify:

        ospf            lan1 ############                                 
local3 <----> local1 <-------#  ROUTER  # wan                            
                             #    +     #-------------> internet                       
              local2 <-------#  TPROXY  #                            
                        lan2 ############       

For me it's not possible to even know every subnet which is on the local
side. It would even be possible that there is a multi-homed environment
with e.g. local3 connected to the internet, too. (Thank means that even
a non-local destination could go from local2, via lan2, lan1, local1 and
local3 to the "internet" ).

Thank for your reply Jan

On Sun, 2013-01-13 at 12:30 +0100, Jan Engelhardt wrote:
> On Sunday 2013-01-13 09:54, Sebastian Poehn wrote:
> 
> >I want to run a tcp transparent proxy ( with TPROXY ) processing only traffic outgoing a specific interface. That's what my setup looks like:
> >                                                      
> >                                                        
> >                   lan1 ############                                
> >    local net 1 <-------#  ROUTER  # wan                            
> >                        #    +     #-------------> internet                       
> >    local net 2 <-------#  TPROXY  #                            
> >                   lan2 ############                                
> >                                                        
> 
> -A PREROUTING -j foo
> forall LAN subnets
> 	-A foo -d $lan -j RETURN
> -A foo -j TPROXY


