From: Michel van der Klei <michel@mitch-it.com>
Subject: Re: Need help with iptables and iprange module
Date: Thu, 15 Feb 2007 01:49:32 +0100
Message-ID: <20070215014932.d5815394.michel@mitch-it.com>
References: <b6d73fa90702141615y138d3f0dh176f309ca9ea74dd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b6d73fa90702141615y138d3f0dh176f309ca9ea74dd@mail.gmail.com>
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

On Wed, 14 Feb 2007 19:15:13 -0500 TheNokia <nokiairc@gmail.com> wrote:
> Hello everybody, I installed iptables v1.3.7 (the lastest one)
> But when I try to use iprange module (-m iprange) here the error:
> 
> debian:~# iptables -A INPUT -m iprange
> iptables v1.3.7: iprange match: You must specify `--src-range' or `--dst-range'
> Try `iptables -h' or 'iptables --help' for more information.
> debian:~# iptables -A INPUT -m iprange --src-range
> iptables v1.3.7: Unknown arg `--src-range'
> Try `iptables -h' or 'iptables --help' for more information.
> debian:~# iptables -A INPUT -m iprange --src-range
> xx.xxx.xxx.0-xx.xxx.xxx.255 -j DROP
> iptables: No chain/target/match by that name
> 
> I try to install the crap-patch-o-matic, impossible to install without
> 100 years of linux knowledge.

Which kernelversion is there installed on your Debian machine. Since kernel
2.6.18 it's no longer needed to run patch-o-matic. 

modprobe ipt_iprange will do that trick for you.

-- 


Michel van der Klei 
http://www.mitch-it.nl

	A brain is a wonderful thing, 
	everybody should have one
-- 
Met vriendelijk groet,

Michel van der Klei 

Mitch IT
Annendal 11
4761 LK ZEVENBERGEN

tel: 0168329316
fax: 0168329639

http://www.mitch-it.nl

	A brain is a wonderful thing, 
	everybody should have one

