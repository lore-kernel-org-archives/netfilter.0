From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: DHCP related problem
Date: Tue, 17 Jun 2003 20:46:11 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030617124611.GA1360@floyd>
References: <001001c334aa$bcef4d30$c80da8c0@pisic> <200306171130.h5HBUUWF027705@nycsmtp3out.rdc-nyc.rr.com>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200306171130.h5HBUUWF027705@nycsmtp3out.rdc-nyc.rr.com>
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

On Tue, Jun 17, 2003 at 07:24:16AM -0400, Matt Grogan spoke thusly:
>If you want to go further than that, like stop someone from getting their
>information from DHCP and then statically defining it and keeping that
>address, it gets a little more involved. Maybe reducing the lease time and
>scripting to check that all the stations in the DHCP range are also in the
>list of DHCP clients on the server would help.

A slightly different angle, which just came up on the redhat-users ML a
couple of days ago; which might work is :

	-> All DHCP leases get an account created on your internal DNS
	   resolver.
	-> Your firewall refreshes your ruleset by only allowing a range
	   of DHCP IP ranges, which have a corresponding DNS forward &&
	   reverse entry.

This is similar to Win2K functionality whereby all DHCP addresses get an
automatic DNS entry created. Someone mentioned that ISC's DHCP package
supports such functionality, you might want to take a look.

There will be some scripting involved, as Matt has already allured to.

(snip rest)

