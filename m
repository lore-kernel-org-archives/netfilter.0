From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: UML and Firewall
Date: Wed, 19 Jun 2002 16:17:09 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020619201708.GN26150@cannon.eng.us.uu.net>
References: <1024516194.26895.191.camel@ux-glmacedo.intranet.quality.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1024516194.26895.191.camel@ux-glmacedo.intranet.quality.com.br>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geraldo Macedo <glmacedo@quality.com.br>
Cc: netfilter@lists.samba.org, Humberto Baltazar Morais <hbmorais@ig.com.br>

On Wed, Jun 19, 2002 at 04:49:54PM -0300, Geraldo Macedo wrote:

> Greetings from Rio de Janeiro/Brazil,
> 
> Has anyone on the list tried to use UML (User Mode Linux) o host a
> firewall and separate machines?
> 
> For example:
> 
>                 Router
>                 |
>                 |
>                 |
>                 UML Host
>                 |-------------> Firewall
>                 |-------------> HTTPd
>                 |-------------> QMAIL
>                 |
>                 |
>         ---------------------
>         Internal Network
> 
> Sorry for my bad ASCII graph...
> 
> If yes, can anyone tell me how safe it is?  I've read that you can wholy
> separate the machines, and that a compromise to one of the hosted
> machines will not give access to anything else, and that I can
> automatically route every packet that gets to the host machine to the
> hosted firewall.

Interesting concept. Haven't done this myself but from the UML docs
it looks like a pretty good isolation for each virtual machine which
is another layer of added security. I'm interested in the end result
of this setup...especially the interworking of the v-machines and 
of course the performance of the services running on the physical
machine...

Ramin

> 
> Has anyone used this setup?
> 
> Please reply directly to this e-mail, as I'm not currently on the
> mailing list.
> 
> Best Regards,
> -- 
> Geraldo Macedo		| Phone: +55 21 34753009
> Unix Administrator	| e-mail: glmacedo@quality.com.br
> Quality Software	|
> 

