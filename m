From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: firewall protocols
Date: Thu, 7 Apr 2005 16:14:08 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504071609440.23293@darkstar.sysinfo.com>
References: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
	<42557D73.7070500@provident-solutions.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42557D73.7070500@provident-solutions.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Vernon A. Fort" <vfort@provident-solutions.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 7 Apr 2005, Vernon A. Fort wrote:

> Ted Gervais wrote:
>
>> I have just discovered that people are not able to telnet to my system and 
>> I have been told that it is not because I don't have the necessary ports 
>> open but rather the problem is because of protocols??
>> 
>> I have no idea what this means and am wondering if someone could explain. 
>> If it is needed I can supply a copy of my firewall  but was wondering 
>> first if anyone has heard of this.
>
> you should be able to list the open port from the iptables command:  iptables 
> -L -nv
> and
> telnet localhost to see if telnet if running
>
> from the iptables, you should see port 23 open from the ip address needing 
> access.  you should also be able to telnet to the localhost.
>

Which might tell him if the ports open, but not if there's anything really 
listening on the port.  gre telnet /etc/inetd.conf is a better starting 
point, since he claims is rulebase allows telnet already, this so7unds 
like the ports open but there's nothing listening.  If he see this 
response;

#telnet stream  tcp     nowait  root    /usr/sbin/tcpd  in.telnetd

He needs to vi /etc/inetd.conf to enable telnet <and with tcpd for other 
sec reasons>  the kill -HUP inetd and also then make sure his 
/etc/hosts.allow is setup to allow telnet, especially if he has a 
populated /etc/hosts.deny.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCVZSVst+vzJSwZikRAi1AAJ4lcGiGAAo4nNFMFI5M4cEja7s0jwCcDI18
xX+FOhgzqbMgGbGdIhZ4oGE=
=yWtU
-----END PGP SIGNATURE-----

