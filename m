From: Esteban Ribicic <eribicic@UolSinectis.com>
Subject: RE: how to filter kazaa
Date: 22 May 2003 08:07:47 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053601667.2228.15.camel@dejawu>
References: <5.2.1.1.2.20030522181026.033a8e10@pop.skyinet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.2.20030522181026.033a8e10@pop.skyinet.net>
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
To: jaws <jaws@skyinet.net>
Cc: kisero@uolsinectis.com.ar, georgc@FARMINGDALE.EDU, netfilter@lists.netfilter.org

so i could use this on the prerouting table and marks paqeuts so then
applyen them a tc filter? 

in that case, you've save my life!


On Thu, 2003-05-22 at 07:10, jaws wrote:
> but filtering port 1214 will not solve the problem coz kazza can use other 
> ports.
> 
> At 12:58 PM 5/21/2003 -0300, eribicic@sinectis.com wrote:
> >isnt it easyer to filter ports 1214?
> >
> > > The following rule has worked for me.
> > >
> > > http://www.securityfocus.com/infocus/1531
> > >
> > >
> > > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Username: -j REJECT
> > > --reject-with tcp-reset
> > >
> > > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Network: -j REJECT
> > > --reject-with tcp-reset
> > >
> > > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-IP: -j REJECT
> > > --reject-with tcp-reset
> > >
> > > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-SupernodeIP: -j -j
> > > REJECT --reject-with tcp-reset
> > >
> > > -----Original Message-----
> > > From: tracker [mailto:jaws@skyinet.net]
> > > Sent: Wednesday, May 21, 2003 3:20 PM
> > > To: netfilter@lists.netfilter.org
> > > Subject: how to filter kazaa
> > >
> > > Hi all,
> > >
> > > Im new to this list and iptables. I would like to know how to filter kazaa.
> > >
> > > Thanks.
> > >
> > > Jaws
> > >
> > >
> > >
> >--
> >Slds.
> 
> 
> 
> 
> 
-- 
Esteban Ribicic <eribicic@UolSinectis.com>

UOL-Sinectis - Network Operation Center
Florida 537 6to - Capital Federal - Argentina
(tel directo) 54+011-4321-9107


