From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: SMTP HTTP port allow
Date: Wed, 27 Aug 2003 11:38:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030827153835.GB32148@cannon.eng.us.uu.net>
References: <20030827065256.47173.qmail@web20708.mail.yahoo.com> <FDEMKKNJDLAJDPNDPCDDMEHBNFAA.georgev@citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <FDEMKKNJDLAJDPNDPCDDMEHBNFAA.georgev@citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

On Wed, Aug 27, 2003 at 08:40:20PM +1000, George Vieira wrote:

> You have not used MASQUERADE in your POSTROUTING rules or haven't showed
> it..
> 
> iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.42 -d
> 207.106.22.35 --dport 80 -j MASQUERADE
> iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.23 -d
> 207.106.22.35 --dport 80 -j MASQUERADE
> 
> 
> without the rules above, the 192.168.0.XX packets leave the network out into
> the internet and eventually get dropped by some ISP...

Again and again, a correction to the statement above. The ISP's do not
drop these packets because the src is private IP. It's the return packets
which would be dropped because the "defaultless" core routers don't know
where to forward them.

Ramin


