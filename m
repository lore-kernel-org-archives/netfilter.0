From: Dimitar Katerinski <train@bofh.bg>
Subject: Re: nat and dns
Date: Fri, 24 Sep 2004 01:02:11 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095976931.5171.12.camel@mistified.sf.bgservice.lab>
References: <415290B1.5030401@imag.fr>  <4152DADF.4090802@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4152DADF.4090802@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Sorry, a little bit off topic, but I allways go red about such kind of crappy rules:

> Use DNAT target.  In short what you need to do is:
> 
>    iptables -A FORWARD -m state --state NEW -j ACCEPT

Do you know what you just did? You've just allowed any kind of
connections, protocols to any port and from/to any destionation. Cute,
isn't it? Remember, --state NEW, never ever have meant, and I doubt
it'll ever mean that this is an tcp connection with only SYN bit set. It
could be everyting, ACK,URG,PSH etc. So guess what, you just open a wide
hole in your so called "firewall" machine. You better use --tpc-flags or
--syn alias for such purposes. --state NEW can be used for redundant
firewalling for example, but for me it has no use.


Regards,
Dimitar

P.S. Why I go red? Because there're thousands of people who use it, and
they learned it from someone like you.
-- 
"The only thing necessary for the triumph of evil is for good men to do
nothing."
                                                  --Edmund Burke. 



