From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 3 Jun 2002 00:39:02 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603043902.GB19986@cannon.eng.us.uu.net>
References: <20020602235256.95544.qmail@web10408.mail.yahoo.com> <WSGDLFLA3X52NIF0YX05RNGD1YTR93.3cfaf1a2@ALEXEY>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <WSGDLFLA3X52NIF0YX05RNGD1YTR93.3cfaf1a2@ALEXEY>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Talikov <alexey_talikov@texlab.com.uz>
Cc: netfilter@lists.samba.org, Art Reisman <astormchaser2002@yahoo.com>

On Mon, Jun 03, 2002 at 09:33:38AM +0500, Alexey Talikov wrote:

> Its issue of switch it create virtual chanell for packet
> if your ip 192.168.1.2 
> you can't see packets from 192.168.1.1 to 192.168.1.3 etc
> only broadcast and arp
> Solution:
> use hub or if exist monitoring port on switch

That's what he's been saying (see below). Any other suggestions??

Ramin

> 
> 03.06.2002 4:52:56, Art Reisman <astormchaser2002@yahoo.com> wrote:
> 
> >It is my understanding with my network interface in
> >promisc mode, that I should be able to see all network
> >packets on my LAN with tcpdump (no parameters).
> >
> >For some reason I am not seeing IP traffic unless it
> >is destined for me or a broadcast. I replaced my HUB
> >with very old model to insure that it was not
> >switched.
> >
> >Do I need to restart my interface after setting
> >promisc mode?
> >
> >__________________________________________________
> >Do You Yahoo!?
> >Yahoo! - Official partner of 2002 FIFA World Cup
> >http://fifaworldcup.yahoo.com
> >
> 
> -----------------------------------
> mailto:alexey_talikov@texlab.com.uz
> BR
> Alexey Talikov
> FORTEK
> -----------------------------------
> 
> 

