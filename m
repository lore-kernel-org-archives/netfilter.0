From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: UDP packet forwarding woes
Date: Mon, 11 Nov 2002 22:21:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111222118.I19115@funkyjesus.org>
References: <Pine.SOL.4.44.0211101348250.13079-100000@azure.engin.umich.edu> <20021110190751.HOVX18329.mta06-svc.ntlworld.com@there>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021110190751.HOVX18329.mta06-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Sun, Nov 10, 2002 at 07:07:50PM +0000
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
To: netfilter@lists.netfilter.org

On Sun, Nov 10, 2002 at 07:07:50PM +0000, Antony Stone wrote:
> On Sunday 10 November 2002 6:49 pm, Cynthia Wong wrote:
> 
> > I'm trying to do the following with iptables:
> >
> > Recieve a UDP packet;
> >
> > forward it to multiple hosts in forwarding table (minus a TTL or so)
> > AND
> > pass it to user level to process
> 
> Nope.   Not with netfilter.

What's the particular UDP packet?  SNMP?  Sounds like you're trying to do
something best handled by a dedicated application.

-- 
FunkyJesus System Administration Team


