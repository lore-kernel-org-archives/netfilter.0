From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: adsl modem and LAN
Date: Fri, 7 Nov 2003 12:29:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071229.hA7CTFj14666@agate.rockstone.co.uk>
References: <004e01c3a529$989d8c90$47741769@jazzy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004e01c3a529$989d8c90$47741769@jazzy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 07 November 2003 12:20 pm, Aziz Sasmaz wrote:

> I have an ADSL router.. My network is like below
>
> TELECOM --  ( 212.174.55.172 ) ADSL_ROUTER ( 10.0.0.2 ) -- (10.0.0.15 )
> GATEWAY ( 192.168.0.6 ) -- SWITCH - (192.168.0.0/24) LAN
>
> I have a
>                 cvs server at 192.168.0.222
>                 https server at 192.168.0.111
>
> I can not connect to my LAN using my real ip ( 212.174.55.172 ) when i am
> in my LAN. I want when i type in my explorer https://212.174.55.172  i can
> see the site.. I dont want to type the https servers LAN IP when i am in MY
> LAN..
>
> what should i do to see the https site when I use my real ip (
> 212.174.55.172  )  in my LAN...

Best solution is to put your https and cvs servers on their own network 
segment (a DMZ, if you like), so that traffic from both the outside world and 
your internal LAN have to pass through the gateway machine running netfilter 
in order to reach the https & cvs servers.

If yoou don't want to do that, you end up with horrible combinations of SNAT 
and DNAT on the gateway machine, and every time you access the https / cvs 
server from a LAN client, the server will think it's the gateway which is 
connecting (which may mess up the authentication of your X.509 certificates?)

For the cost of a single LAN card (or two if you don't want to have another 
switch / hub), this is by far the easiest solution.

Antony.

-- 

I vote "no" to this proposal to form a committee to investigate whether we 
should or should not hold a ballot on whether to vote yet.
                                                     Please reply to the list;
                                                           please don't CC me.

