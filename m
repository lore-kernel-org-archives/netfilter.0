From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: block kazaa
Date: Wed, 26 Mar 2003 09:06:59 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030326150659.GA29683@placemark.com>
References: <5.2.0.9.0.20030325212147.00ba2e88@mail.clara.net> <1048656618.6605.13.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1048656618.6605.13.camel@raylinux.internal>
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
Content-Transfer-Encoding: 7bit
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, Mar 26, 2003 at 07:30:19AM +0200, Raymond Leach wrote:
> On Tue, 2003-03-25 at 23:27, paulc@ibiblio.org wrote:
> > The way I block Kazaa (and the other file sharing applications) is a 
> > blanket ban on all ports by default. I then open the ports as I think is 
> > appropriate at the firewall. These only include the port 23 for anyone 
> > wishing to use telnet. All web and ftp style ports on 80, 21 and the like 
> > are handled by a web-proxy to prevent using them for other purposes. All 
> > incoming connects (and lots of ICMP messages) are dropped by the firewall also.
> > 
> How do you get passive ftp to work and not allow file sharing networks?

Do you mean active ftp?  Passive ftp uses outbound connections for
both control (20) and data (21).  Active ftp uses an inbound
connection on port 21.  Force your users to use passive ftp only.
Most clients default to that anyway.

Kelly

--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)


