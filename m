From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: PRERUTING or POSTROUTING
Date: Sat, 4 Feb 2006 11:10:12 -0600
Message-ID: <200602041110.12128.rob0@gmx.co.uk>
References: <20060204161912.66BA3542AE@rekin17.go2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060204161912.66BA3542AE@rekin17.go2.pl>
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

On Saturday 2006-February-04 10:19, czezz wrote:
> What should I do to redirect all connection from LAN on port 80  to
> serverPROXY 10.3.1.8:8080 ?

http://www.squid-cache.org/Doc/FAQ/FAQ-17.html which refers to
http://en.tldp.org/HOWTO/mini/TransparentProxy.html

> Someone told me that it might be necessery to compile some
> additional options in kernel (my current kernel is 2.4.31 - regular
> kernel from Slackware 10.2 )

Someone told you wrong. The stock kernel is fine.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header

