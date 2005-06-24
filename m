From: "Sreenivasa Rao.K" <sreenivask@ckarsystems.com>
Subject: Re: bolcking gmail in squid
Date: Fri, 24 Jun 2005 16:31:46 +0530
Message-ID: <WorldClient-F200506241631.AA31460577@ckarsystems.com>
References: <WorldClient-F200506241403.AA03490554@ckarsystems.com>
	<3063e50506240235521d12a0@mail.gmail.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e50506240235521d12a0@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Alexandru Dragoi <waruiinu@gmail.com>, netfilter@lists.netfilter.org


 Dear Alexandru ,

 These acls didn't work.

I want to give access to google website and at the sametime block gmail 
website in squid  from accessing.


Regards,
Sreenivas. 

-----Original Message-----
From: George Alexandru Dragoi <waruiinu@gmail.com>
To: "Sreenivasa Rao.K" <sreenivask@ckarsystems.com>
Cc: netfilter@lists.netfilter.org
Date: Fri, 24 Jun 2005 05:35:47 -0400
Subject: Re: bolcking gmail in squid

> acl gmail dstdomain .mail.google.com
> acl gmail dstdomain .gmail.com
> acl gmail dstdomain .gmail.google.com
> 
> 
> And a very first rule like this:
> 
> http_access deny gmail
> 
> On 6/24/05, Sreenivasa Rao.K <sreenivask@ckarsystems.com> wrote:
> > 
> > 
> > HI,
> > 
> > Can anyone help me how to block giving access to gmail by allowing
> > google.com website in squid.
> > 
> > 
> > Regards,
> > Sreenivasa Rao.K
> > 
> > 
> > 
> 
> 
> -- 
> Bla bla


