From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: FTP Forwarding
Date: Fri, 22 Nov 2002 14:02:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211221402.43903.roy@karlsbakk.net>
References: <FD8F124A387AD6119F7900A0D218B3210199CB@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3210199CB@hslex01.hslbz.local>
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
To: Rob Sterenborg <rsterenborg@xs4all.nl>, 'Erdal Mutlu' <emutlu@fonts.de>, 'Bantam' <netfilter@end.yorks.com>
Cc: 'netfilter' <netfilter@lists.netfilter.org>

On Friday 22 November 2002 13:02, Rob Sterenborg wrote:
> > You will also need:
> >
> > /sbin/iptables -A FORWARD -p tcp -i eth0 -o eth1 --sport 21 -j ACCEPT
>
> Doesn't the "-m state --state RELATED,ESTABLISHED -j ACCEPT" take care =
of
> all this ?

it does on my host. I'm doing DNATing of ftp too, and it works fine
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


