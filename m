From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirect to same LAN and preserve source IP
Date: Mon, 12 Jul 2004 16:31:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121631.56183.Antony@Soft-Solutions.co.uk>
References: <200407121419.40110.gdh@acentral.co.uk> <200407121438.59254.Antony@Soft-Solutions.co.uk> <200407121612.27437.gdh@acentral.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407121612.27437.gdh@acentral.co.uk>
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

On Monday 12 July 2004 4:12 pm, Gavin Hamill wrote:

> On Monday 12 July 2004 14:38, Antony Stone wrote:
> > Yes.   Just use DNAT, and make sure the Squid box is not on the same
> > subnet as the clients (so that it has to send the replies back through
> > the firewall).
>
> Ah OK, I was hoping to avoid that since the machine that runs Squid is also
> an NFS server and various other things...

How about *configuring* the clients so they use the proxy "properly" instead 
of doing transparent redirection?   Then you can keep the Squid box on the 
same subnet as the clients, and still block people trying to do TCP port 80 
straight through the firewall (only one source IP is allowed - the Squid 
box).   You also get the benefit that they can do FTP over HTTP proxying too, 
which you can't do transparently...

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


