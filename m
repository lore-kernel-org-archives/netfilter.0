From: Jason Opperisano <opie@817west.com>
Subject: Re: browser disclosing
Date: Fri, 26 Nov 2004 16:09:21 -0500
Message-ID: <1101503361.10064.4.camel@hubcap.ljm.dom>
References: <web-534570975@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-534570975@mail01.infosat.net>
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
To: netfilter@lists.netfilter.org

On Fri, 2004-11-26 at 13:07, it clown wrote:
> Hi All,
> 
> i am abit confused with my setup.I have iptables running
> with squid. I went to a site that displays what you're
> browser is disclosing about you're system.When i clicked on
> the link:
> 
> Content-Type: application/x-www-form-urlencoded
> Via: 1.0 hostname.domain.net:3128 (squid/2.5.STABLE5), 1.0
> netcache2-ctn (NetCache NetApp/5.3.1R2)
> 
> X-Forwarded-For: 192.168.0.5, x.x.x.x
> 
> Why is it displaying the ip address 192.168.0.5 that i ran
> the scan off. Should it not hide that pc and only give the
> ipaddress of the pc thats doing the nating ( 192.168.0.1)?
> 
> Is this normal that i see or not?If not how do i fix this?

in squid.conf:

        forwarded_for off

the squid-users mailing list is:

        squid-users@squid-cache.org
        
sign-up info at:

        http://www.squid-cache.org/mailing-lists.html

-j

--
"I've always wondered if there was a god. And now I know there is --
 and it's me."
	--The Simpsons


