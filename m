From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Port forwarding data channel
Date: Tue, 25 Jun 2002 15:14:53 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625191453.GA31466@cannon.eng.us.uu.net>
References: <E58F686B-886D-11D6-A435-000A2791C930@dwvc.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <E58F686B-886D-11D6-A435-000A2791C930@dwvc.org>
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
To: Admin <admin@dwvc.org>
Cc: netfilter@lists.samba.org

On Tue, Jun 25, 2002 at 09:01:03PM +0200, Admin wrote:

> Hi, I have no idea if if this is possible or not, but I would appreciate 
> some suggestions:
> 
> I have a server running inside our LAN and I want to be able to connect 
> to a particular daemon on this server, listening on port 5432, from 
> outside the LAN through the firewall.
> I've set up port forwarding to DNAT traffic destined for this port to 
> the LAN server. This works fine however the application opens up a 
> second 'data channel' similar to port based ftp but between two 
> unprivileged ports on the client and server.
> Is there any way to cater for this secondary connection and also do the 
> DNAT ?

If this second connection is incoming and to a static port you can
set up a second DNAT for that.

If this second connection is outgoing and from a static port you can
set up an SNAT for that.

If this second connection is to/from a dynamic port then you're
kind of out of luck and need a conntrack module (like ip_conntrack_ftp)
to do the job.

However, if you had a second valid IP then you could nail up a DNAT/SNAT
for that host...

Ramin

> Thanks
> Phill
> 

