From: Scott Waye <scott@boldtower.com>
Subject: Re: netmeeting from msn messenger
Date: 31 May 2002 20:15:05 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <1022872507.305.3.camel@cali>
References: <001b01c206e1$52ccffd0$3b0110ac@kovaiteam>
	<1022703963.303.13.camel@cali>  <007901c20861$690f5e60$3b0110ac@kovaiteam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <007901c20861$690f5e60$3b0110ac@kovaiteam>
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
To: shadha <shadhanker@gmx.net>
Cc: netfilter@lists.samba.org

If you only have 1 registered IP address I don't believe you can do with
a peer to peer connection.  It may be possible if you run a Gatekeeper
and an LDAP server, but I don't really know.

On Fri, 2002-05-31 at 06:09, shadha wrote:
> Hello Scott,
> 
> thanks for your reply, but How can i get the correct person if there is more
> than ip address behind
> NATing in remote.
> 
> Thanks and Regards,
> -sadha
> 
> > On Wed, 2002-05-29 at 08:20, shadha wrote:
> > > Hello all,
> > >
> > >        Did anybody tried Netmeeting open from msn messneger with H323
> > > module.
> > I believe that when you use messenger it normally gets your internal ip
> > address, so when someone tries to contact you through the messenger
> > window, it tries to connect to that internal address (e.g. 192.168.1.1)
> > which of course will not arrive at your machines.
> >
> > The way I use NetMeeting from an internal machine, is to start
> > NetMeeting directly, then place a call to the ip address of the remote
> > user, using their external ip address if they are also behind a NATting
> > firewal.
> >
> > >
> > > thanks,
> > > -sadha
> > >
> 
> 
> 



