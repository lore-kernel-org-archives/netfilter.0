From: Michael Gale <mgale@utilitran.com>
Subject: Re: Problem behind my DMZ
Date: Thu, 8 Jan 2004 09:31:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040108093117.04e8864e.mgale@utilitran.com>
References: <001b01c3d57d$15123950$0296a8c0@martin>
	<1073528862.2049.825.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073528862.2049.825.camel@grendel>
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

Hello,

	I suggest you use the split DNS :) or route mail for your domain via IP.

Example ... I have a postfix box on my DMZ which has it's own network address. Any mail sent to my domain to my postfix box is delivered via smtp to my exchange server via IP.

Michael.

On Wed, 07 Jan 2004 21:27:42 -0500
Chris Brenton <cbrenton@chrisbrenton.org> wrote:

> Greetings!
> 
> On Wed, 2004-01-07 at 19:19, Martin Leduc wrote:
> >
> > One of my server is DNS.  My trouble is if I tried to send Email FROM
> > one of this third server, my DNS return to sender server the public IP
> > and my Email as send to my firewall, not my internal Server.
> 
> Common problem. You have two potential solutions:
> 
> 1) Use public IPs on your DMZ/service network. This will also give you a
> performance boost as you will drop the NAT overhead. You don't mention
> how many legal IPs you have, but if you have enough address space to
> carve off a /29 or /28 for your DMZ, this would be your best bet.
> 
> 2) Use split DNS. Setup another name server that is accessible only from
> internal systems and populate it with your private addresses.
> 
> HTH,
> C
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

