From: Herve Eychenne <rv@wallfire.org>
Subject: Re: iptables analyzer
Date: Thu, 27 Nov 2003 04:15:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031127031557.GB1084@eychenne.org>
References: <16278.57173.146033.350478@teak.killian.com> <20031028105301.92009.qmail@web40206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031028105301.92009.qmail@web40206.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Tue, Oct 28, 2003 at 02:53:01AM -0800, SBlaze wrote:

> Iam
> http://intevation.de/iam/

> IPAC-NG - IP accounting next generation
> http://ipac-ng.sourceforge.net/

> IAG - IP-Accounting Grapher
> http://dev.lashout.net/iag/

> BW ACCT v0.9.4
> http://www.bwacct.org/

> ADMLogger
> http://aaron.marasco.com/linux.html

> Firewall Log Daemon - firelogd
> http://rouxdoo.freeshell.org/dmn/

> Firewall Monitor (fwmon)
> http://www.scaramanga.co.uk/fwmon/

> fwlogwatch 0.9.3
> http://www.kyb.uni-stuttgart.de/boris/software.shtml

> PStat=20
> http://members.fortunecity.com/mrsi/

> iptacct - Accounting for Linux 2.4
> http://tretmine.org/iptacct/

> SASacct
> http://rousse.pm.org/sasacct/

> Simple Little Firewall Monitor
> http://slfm.sourceforge.net/

> tvc4
> http://fsi-server.physik.uni-erlangen.de/~sndapara/shaping/index_en.shtml

> While i have not tried any of these projects... I don't think they are wh=
at I
> am looking for. I don't really need graphics or things displayed in MySQL
> databases.. I would simple like to be able to saya... hey how many packet=
s have
> I gottin in the last 5 or so mins...and see the difference from the 5 mins
> before. Graphing this daily weekly monthy..etc would be nice...but hey I'm
> willing to settle.

Maybe it's because you didn't try wflogs yet. ;-)

I think the command you're looking for may be something like this:

# wflogs --strict-parsing=3Dnowarning --sort=3Dnone --filter '$start_time >=
=3D [5
  minutes ago]' -o text --summary=3Dno --header=3Dno --resolve=3D0
  --sresolve=3Dno --whois=3D0

Please don't get fooled by the command line length... wflogs is just a
quite powerful tool...

http://www.wallfire.org/wflogs/

 Herve

--=20
 _
(=B0=3D  Herv=E9 Eychenne
//)
v_/_ WallFire project:  http://www.wallfire.org/

