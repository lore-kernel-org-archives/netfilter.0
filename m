From: Saad Faruque <faruque@gmail.com>
Subject: Re: OT: alias for a network card
Date: Mon, 19 Jul 2004 17:09:08 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1d7da3f4040719040913573749@mail.gmail.com>
References: <f51b72bc0407150121527f95a4@mail.gmail.com> <20040715122848.GA40604@itstud.chalmers.se> <f51b72bc0407180614219a2bd7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <f51b72bc0407180614219a2bd7@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

rc.local is not the best place to place your initializing script

On Sun, 18 Jul 2004 18:44:12 +0530, Payal Rathod <payalrathod@gmail.com> wr=
ote:
> Hi,
> On Thu, 15 Jul 2004 14:28:48 +0200, Erik Wikstr=F6m
>=20
> > Find out what script starts the firewall and put the line before the
> > line starting the firewall. Or, put it in the firewall script. Or even
> > better, put it in the script that initializes your network card.
>=20
> I think I got it licked. BTW, is initializing IPs in /etc/rc.local a
> bad practice?
>=20
> With warm regards,
> -payal
>=20
>

