From: Andy Meader <ameader@corp.Lcom.net>
Subject: Re: netfilter and multiple virtual interfaces
Date: Fri, 20 Dec 2002 20:05:29 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212202004040.13035-100000@wltis.com>
References: <7ED10BBB6654124E9AFFF27155322BBBB74E@corp03.nc.ehomecare.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7ED10BBB6654124E9AFFF27155322BBBB74E@corp03.nc.ehomecare.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Boone <netfilter@wizdom.net>
Cc: netfilter@lists.netfilter.org

Hi Dave,

I know that on RH 7.1 that netfilter only sees an interface and its
multineted (virtual) interfaces as the same interface. Possibly newer
versions are different.

Good luck.

Andy

On Fri, 20 Dec 2002, David Boone wrote:

> Hi,
>
> I know you can apply a + (plus sign) to adapters in the form eth+ or
> ppp+, but I'm setting up a firewall that will have several web servers
> behind it and I would like to do something like eth0+ and/or eth0:+ in
> the rules.  Does anyone know if this will work or do I have to enter
> every single virtual adapter by hand?
>
> Thanks,
> Dave Boone
>
>
>


