From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: trying to get one blessed thing to work
Date: Mon, 8 Jul 2002 19:25:25 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <0207081925250B.14428@Lms>
References: <20020708123223.7107dc16.mt@open2web.com> <02070818562409.14428@Lms>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02070818562409.14428@Lms>
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
To: Mark Tessier <mt@open2web.com>, Netfilter Mailing List <netfilter@lists.samba.org>

On Monday 08 July 2002 18:56, Jan Humme wrote:
> On Monday 08 July 2002 18:32, Mark Tessier wrote:
> > I have a PC running rh7.1., which I'm trying to turn into a firewall. The
> > firewall stands between a DMZ and a LAN. I have an elaborate script which
> > I've been trying to deploy, but so far no luck. Since I really don't know
> > where to begin in terms of diagnosing my problem, I decided to see if I
> > could just ping one machine on the DMZ from another on the LAN.
> >
> > The first thing I did was to set the policy to drop for the forward chain
> > as in:
> >
> > iptables --policy FORWARD DROP
>
> => Response on my machine (and yours) is:
> iptables v1.2.1a: Unknown arg '--policy'
> Try 'iptables -h` or 'iptables --help' for more information.

Nonsense.

Please accept my sincere and humble apologies: of course your syntax is OK.

Jan Humme.

