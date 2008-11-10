From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Altering firewall rules to enable NAT Reflection
Date: Sun, 09 Nov 2008 19:26:07 -0600
Message-ID: <49178DAF.5090105@riverviewtech.net>
References: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com>	 <49149060.70100@riverviewtech.net> <5bdb1aa70811091514t506c9f7dib2d40ac26bba02b0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5bdb1aa70811091514t506c9f7dib2d40ac26bba02b0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/07/08 17:14, Simon wrote:
> Thanks for the replies todate!

You are welcome.

> I had a look thru the firewall rules that are created by the web 
> interface and have this in the /etc/firewall/portfw/iptablesportfw file:

<snip>

> Which is close, but not the same as your example above... have i got the 
> right section here?

With out knowing any thing about what "... the web interface ..." is I 
can't say any thing about where you are at.

However your rules look like they are doing the DNATing (presuming that 
your ""external IP is 192.168.2.2) properly (presuming that 
192.168.1.<something> is your internal IP).  However you are not doing 
any SNATing to hide the fact that your internal LAN clients are being 
redirected back to the the internal server when they try to reach the 
external IP.



Grant. . . .
