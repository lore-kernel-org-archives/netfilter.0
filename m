From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 16:31:30 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627203130.GC31466@cannon.eng.us.uu.net>
References: <NJEFLNJDIFFNMHDEBKMJCEJADOAA.jpatterson@asgardgroup.com> <20020627194405.GLHF295.mta03-svc.ntlworld.com@there> <20020627195742.GA31466@cannon.eng.us.uu.net> <20020627200655.VZLE19225.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020627200655.VZLE19225.mta07-svc.ntlworld.com@there>
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Thu, Jun 27, 2002 at 09:06:54PM +0100, Antony Stone wrote:

> On Thursday 27 June 2002 8:57 pm, Ramin Alidousti wrote:
> 
> > If I'm not wrong you can always send data even in SYN and SYN/ACK.
> > Like Patrick said the default options in the socket interface might
> > not do it but I thought I saw some tweaking in one of Richard Steven's
> > (god bless his soul) books to push traffic in SYN packets.
> 
> Is that an interesting way to get round packet filtering firewalls ?

Why? The fw would either block the SYN (in case of DENY) or let the
SYN and any subsequent packet through...

> Send enough data (eg an http request) in a SYN packet so that the application 
> does the dirty work for you, even if the packet filter isn't going to allow 
> the connection to get ESTABLISHED ?

Again, if the SYN gets through, it's very likely that the connection
will get ESTABLISHED.

> Or do you have to fiddle with the receiving socket too in order for it to 
> cope with this ?

Good question. dunno.

Ramin

> Antony.

