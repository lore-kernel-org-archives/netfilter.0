From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Port Forwarding Problem
Date: Wed, 26 Feb 2003 15:07:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030226150727.05f080f4.arnt@c2i.net>
References: <3E5BB0BF.2070401@openadventures.org>
	<20030226042038.75c8a032.arnt@c2i.net>
	<3E5C3DEE.70104@openadventures.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E5C3DEE.70104@openadventures.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Tom Smith <tom@openadventures.org>
Cc: netfilter@lists.netfilter.org

On Tue, 25 Feb 2003 21:09:18 -0700, 
Tom Smith <tom@openadventures.org> top posted, er, top mailed in 
message <3E5C3DEE.70104@openadventures.org>:
> 
> Arnt Karlsen wrote:
> 
> >On Tue, 25 Feb 2003 11:06:55 -0700, 
> >Tom Smith <tom@openadventures.org> wrote in message 
> ><3E5BB0BF.2070401@openadventures.org>:
> >
> >  
> >
> >>RedHat 7.3 w/ Kernel 2.4.9-13
> >>    
> >>
> >
> >..you want 2.4.18-24.7.x, _several_ errata fixes.
> >
> >  
> >
> 
> 
> Yeah, I'm planning for that. Problem is...I have to have PPTP support 
> and I simply haven't had the time to test the latest PoPToP-enabled 
> kernel (2.4.18-18).

..get the "kernelmod" tarball instead, install 2.4.18-24.7.x, 
reboot to that, and run kernelmod, to make your own. 
Find it over at the poptop sourceforge site.

..more people may need this, so I cc.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



