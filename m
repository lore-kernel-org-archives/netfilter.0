From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Unassigned Networks List
Date: Sat, 8 Mar 2003 13:03:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030308130350.01e2c6ed.arnt@c2i.net>
References: <NGBBIFPIJNDPMFBPKBPGOEJIDKAA.NetFilter-Users@Compucenter.org>
	<000701c2e53d$72cc42b0$026410ac@honor>
	<1047106127.2050.56.camel@runabout.noc.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1047106127.2050.56.camel@runabout.noc.starken.com>
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
To: netfilter@lists.netfilter.org

On 08 Mar 2003 00:48:47 -0600, 
Daniel Wittenberg <daniel-wittenberg@starken.com> wrote in message 
<1047106127.2050.56.camel@runabout.noc.starken.com>:

> Just something of interest I ran into the other day with a client.  We
> moved them to a new building, and setup their new wireless connection,
> and for the life of me couldn't ping their provider, but everyone
> else. It seems their provider is using 172 and 10.x addresses for
> their wireless towers, and gateways to the internet.  So if I
> traceroute to the client I get public -> public -> private -> private
> -> private -> public.  It didn't work going out from the client at
> first because we drop all reserved addresses on the public NIC of the
> firewall, so we couldn't ping the provider.  I subsequently got in an
> "discussion" with their CTO about RFC 1918 on how it's probably not
> good to be using private IP's to route public traffic, at least IMHO.

..such discussions are better taken in public, so the hotshot can
show off his alledged competence...  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



