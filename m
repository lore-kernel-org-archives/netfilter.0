From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: (no subject)
Date: Mon, 17 Jun 2002 17:54:55 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJCEHGDOAA.jpatterson@asgardgroup.com>
References: <200206172020.g5HKKxA20479@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206172020.g5HKKxA20479@Networker.rockstone.co.uk>
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
To: netfilter@lists.samba.org

A little bit of expansion on this:

Without the ESTABLISHED rule in the input chain, that server would not have
been able to make any connection to *any* server, including, but not limited
to, itself.  So if you were to try to ssh from that box to anywhere else (or
telnet, or ftp, or web browse, or pretty much anything), it would fail.

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
> Sent: Monday, June 17, 2002 4:21 PM
> To: netfilter@lists.samba.org
> Subject: Re: (no subject)
>
>
> On Monday 17 June 2002 9:05 pm, James Mello wrote:
>
> > Hrm... This did fix the problem, but I'm still not sure why the heck
> > connections other than those from localhost did work. Any ideas?
>
> Yes.   Your original ruleset allowed packets into the INPUT chain if they
> were to destination port 22, and allowed all packets out of the
> OUTPUT chain.
>
> A remote client connecting by SSH will connect to port 22 through
> the INPUT
> chain (allowed) and the reply packets go out of the OUTPUT chain
> (allowed).
> All further packets in the session continue coming in on port 22
> (allowed)
> and going out through the OUTPUT chain (allowed).   Therefore the remote
> client works.
>
> The local client, though, connects to port 22 (allowed) and then
> the server
> tries to reply to the client (also on the local machine) on port
> 32783 (or
> whatever), and this has to go out through the OUTPUT chain and
> back in again
> on the INPUT chain - which was not allowed, therefore the local
> connection
> failed.
>
>
>
> Antony.
>
>
>


