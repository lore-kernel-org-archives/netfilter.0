From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: Lowest spec processor that netfilter will run on
Date: Thu, 6 Jun 2002 22:45:49 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <001801c20dd5$d0d3c5d0$020aa8c0@matttm9svd8lrh>
References: <1102.158.152.36.235.1023407271.squirrel@www.fyremoon.net> <001201c20dd0$314a3260$020aa8c0@matttm9svd8lrh> <3D004E88.3760FABE@storm.ca>
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
To: Sandy Harris <sandy@storm.ca>, netfilter@lists.samba.org

ipchains isn't iptables...and you were probably also running a much
different (older) kernel...so we're talking apples and oranges here. I'm not
saying it woudn't work mind you...it probably would.  I sure wouldn't
recommend it to anyone though and I personally wouldn't think of going with
anything less that a P60 and 64MB ram.  If that's all you've got lying
around though...it's worth a shot.

Matt

----- Original Message -----
From: "Sandy Harris" <sandy@storm.ca>
To: <netfilter@lists.samba.org>
Sent: Friday, June 07, 2002 1:11 AM
Subject: Re: Lowest spec processor that netfilter will run on


> Matthew Hellman wrote:
> >
> > I can't speak for non x86 processors, but I have mine running on a
Pentium
> > 60 mhz with 64MB ram....runs pretty well although I personally wouldn't
> > consider going with anything less.
>
> I ran a firewall for a year or two using a 486/66
> with 24 megs, using ipchains, on a 2.2 Mbps ADSL
> link. The only problem was keeping log size under
> control on a 170 meg drive.
>
> There are some numbers for related things at:
> http://www.freeswan.org/freeswan_snaps/NEW-SNAP/doc/performance.html
>



