From: Roland Kaeser <roli8200@yahoo.de>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 16:11:42 +0100 (CET)
Message-ID: <20050112151142.79460.qmail@web26102.mail.ukl.yahoo.com>
References: <1105537635.3751.22.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105537635.3751.22.camel@hubcap.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Hi

I got a look at the proposals You made. I tried it to compile but all I got was
frustration, frustration and more. On the bottom-line snort-inline is a crap because
it depends on very old software (libnet, which has itself a lot of bugs) and trying
to compile it on a halfway actual system brings to to the mental hospital.  This
makes it more frustrating becaus of the string match isn't our primary security part
it should only prevent the servers from most common attacks to bring the load down.
All traffic goes through reverse (or "normal") proxies which enables the application
level firewall. I JUST WANT TO RUN THE IPT_STRING ON A KERNEL 2.6.

Roland


 --- Jason Opperisano <opie@817west.com> schrieb: 
> On Wed, 2005-01-12 at 03:30, Roland Kaeser wrote:
> > Hi all
> > 
> > I know this was subject of many conversations, but I need this feature very
> > urgently!
> 
> 1) the string match is a toy for firewall kiddies to play with.  it
> offers nothing of any value to real packet data inspection situations. 
> the lack of effort to port it to 2.6 is a reflection of this fact.
> 
> 2) if this a mission-critical need (definition:  without the string
> match on a 2.6 kernel, people will die), you are certainly free to port
> it or rewrite yourself--the code is there.  if you don't have the skill
> to code it yourself--pay someone who does; after all, people's lives are
> at stake here.
> 
> since i don't want to be partly responsible for the spilling of innocent
> blood--have you looked at snort-inline [1]?  snort offers the things
> that real packet data inspection requires:  fragment reassembly,
> matching across packets, matching at a specific locations in a packet,
> matching multiple strings within a packet, understanding of connection
> flow, context-specific matching, layer 7 protocol decoding and
> normalization, pcre matching...and those are the ones i can think of off
> the top of my head.
> 
> the string match is rice [2].
> 
> -j
> 
> [1] http://snort-inline.sourceforge.net/index.html
> [2] http://funroll-loops.org/
> 
> --
> "Ah, beer, my one weakness. My achilles heel, if you will."
> 	--The Simpsons
> 
> 
>  


	

	
		
___________________________________________________________ 
Gesendet von Yahoo! Mail - Jetzt mit 250MB Speicher kostenlos - Hier anmelden: http://mail.yahoo.de

