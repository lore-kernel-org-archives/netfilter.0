From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IMHO - Re: Deleting Connection Tracking information
Date: Tue, 9 Jul 2002 00:37:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708233749.CVCB23840.mta03-svc.ntlworld.com@there>
References: <AE696B0F5B44A348B8D18E40F976D9571BA92E@mailsrv.etagon.com> <200207081143.g68Bh6806571@vulcan.rissington.net> <20020708234917.9B08E2A@bob.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020708234917.9B08E2A@bob.localdomain>
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

On Tuesday 09 July 2002 12:49 am, Allen wrote:

> On Monday 08 July 2002 11:43 am, Antony Stone wrote:
> > On Monday 08 July 2002 1:31 pm, Tsachi Sharfman wrote:
>
> snips
>
> > However, a more serious problem is what do you possibly want to change in
> > the NAT rules for a connection which is currently in progress, which
> > isn't going to seriously upset either the client or the server on the
> > ends of the connection ?
>
> I have to say something about this.
>
> Remember Mosix ?

Yes, indeed.   It always struck me as a better way to do Beowulf....

> One of the things 'they' are supposed to be working on is a sort of
> "portable socket".

I agree with all your comments regarding this, however I thought that part of 
the Mosix networking activity was to transfer the MAC and IP addresses around 
the machines (a bit like the way VRRP does it) so that something on the other 
end of the network link doesn't realise it's not always talking to the same 
machine...

Mosix ideas about moving network sockets between machines in 
mid-communication are all very well, but I think a key element of the process 
is that the source & destination IP addresses remain the same, even if the 
actual machines don't.   Therefore changing your NAT rules halfway through 
would still not be a good idea ?

 

Antony.

