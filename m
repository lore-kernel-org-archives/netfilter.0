From: "Sven Bolt" <sven_bolt@fastmail.fm>
Subject: Re: Some webpages inaccessible through IPTables
Date: Sat, 08 Feb 2003 07:34:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030208153456.424A223F1C@www.fastmail.fm>
References: <20030207191535.84360.qmail@web40309.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030207191535.84360.qmail@web40309.mail.yahoo.com>
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
To: Kevin McConnell <kevymac@yahoo.com>, netfilter@lists.netfilter.org

No ECN is not enabled in the kernel. The sites are accessible from the
gateway itself so it's not an MTU issue. What else could it be?


On Fri, 7 Feb 2003 11:15:35 -0800 (PST), "Kevin McConnell"
<kevymac@yahoo.com> said:
> 
> --- Sven Bolt <sven_bolt@fastmail.fm> wrote:
> > Hello,
> > I saw the problem already on the list, but ther was
> > no solution to it:
> > I use an iptables-gateway 1.2.6a on debian with
> > kernel 2.4.18 with just 
> > 
> > echo 1 > /proc/.../ip_forward
> > and iptables --table at -A POSTROUTING -j MASQUERADE
> > 
> > I can access through this gateway most webpages, but
> > for example
> > www.ebay.com among several others I can't access.
> > What could the problem be?
> 
> Perhaps the kernel is compiled with ECN, and that
> particular sites firewall is "ECN braindead". Just one
> of many possibilites.
> 
> 
> =====
> Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> 
-- 
  Sven Bolt
  sven_bolt@fastmail.fm

-- 
http://fastmail.fm - Send your email first class

