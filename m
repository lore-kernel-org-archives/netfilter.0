From: John covici <covici@ccs.covici.com>
Subject: Re: How to send all packets to a router
Date: Sun, 6 Apr 2003 03:44:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16015.56045.84215.194035@ccs.covici.com>
References: <3C792059.865B267B@acabtu.com.mx>
	<200302242211.38647.netfilter@newkirk.us>
	<m3znnasv2z.fsf@ccs.covici.com>
	<Pine.LNX.4.53.0304060038300.19710@light.webcon.net>
Reply-To: covici@ccs.covici.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0304060038300.19710@light.webcon.net>
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
To: Ian Morgan <imorgan@webcon.ca>
Cc: netfilter@lists.netfilter.org

Turns out that the whole thing works if I take rp_filter off that
interface and omit the tcp rule from the POSTROUTING chain.  Strange!

on Sunday 04/06/2003 Ian Morgan(imorgan@webcon.ca) wrote
 > On Mon, 31 Mar 2003, John Covici wrote:
 > 
 > > iptables -t nat -A POSTROUTING -o eth1 -j SNAT -p tcp --sport 25 --to <ip address for eth1>
 > > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to <ip address for ppp0>
 > > 
 > > I thought I would need something for the output chain as well, but I
 > > kept getting invalid argument when I tried to put the same rule into
 > > the output chain like the one I put into the POSTROUTING chain.
 > > 
 > > So what am I doing wrong here?
 > 
 > I've noticed that for every release in the 2.4.21-pre series, I have to
 > rebuild iptables, otherwise I get "invalid argument" on the SNAT rules.
 > _VERY_ annoying. A simple rebuild solves the prob though.
 > 
 > Regards,
 > Ian Morgan
 > 
 > -- 
 > -------------------------------------------------------------------
 >  Ian E. Morgan          Vice President & C.O.O.       Webcon, Inc.
 >  imorgan@webcon.ca          PGP: #2DA40D07           www.webcon.ca
 >     *  Customized Linux network solutions for your business  *
 > -------------------------------------------------------------------

-- 
         John Covici
         covici@ccs.covici.com

