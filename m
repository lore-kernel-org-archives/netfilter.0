From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Redirect DHCP requests to DMZ?
Date: Wed, 23 Apr 2003 18:21:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030423182131.67061da5.arnt@c2i.net>
References: <3EA66634.2020508@blinkenlichten.de>
	<1051100353.12295.96.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051100353.12295.96.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On 23 Apr 2003 14:19:13 +0200, 
Cedric Blancher <blancher@cartel-securite.fr> wrote in message 
<1051100353.12295.96.camel@elendil.intranet.cartel-securite.net>:

> Le mer 23/04/2003 à 12:08, Carsten Maass a écrit :
> > Local LAN (192.168.20.*)
> >      |
> >      |
> >    Switch
> >      |
> >      |
> > Router/Firewall ---- DMZ (192.168.21.*)
> >      |
> >      |
> >      |
> >   Internet
> >
> > Everything runs smoothly, except for one thing: I am unable to
> > redirect DHCP request from the clients on the local LAN to the DHCP
> > server inside the DMZ.
> 
> You'll achieve this setting a DHCP Relay up. Due to what they are,
> DHCP packets cannot be routed through different IP networks (mainly
> because of destination addresses that are used).
> 
> But this kind of setup is no secure. If someones breaks into your DMZ,
> he will be able to have your LAN's configuration, and even tamper it,
> acting on DHCP stuff. That's _very bad_. DMZ compromission must not
> endanger rest of network security.
> 

..to put it short: get that dhcp server out of your dmz box 
and into a lan box (or maybe the firewall).  

..the dmz is _only_ for stuff you want me, Saddam, Osama bin Laden, 
Bill Gates, the scriptkiddies and the FBI to see.  Here, I speak 
with authority; Neither of us needs your dhcp server.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



