From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 21:11:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031013211136.79903114.arnt@c2i.net>
References: <20031013031712.7fd7be69.arnt@c2i.net>
	<Pine.LNX.4.44.0310130905370.17437-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310130905370.17437-100000@localhost.localdomain>
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

On Mon, 13 Oct 2003 09:06:29 -0400 (EDT), 
"Robert P. J. Day" <rpjday@mindspring.com> wrote in message 
<Pine.LNX.4.44.0310130905370.17437-100000@localhost.localdomain>:

> On Mon, 13 Oct 2003, Arnt Karlsen wrote:
> 
> > On Sun, 12 Oct 2003 18:40:27 -0600, 
> > Herman <Herman@AerospaceSoftware.com> wrote in message 
> > <200310121840.27031.Herman@AerospaceSoftware.com>:
> > 
> > > The real problem that I'm trying to solve is this:
> > > Several hosts need to acces a gov service that uses Java and a
> > > certain port.  
> > 
> > ..if these hosts are initiating this connection from your end, 
> > " -j ESTABLISHED,RELATED" should do it, instead of you 
> > running around chasing your tail. 
> 
> i suspect you really meant -m state --state ESTABLISHED,RELATED.

..you suspect correctly.  ;-)  Above match -j ACCEPT , to complete what
I meant to say.


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



