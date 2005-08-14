From: Dwayne Hottinger <dhottinger@harrisonburg.k12.va.us>
Subject: Re: Blocking Google Earth
Date: Sat, 13 Aug 2005 21:15:26 -0400
Message-ID: <1123982126.d15da05175e46@webmail.harrisonburg.k12.va.us>
References: <20050812201225.CE6DD2128@juno.tc.df.gov.br>
	<42FD06B6.4080209@imag.fr> <20050812223230.14D0920EB@juno.tc.df.gov.br>
	<200508130431.24772.arny@ats.s.bawue.de>
	<Pine.LNX.4.61.0508131429060.3437@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508131429060.3437@yvahk01.tjqt.qr>
Content-Disposition: inline
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

Wouldnt it be easier to just kick the user in the butt?

ddh

Quoting Jan Engelhardt <jengelh@linux01.gwdg.de>:

>
> >> I would like to block it because a user using Google Earth consumes about
> >> 256kbps bandwith. I have 600+ users and only a 2Mbps link to the Internet.
>
> - QoS / egress
> - string/layer7 match with "Host: earth.google.com" or whatever fits
> - Full Transparent proxying using e.g. squid
>
>
> Jan Engelhardt
> --
> | Alphagate Systems, http://alphagate.hopto.org/
>


--
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

