From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 09:06:29 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310130905370.17437-100000@localhost.localdomain>
References: <20031013031712.7fd7be69.arnt@c2i.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031013031712.7fd7be69.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

On Mon, 13 Oct 2003, Arnt Karlsen wrote:

> On Sun, 12 Oct 2003 18:40:27 -0600, 
> Herman <Herman@AerospaceSoftware.com> wrote in message 
> <200310121840.27031.Herman@AerospaceSoftware.com>:
> 
> > The real problem that I'm trying to solve is this:
> > Several hosts need to acces a gov service that uses Java and a certain
> > port.  
> 
> ..if these hosts are initiating this connection from your end, 
> " -j ESTABLISHED,RELATED" should do it, instead of you 
> running around chasing your tail. 

i suspect you really meant -m state --state ESTABLISHED,RELATED.

rday


