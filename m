From: "Fabio S. Silva" <fabiofoz@gmail.com>
Subject: Re: Status open , filtered
Date: Fri, 23 Jun 2006 12:07:51 -0300
Message-ID: <12ec50350606230807x2bc5824dga382a6a89ec342bc@mail.gmail.com>
References: <12ec50350606230755u68e1ad42p8c95714d208fad8c@mail.gmail.com>
	<449C0231.4080703@addictz.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <449C0231.4080703@addictz.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

right... but... is this correct ? or is a bug on creating firewall rules ?

2006/6/23, Mike <Lists@addictz.org>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> - From http://www.insecure.org/nmap/
>
> Filtered means that a firewall, filter, or other network obstacle is
> blocking the port so that Nmap cannot tell whether it is open or closed.
>
> Thanks
>
> Mike
>
>
> Fabio S. Silva wrote:
> > Hi all, i have a question, i make a firewall but when i make a scan
> > using nmap it returns to me that the ports are in state filtered no
> > close
> >
> > (The 1673 ports scanned but not shown below are in state: filtered)
> >
> > Anybody know why it returns to me it? is my rules wrong? or is a type
> > of rule that i created that make it in state filtered?
> > Just the ssh/22 port is open, and if i make a internal test in the
> > firewall i can see another ports opened, its good because i just can
> > see my ssh port opened from the internet, but i dont understand why
> > the state show me filtered.
> >
> >
> > thanks
> >
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.3 (MingW32)
>
> iD8DBQFEnAIsj5H2goTKsxsRAvzMAKCvlfDUwPBXyu2tHEaHvItLDZ5Q+gCfeicL
> xmGtYcdRvcmmYpSHG5Jlrgc=
> =dvMW
> -----END PGP SIGNATURE-----
>
>


-- 
---------------------------------------------------
Fabio S. Silva
LPIC-1 Linux Professional Institute Certified

