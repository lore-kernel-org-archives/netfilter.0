From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: icmp redirect
Date: Wed, 10 Jul 2002 19:48:43 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <0207101948430B.04513@Lms>
References: <0207101911210A.04513@Lms> <20020710173930.GD25368@cannon.eng.us.uu.net>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020710173930.GD25368@cannon.eng.us.uu.net>
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
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, Jan Humme <jan.humme@xs4all.nl>
Cc: netfilter@lists.samba.org

On Wednesday 10 July 2002 19:39, Ramin Alidousti wrote:
> On Wed, Jul 10, 2002 at 07:11:21PM +0200, Jan Humme wrote:
> > I am developing an application that will eventually run on a PC with two
> > ethernet cards; unfortunately the development PC that I use has only one
> > ethernet card (eth0) and no available slots (except for one that I need
> > for another purpose).
> >
> > Doesn't matter, during the development I can have both applications use
> > eth0 instead, if I can only stop the icmp redirect messages that the
> > kernel sends back to the source, whenever it finds out that it is
> > forwarding a packet via the same eth0 interface on which it came in.
> >
> > Of course, I can choke the icmp redirect message using iptables, but is
> > there a better (proper) way, to prevent the message from being generated?
>
> On the sending host:
> # echo 0 > /proc/sys/net/ipv4/conf/*/send_redirects
>
> On the receiving host:
> # echo 0 > /proc/sys/net/ipv4/conf/*/accept_redirects
>
> should do it.

Thanks a lot; I knew there was an elegant way :-) !

Jan Humme.

