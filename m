From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: netfilter & OpenBSD
Date: Thu, 27 Feb 2003 10:25:48 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302271025.48636.fabrice@netfilter.org>
References: <5.1.0.14.0.20030224165453.019993f0@mail.phoenixcomm.net>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.0.20030224165453.019993f0@mail.phoenixcomm.net>
Content-Disposition: inline
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
To: Cris Harrison <Webmaster@phoenixcomm.net>, netfilter@lists.samba.org


Hi Chris,

On Tuesday 25 February 2003 06:56, Cris Harrison wrote:
> how can I run netfilter on a SPARC OpenBSD box??????
> Cris Harrison

Short answer: you can't.
netfilter is a linux packet filter thing, not BSD one.
If you are running OpenBSD, then you should be using pf. 

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

