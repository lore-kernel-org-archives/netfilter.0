From: "Travis Crook" <travis@visionsbeyond.com>
Subject: Re: Outgoing SMTP Mystery
Date: Tue, 4 Jun 2002 16:59:22 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <000001c20c1c$29976340$6702a8c0@mindtrip.com>
References: <013601c20c15$cba57520$52cfd3cf@michael> <200206042237.g54MbOA10863@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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

My bad.  I will fix the rule so that anything going out the internal
interface will have the ip of the internal interface!

Thanks for pointing that out.

Travis Crook
Visions Beyond

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Tuesday, June 04, 2002 4:37 PM
Subject: Re: Outgoing SMTP Mystery


> On Tuesday 04 June 2002 11:18 pm, Michael Hudin wrote:
>
> >  I can send SMTP out just fine, but no other server can send it in for
some
> > reason.
>
> > -A POSTROUTING -o eth0 -j SNAT --to-source 10.10.10.254
> > -A POSTROUTING -o eth1 -j SNAT --to-source 10.10.10.254
>
> I really don't like the look of those two rules together.   You're saying
> that any packet going out of the external interface should bear the source
> address of the external interface - pretty standard.   But you're also
saying
> that any packet going out of the *internal* interface should also have the
> source address of the external interface - why ???
>
> Do you have any access control rules on your SMTP server - is it fussy
about
> the IP addresses it accepts connections from ?
>
> What happens if you telnet to port 25 on the mail server from your
firewall ?
>
>
> Antony.
>
>


