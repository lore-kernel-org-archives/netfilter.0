From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: iptables msn messenger
Date: Thu, 14 Oct 2004 08:29:54 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <416E7F52.8010909@pbl.ca>
References: <1097725760.1580.9.camel@joel.d2visp.com>	<1097729354.1931.1.camel@alucard.kanux.com>
	<1097730290.1578.24.camel@joel.d2visp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1097730290.1578.24.camel@joel.d2visp.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Joel n.solanki wrote:
> Is there any way to sort out this problem with iptables ...or any tune
> up parameter ?????
> Coz i have to solve this else we need to replace with commercial router
> which i dont want to do.

In a last couple of days MSN was down several times.  Nothing you, or 
anybody else can do about it.  Switching to different firewall would 
have no effect.  On the other hand, switching to different instant 
messaging program (ICQ, AIM, Yahoo, just to name few of the bigger 
names) would probably solve the problem.  Which is supposedly solved by 
MS by now anyhow.

Thierry mentioned uPnP.  MSN *does not* need uPnP to work.  You can 
safely turn uPnP off by setting appropriate registry entry.  Should be 
fairly trivial to find which one using Google.  It might be good idea to 
do it anyhow, since if you search for info on uPnP you'll find that 
everybody is suggesting to turn it off because it's unsecure.  I've 
never tried to dig more info about uPnP, but if what Thierry wrote was 
correct, I'd turn it off immediatelly (applications being able to 
uncontrollably punch holes in firewall, not likely in my shop, virus 
writers would surely *love* that feature).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

