From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Fri, 28 Jun 2002 21:00:46 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628200048.TETZ19225.mta07-svc.ntlworld.com@there>
References: <000901c1000a$8aaa63e0$4d2848c7@shaggy> <20020628194809.RPKD4626.mta02-svc.ntlworld.com@there> <20020628220220.G4136@oknodo.bof.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020628220220.G4136@oknodo.bof.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

On Friday 28 June 2002 9:02 pm, Patrick Schaaf wrote:

> Hi Antony,
>
> > Hmmm.   I thought a bridge was supposed to have the same address on both
> > interfaces.   Still, I've never set one up myself, so maybe there's more
> > than one way to do it.
>
> A bridge, by its nature, has no IP addresses at all. The original poster
> is asking about a pure router.

Ugh.   In that case I recommend using IPs from two *different* network ranges 
on the two sides of the machine !

> And you are right on spot with your observation about the ability of a
> malicious user to fake her MAC address at will. And one nice thing about
> most wireless networks is that I can just listen to the air for some time
> to learn what MAC/IP combination it is that I should fake after it became
> silent...

Indeed.   There may be anti-sniffing measures available for wired networks, 
but I know of nothing which can detect / defeat sniffing on wireless.

 

Antony.

