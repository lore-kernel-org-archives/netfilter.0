From: Chris Miller <cmiller@servermotion.com>
Subject: Re: Please Review My Rules
Date: Tue, 27 Jun 2006 14:42:30 -0500
Message-ID: <76097295-3B46-4E9F-BE93-9849AFD677C8@servermotion.com>
References: <42CD7FAD-A949-4A63-9A0A-873EB8005FAF@servermotion.com>
	<44A161E0.7050804@rtij.nl>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44A161E0.7050804@rtij.nl>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks for all the tips, I'll review my rules with this new knowledge.

One thing I did want to mention was I didn't mean to leave the REJECT  
statements in there. I had those there for some testing I was doing,  
forgot to take them out.

Thanks!

Thanks,

Chris Miller
ServerMotion
www.servermotion.com



On Jun 27, 2006, at 11:50 AM, Martijn Lievaart wrote:

> Chris Miller wrote:
>
> Are these all adresses of the firewall? If not, these rules will  
> not do anything.  If yes, why bother?
>
> If your policy is set to ACCEPT, this will break things (most  
> notably PMTUD). If your policy is set to DROP, why reject these?
>
> Also note that if these are all the addresses of the firewall  
> itself, the same can be achieved by simply saying
>
>    iptables -A INPUT -p icmp -j REJECT --reject-with  icmp-port- 
> unreachable
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)

iD8DBQFEoYooxBwlCB7CRwsRAmtrAJ9Fz3gIvh+JHN3bRSl6XNS1eO0g0QCdHRDo
fK3eprj2DrDg4A/NI3x6ChI=
=Lr48
-----END PGP SIGNATURE-----

