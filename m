From: Noah Slater <nslater@gmail.com>
Subject: Re: Problem with APT-GET (ftp) and iptables
Date: Thu, 23 Dec 2004 19:25:36 +0000
Message-ID: <9ea1c118041223112513c5013@mail.gmail.com>
References: <9ea1c1180412230959363e647c@mail.gmail.com>
	<1103826788.6478.90.camel@hubcap.ljm.dom>
Reply-To: Noah Slater <nslater@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103826788.6478.90.camel@hubcap.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hey,

Thanks for the reply.=20

This is too what I thought. I sent an email to my server admins who
responded thusly:

>> Hello,
>>
>>I am trying to setup my iptables to be quite strict, but to alow FTP
>>connections.
>>
>>I am trying to use modprobe with ip_conntrack_ftp for this but I keep
>> hitting a brick wall trying to get this to work.
>
>Hi Noah, our kernels do not support modules but do have the
>conntrack_ftp module built in so you don't need to worry about
>modprobing it to get it to work.

Also, when I start apt-get you see the following line in /var/log/messages/

Dec 23 17:45:18 achilles kernel: conntrack_ftp: partial 227 =A02850985299+2=
7

So I naturaly assumed that conntrack_ftp was loaded.

Is "conntrack_ftp" the same as "ip_conntrack_ftp" and what does this
line in the log meen. I have googled for ages but not found anything.

Any further help would be amazing. Thank you.

Noah Slater

On Thu, 23 Dec 2004 13:33:08 -0500, Jason Opperisano <opie@817west.com> wro=
te:
> On Thu, 2004-12-23 at 12:59, Noah Slater wrote:
> > Hello,
> >
> > I have a question regarding iptables and apt-get. I have a shell
> > script which is included at the bottom of this email which sets up
> > iptables for me. The only problem is that it is not managing to track
> > apt-get's ftp connections and prevents me from using it. I have
> > included a tail of /var/log/messages and the output when I try to run
> > apt-get.
> >
> > It seems to be failing to let ftp connections back into my box.
> >
> > I would be more than appreciative if someone could point out where I
> > am going wrong.
>=20
> it appears as though you don't have "ip_conntrack_ftp" loaded;
> therefore, there's nothing to recognize that the SYN from the FTP server
> is RELATED.
>=20
> -j
>=20
> --
> "That's it! You people have stood in my way long enough. I'm going
>  to clown college!"
>         --The Simpsons
>=20
>

