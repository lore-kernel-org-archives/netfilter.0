From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: Daisy Chaining two computers?
Date: Mon, 20 Mar 2006 14:52:43 +0100
Message-ID: <200603201452.43715@nienna>
References: <1142805379.4080.31.camel@home.walkeonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1142805379.4080.31.camel@home.walkeonline.com>
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
Cc: "Vann H. Walke" <vann@walkeonline.com>


  Hi,

On Sunday 19 March 2006 22.56, Vann H. Walke wrote:
> I have an environment in which network drops are limited.  We have two
> boxes at each location, one running Linux, one running Windows.  What I
> would like to do is set the machines up so that the Linux box acts both
> as a pass through for the Windows machine and is usable on its own.
>
> Thus, the situation would look something like:
>        	  |   Linux	Windows
>
> Network---|---|	  |-----|
>
>
> To the windows machine it should appear that it is directly connected to
> the network (including dhcp access, etc...).  I do not have the
> authority to make any changes to the windows configuration.  The Linux
> machine should appear to a user as being completely normal.

  If you don't have a shortage of (internal) IP addresses, then use software 
bridging on the linux box. It's very easy to set up and completely 
transparent.

  http://linux-net.osdl.org/index.php/Bridge#Sample_setup

-- 
 Regards,
  Krisztian Kovacs

