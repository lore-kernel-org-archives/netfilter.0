From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: NAT authentication
Date: Thu, 17 Apr 2003 21:56:33 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030417135633.GC1518@floyd>
References: <OE539Bbw2oj1l489Ypx0002dde3@hotmail.com>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OE539Bbw2oj1l489Ypx0002dde3@hotmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Apr 15, 2003 at 05:51:14PM +0800, William spoke thusly:

>   1. When user want to connect to Internet by NAT.

What outgoing user services will be used ?

>   2. A prompt will show up to authenticate the users by RADIUS to a windows 
>   2000 server.   

If you are using it for plain http/https/ftp sessions, then I would suggest
plugging in a transparent proxy (eg: Squid), and have that perform the OOB
authentication to your RADIUS daemon.

Otherwise, if you need it for generic outgoing services, I think it might
be possible to plug in a SOCKS5 server with authentication to your Win2K
RADIUS daemon.

>   3. If the user is authenticated, NAT is done, and packet send to Internet.

See above, this won't touch iptables (except for the transparent proxying
most probably).

Another, probably less secure method would be to have the user authenticate
itself to some web server (Apache, checking your Win2K RADIUS db), if
successful have your gateway add in the appropriate rules. Otherwise just
ignore it. This means interfacing between the web server, radius + your
gateway.

-- 
"any nation that wants to control its borders can do so." 
		- Tommy Franks; Mexicans && Columbia Drug War ?

