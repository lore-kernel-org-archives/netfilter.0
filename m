From: Andrei Ivanov <andrei.ivanov@ines.ro>
Subject: RE: Iptables bandwidth limit
Date: Fri, 20 Sep 2002 15:35:55 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209201534250.6328-100000@webdev.ines.ro>
References: <FD8F124A387AD6119F7900A0D218B32101988F@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B32101988F@hslex01.hsl-brabantzuid.nl>
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
To: netfilter@lists.netfilter.org


What amazes me is that iptables doesn't know to match packets by a tos 
value other then the ones in ip.h... this really SUCKS.

On Fri, 20 Sep 2002, Rob Sterenborg wrote:

> > You can almost do this with the limit module, but you should 
> > better use
> > HTB or CBQ (QOS) which are really done for this.
> > 
> I first accomplished it with CBQ, but later I switched to HTB which is a lot
> easier to configure.
> 
> 
> Rob
> 


