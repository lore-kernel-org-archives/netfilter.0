From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: simple nat question
Date: Tue, 2 Jul 2002 23:08:09 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070223080905.03048@Lms>
References: <Pine.LNX.4.30.0207021347310.7072-100000@gilgamesh.eos.SilentMedia.com> <20020702205858.OTEW2755.mta05-svc.ntlworld.com@there>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020702205858.OTEW2755.mta05-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Ben <bench@silentmedia.com>
Cc: NetFilter <netfilter@lists.samba.org>

On Tuesday 02 July 2002 22:58, Antony Stone wrote:
> On Tuesday 02 July 2002 9:51 pm, Ben wrote:
> > On Tue, 2 Jul 2002, Jan Humme wrote:
> > > No, I just wanted to point out that masquerading provides an easy way
> > > to get the desired results.
> >
> > It does, true, but the howto recommends not using MASQ for static IPs. If
> > I had just done what told me what to do instead of worrying about
> > problems that didn't exist, I wouldn't have had to post this question to
> > begin with. :)
>
> Masquerading will do almost all you want for machines on an internal
> network making contact with the Internet (ie outbound-initiated traffic),
> but you will always need specific DNAT rules if you are running a server on
> the internal network (ie Internet-initiated traffic).

Of course, you are absolutely right; my reply was too quick !

Jan Humme.

