From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Can't forward Win2k VPN through NAT
Date: Fri, 06 Sep 2002 14:13:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPMENECNAA.stewart.thompson@shaw.ca>
References: <200209061422.g86EMQv02254@vulcan.rissington.net>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209061422.g86EMQv02254@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Netfilter mailinglist <netfilter@lists.netfilter.org>

Hi Antony:

	Off the top of your head, do you know what the first
Version of iptables that pptp_conntrack_nat was implemented?

Stu..........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: September 6, 2002 7:22 AM
To: Netfilter mailinglist
Subject: Re: Can't forward Win2k VPN through NAT

On Friday 06 September 2002 1:42 pm, Roy Sigurd Karlsbakk wrote:

> hi all
>
> I have this fw as sketched below. What I want, is to enable win2k VPN
> connection NATed into 192.168.144.24.
>
> Can someone help me here? It just doesn't work ...

You;re right.   It doesn't work.

PPTP doesn't like being NATted, because it embeds addressing information
inside the protocol.

You need to load the pptp helper module in netfilter to stand any chance of
getting this going.   Look for pptp_conntrack_nat.

I think the sig on your email was highly appropriate to the situation,
however:

"Computers are like air conditioners.
They stop working when you open Windows."

Antony.

--

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner


