From: Jason <baker@cyborgworkshop.com>
Subject: Re: chance to impress the suits
Date: Fri, 28 Feb 2003 20:04:44 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0302282003460.20817-100000@alfred.home.cyborgworkshop.com>
References: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
 <200302270201.04762.netfilter@newkirk.us> <20030227134810.7728c8d5.arnt@c2i.net>
 <Pine.LNX.4.50.0302270811550.19694-100000@alfred.home.cyborgworkshop.com>
 <20030228014041.7394bcfa.arnt@c2i.net>
 <Pine.LNX.4.50.0302271518100.19962-100000@alfred.home.cyborgworkshop.com>
 <20030228173420.1a1bdc11.arnt@c2i.net>
 <Pine.LNX.4.50.0302280652440.20514-100000@alfred.home.cyborgworkshop.com>
 <20030228202435.62be6828.arnt@c2i.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030228202435.62be6828.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

> ..an idea: limit the number of connections to a level the authorized
> dos attack app _can_ handle, and to reject or reset rather than
> dropping connections?

That is what I hope to do with the iptables box running iplimit.  Except
instead of rejecting the connections Im going to redirect users to a
static page that just pretty much says "we're busy try again"

