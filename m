From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: port scanning
Date: Fri, 19 Mar 2004 00:02:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040318230209.GA13552@jesus.seclab.jp>
References: <20040318224754.5502418D76@smtp.latinmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040318224754.5502418D76@smtp.latinmail.com>
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
To: Jorge Garcia <anarkophobia@latinmail.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Thu, 18 Mar 2004, Jorge Garcia wrote:

> hi, i need an example of script ( please, i need the example works, becuouse i found a lot on internet that doesnt work) for logging and dropping port scans with iptables.
> thanx

Hello,
did you try the psd match, included in the patch-o-matic?

You can use it that way, or with options. Have a look at the netfilter
extensions HOWTO at
http://netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-3.html#ss3.12
iptables -A INPUT -m psd -j DROP

regards
Frederic

--
< Ylli> lol je rigole neuro jte prend pa pr un pervers ms un president
et pere de famille respectable :s
http://www.seclab.jp

