From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: frox ftp proxy and port range.
Date: Fri, 23 Apr 2004 11:06:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040423110606.49547586@mgalepc.utilitran.com>
References: <20040423105735.560edace@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040423105735.560edace@mgalepc.utilitran.com>
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
To: netfilter@lists.netfilter.org


I am dumbass -- I forgot to put "-j ACCEPT" at the end ... I need more tea.

Michael..

On Fri, 23 Apr 2004 10:57:35 -0600
Michael Gale <michael.gale@utilitran.com> wrote:

> Hello,
> 
> 	I am trying to use frox which is a transparent ftp proxy, I have tested
> 	it in
> transparent and non-transparent mode.
> 
> In non-trans mode the client specifies a proxy of internal gw and port 2121
> and I allow a port range for the box that frox is running on.
> 
> But it seems the port range section is not working, here is my iptables rule,
> which I believe is correct, I want the box it accept traffic between 41000 and
> 419999 from all internal clients.
> 
> from iptables -vnL
> 
>    24  1440            tcp  --  eth1   *       192.168.7.0/24       gwIP 
>       tcp dpts:41000:41999
> 
> So does the about rule look correct ?
> 
> 
> -- 
> Michael Gale
> Network Administrator
> Utilitran Corporation
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

