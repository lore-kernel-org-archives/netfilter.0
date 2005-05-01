From: itd.nam@undp.org
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Sun, 01 May 2005 13:27:24 +0100
Message-ID: <41da4e91.4e9141da@undp.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
To: netfilter@lists.netfilter.org

----- Original Message -----
From: Alistair Tonner <Alistair@nerdnet.ca>
Date: Sunday, May 1, 2005 5:10 am
Subject: Re: Linux forwarding Win XP hosts VERY slowly
> On April 30, 2005 01:41 pm, Dave Cinege wrote: 
> > I've built an advanced rotuign appliance, and I'm having 2 
> outstanding> problems, that I'm being to think are related to the 
> linux ip/netfilter 
> > stack, choking on XP traffic (possiblity XP-SP2) hosts that are 
> on the LAN. 
> > I'm running 2.4.30 at the moment. 
> > 
> > The 2 problems I'm seeing: 
> > 
> > 1) Forwarded traffic (most notably web) is VERY slow with XP 
> clients.> 
> > Example: Saw this last 2 nights ago: Appliance has a linksys 
> Wifi bridge 
> > attached to a NIC. Customer browses through the appliance to the 
> Linksys> config page. It moves like molasses. He browse to the 
> local Zope hosted 
> > made page. Slow as hell. I unplug his machine, and plug my linux 
> laptop> into same switch port. Linksys and Zope pages load adn 
> reload instantly. 
> > Plug his machine in....slow again. 
> > 
> > 2) Zope serves user interface pages for the appliance. Zope has been 
> > locking solid for no apparent reason, but only when and Windows 
> host is 
> > attached. The trick is SOME windows machine don't seem to cause 
> a problem. 
> > Example: 
> > I worked with a unit for 3 days using a customers XP desktop. 
> Not a hiccup. 
> > My partner came in and attached to the network and starting 
> connect to our 
> > appliance with his XP laptop. Within 15 minutes Zope was hung. 
> > 
> 
> I would strongly suspect the XP box has a b0rken TCP stack 
> happening. One 
> thing that some windows systems will do is flat out ignore the TCP 
> MTU/window 
> size settings on the network, especially if you've a) set them up 
> for modem 
> dialup b) installed anything that is supposed to automatically 
> improve your 
> internet speed c) hard wired (EVER) the MTU settings. I had a 
> win2k box that 
> had this sort of issue once, and even though it was at that time 
> set to use 
> default settings for MTU/max recieve window and the like, I had to 
> completely 
> uninstall the tcp stack, the network card driver, all modem bits 
> etc and 
> reinstall em from scratch to get it to behave normally. For the 
> record, 
> Ethereal dumps of the communications CLEARLY show that the windows 
> box is 
> using bad MTU settings and bad TCP window sizes, if this is the case. 
> 
> I *still* believe that there are settings left on that box (still 
> in use these 
> days) that cause issues periodically. Cant wait to get it out of 
> service 
> later in May. 
> 
> Hmm ... Grant T has the same drift (darn ... mail filters are 
> busy tonight -- 
> must be lots of spam in this round ... took Grants mail 6 minutes 
> to get into 
> the box after yours....) 
> 
> Alistair Tonner 
> 
> > I'm really lost. ANY ideas out there? 
> 
>
Have a look at the WXP computer if patch KB893066 is installed as this one changes some default TCP window size. I had a whole LAN down before stumbling across this is one. Once removed everything worked fine. Here is the KB article from MS :

http://support.microsoft.com/default.aspx?scid=kb;en-us;893066 

Hope this helps you ...

Enjoy your day,

Bernd Lippert


