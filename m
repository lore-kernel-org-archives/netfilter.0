From: Ian Laurie <iml@zip.com.au>
Subject: Re: philosophical question regarding NAT
Date: Wed, 11 May 2005 09:12:09 +0000
Message-ID: <1115802729l.2805l.1l@server.moose.blogdns.org>
References: <1115723584l.29661l.0l@server.moose.blogdns.org>
	<d5q590$fsv$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d5q590$fsv$1@sea.gmane.org> (from Vasilii.Alferov@gmail.com on
	Tue May 10 21:25:19 2005)
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
Content-Type: text/plain; charset="us-ascii"; format="Flowed"
To: netfilter@lists.netfilter.org

> More effective solution is to enable rp_filter in kernel using proc
> filesystem or sysctl. It prevents anyone from spoofing IP addresses.

DOH!!  How right you are..... rp_filter slipped my mind completely.

Thank you for reminding me.

Ian



