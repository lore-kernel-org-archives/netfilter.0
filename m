From: Ruben I Safir <ruben@mrbrklyn.com>
Subject: Re: Simple Packet Forwarding
Date: Tue, 25 Jun 2002 11:19:02 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625111902.A3037@www2.mrbrklyn.com>
References: <20020625110630.G2549@www2.mrbrklyn.com> <200206251514.QAA20663@slate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206251514.QAA20663@slate.rockstone.co.uk>; from Antony@Soft-Solutions.co.uk on Tue, Jun 25, 2002 at 11:14:22 -0400
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Yes - well

Those are the ip addesses I've been assigned 

So my routing is a lot ip addresses host assignemnt




On 2002.06.25 11:14 Antony Stone wrote:
> On Tuesday 25 June 2002 4:06 pm, Ruben I Safir wrote:
> 
> > I have a simple network with a gateway to DSL running on the ipaddess
> >
> > Internet <-->216.254.112.136(eth1 gatway machine eth0)<-->216.254.112.135
> > <-->INTERNAL NETWORK
> 
> This is not my idea of a "simple network" :-)
> 
> You have assigned two addresses from the same network range to different 
> ethernet cards on one machine.
> 
> It will be horribly upset and confused by this.
> 
> Change one of them so that you have two different network ranges on the two 
> sides of your firewall and life will become an awful lot simpler and easier 
> to handle.
> 
>  
> 
> Antony.
> 
-- 
__________________________

Brooklyn Linux Solutions
__________________________
http://www.mrbrklyn.com - Consulting
http://www.brooklynonline.com - For the love of Brooklyn
http://www.nylxs.com - Leadership Development in Free Software
http://www.nyfairuse.org - The foundation of Democracy
http://www2.mrbrklyn.com/resources - Unpublished Archive or stories and articles from around the net
http://www2.mrbrklyn.com/mp3/dr.mp3 - Imagine my surprise when I saw you...
http://www2.mrbrklyn.com/downtown.html - See the New Downtown Brooklyn....

1-718-382-5752




