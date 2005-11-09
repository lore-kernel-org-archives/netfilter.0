From: Dave Strydom <strydom.dave@gmail.com>
Subject: Re: ftp conntrack - nat problem
Date: Wed, 9 Nov 2005 16:38:58 +0200
Message-ID: <fc38b710511090638n1b9ae40je548e6bf42b00d5a@mail.gmail.com>
References: <FAC4E024BF776842876169173CE2F01309A4A1@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01309A4A1@mailbox.vikus.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

I dont know if i have any connection limiting, if I do then it's been
set by default somewhere, since i have never set any limiting, how
could I check?

1) I have removed the filter in the nat table, and i am still having
the problem.

2) on my main firewall i have it setup to drop, it's just on this dev
thing i have setup it all to accept just until i get work out what is
causing the problem

3) yeah i know those are floating around from the script i copied over
from the main firewall i was having the problems on, they do have
their functions (just not here though)

Dave

----------------------------
On 11/9/05, Derick Anderson <danderson@vikus.com> wrote:
> Have you checked for any connection limiting on the client or server? It
> does appear that you are opening a new port per connection.
>
> I looked at your updated script and while I don't think it is causing
> the problem, I have a couple suggestions:
>
> 1. Don't filter in the nat table - this can cause unexpected results. I
> would take out the part where you match for TCP port 20 and 21 in your
> DNAT rules and replace it with a single DNAT to your .220 server.
>
> 2. You have the default policies of all the filter chains (INPUT,
> OUTPUT, and FORWARD) set to ACCEPT. This is quite dangerous. The default
> policies for INPUT and FORWARD ought to be DROP. There's generally
> little sense in filtering OUTPUT.
>
> 3. You've got 7 custom chains in filter but you only use one of them -
> get rid of the rest unless you plan to use them soon. No sense having
> chains you don't use, particularly when packets are jumping to them.
>
> Someone posts the Netfilter tutorial link once a week at least and you
> may have already read it, but I would advise going through it again. It
> took me at least a year before I understood iptables enough to write my
> own script based on the tutorial and another year before I understood
> what was going on enough to edit live firewall rules (and then I usually
> keep it very simple). The tutorial seriously accelerated my knowledge
> but I had to read parts of it several times.
>
> I noted below what I was talking about with the ports...
>
>
> > -----Original Message-----
> > From: Dave Strydom [mailto:strydom.dave@gmail.com]
> > Sent: Wednesday, November 09, 2005 12:24 AM
> > To: Derick Anderson
> > Subject: Re: ftp conntrack - nat problem
> >
> > Well, it's usually after around 15 files or so, but whats odd
> > is the output from the ftp client:
> >
> > -----------------------------------------
> > 150 Opening BINARY mode data connection for LANDING_09.jpg
> >     754 bytes transferred. (15.6 KB/s) (47 ms)
> > 226 Transfer complete.
> >     SIZE LANDING_09.jpg
> > 213 754
> >     Remote file exist check: 'LANDING_10.jpg'.
> >     SIZE LANDING_10.jpg
> > 550 LANDING_10.jpg: No such file or directory
> >     PASV
> > 227 Entering Passive Mode (209,212,112,162,135,41).
> >     Opening data connection to 209.212.112.162 Port: 34601
>
> Here 34601 is opened...
>
> >     STOR LANDING_10.jpg
> > 150 Opening BINARY mode data connection for LANDING_10.jpg
> >     2279 bytes transferred. (28.5 KB/s) (78 ms)
> > 226 Transfer complete.
> >     SIZE LANDING_10.jpg
> > 213 2279
> >     Remote file exist check: 'LANDING_11.jpg'.
> >     SIZE LANDING_11.jpg
> > 550 LANDING_11.jpg: No such file or directory
> >     PASV
> > 227 Entering Passive Mode (209,212,112,162,135,42).
> >     Opening data connection to 209.212.112.162 Port: 34602
>
> Here port 34602 is opened...
>
> >     STOR LANDING_11.jpg
> > 0 Opening BINARY mode data connection for LANDING_11.jpg
> >     Timeout (20s).
> >     Active Help: http://www.smartftp.com/support/kb/index.php/74
> >     Client closed the connection.
> >     Transfer failed.
> > -----------------------------------------
> >
> > As you can see, it works perfectly ( 150 Opening BINARY mode data
> > connection) and then all of a sudden you get ( 0 Opening
> > BINARY mode data connection)
> >
> > I will also give the ethereal thing a try...
> >
> > Dave
>
> The client log does show a timeout, but the server response of 0 is very
> odd - definitely not in the FTP RFC.
>
> Derick
>
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > On 11/8/05, Derick Anderson <danderson@vikus.com> wrote:
> > > If that's the case my next step would be running ethereal during a
> > > transfer, looking for TCP resets, or checking server logs for ABOR
> > > commands (had a case like this with a client once). Does
> > the transfer
> > > fail after a specific amount of time? Usually when an
> > iptables script
> > > breaks something, it's all or nothing...
> > >
> > > Derick Anderson
> > >
> > > > -----Original Message-----
> > > > From: Dave Strydom [mailto:strydom.dave@gmail.com]
> > > > Sent: Tuesday, November 08, 2005 8:53 AM
> > > > To: Derick Anderson
> > > > Subject: Re: ftp conntrack - nat problem
> > > >
> > > > I thought about that, but i have a server which is not being the
> > > > firewall, and its running the same software and version
> > of software
> > > > as the linux servers behind the firewall, and it's fine.
> > > >
> > > > I have also tested the ftp's internally, and they work perfectly,
> > > > both the NT2000 server and the linux servers.
> > > >
> > > > I have like narrowed it down to the firewall (i have also setup
> > > > another test setup with a firewall, and a server behind it, and i
> > > > get the same problem, so i think it's something in the script or
> > > > something)
> > > >
> > > > Dave
> > > >
> > > > On 11/8/05, Derick Anderson <danderson@vikus.com> wrote:
> > > > >
> > > > >
> > > > > [snip]
> > > > >
> > > > > >
> > > > > > What am I missing, because this is seriously starting to
> > > > annoy me, i
> > > > > > cant find anything wrong, even if i setup a simple
> > DNAT for ftp,
> > > > > > with no filtering or anything, it transfers a few files, and
> > > > > > then bombs out :(
> > > > > >
> > > > > >
> > > > > > thanks
> > > > > > Dave
> > > > >
> > > > > Don't count the FTP server out: I had a problem with a
> > > > Windows-based
> > > > > FTP server after applying Windows 2003 Standard SP1
> > where it would
> > > > > disconnect the user every 2 minutes for no apparent reason
> > > > > (keep-alives and auto-reconnects kept some clients alive, but
> > > > > other more spartan transfers failed). Moving the server
> > to a Web
> > > > > Edition server (with SP1) mysteriously solved the
> > problem, which
> > > > > the FTP server company still cannot figure out.
> > > > >
> > > > > I thought it might be the firewall (originally built by
> > > > someone with
> > > > > fewer netfilter skills) but an internal test with the same
> > > > two minute
> > > > > disconnect proved that not to be the case. See if your
> > > > transfers fail
> > > > > internally as well.
> > > > >
> > > > > Derick Anderson
> > > > >
> > > > >
> > > >
> > >
> >
>

