From: Frank Gruellich <frank@der-frank.org>
Subject: Re: RES: NAT 1:N
Date: Sun, 1 Jul 2007 12:44:10 +0200
Message-ID: <20070701104410.GS17386@der-frank.org>
References: <A9413ED3DA1D5A47ADDF30EC379CEDA207670F@inepmail.inep.gov.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <A9413ED3DA1D5A47ADDF30EC379CEDA207670F@inepmail.inep.gov.br>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

* Gustavo L. P. dos Santos <gustavo.santos@inep.gov.br> 29. Jun 07:
> Maybe I wasn??t clear enought with my question, the two machines are
> web servers visible on the Internet, and I can??t use MASQUERADE for
> this. If it was the basics i wouldn??t bother you all. And sorry for
> the annoyance.

Don't worry, seems you're not the only one who should do some RTFM on
this list...

The situation you have is clearly described at Oskar Andreassons great
tutorial (a Must-Read for iptables users, IMHO):
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#DNATTARGET

You should use a range of IP#s for --to-destination.  Note, that single
TCP streams will allways be directed to same server while different
streams will be directed in a simple load balancing manner (I think
round robin).  This implies that you don't have any problems with rather
static content, but if you keep session information at server you have
to distribute that to all your webservers.

HTH, kind regards,
 Frank.
-- 
Sigmentation fault

