From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Tracing the passage of packets thru the various chains
Date: Sat, 6 Nov 2004 16:26:33 +0200
Message-ID: <3063e504110606267f3b4981@mail.gmail.com>
References: <418CC14C.4080803@swiftdsl.com.au>
	<1099749214.2116.34.camel@localhost>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1099749214.2116.34.camel@localhost>
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
To: Netfilter users list <netfilter@lists.netfilter.org>

There is a patch in patch-o-matic which add a target called TRACE
http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-TRACE



On Sat, 06 Nov 2004 08:53:34 -0500, John A. Sullivan III
<jsullivan@opensourcedevelopmentcorp.com> wrote:
> On Sat, 2004-11-06 at 07:19, Taso Hatzi wrote:
> 
> 
> > The subject says what I want to do. Is there any way I can get a
> > stock kernel (Mdk 9.1 in this case) to show me what's going on?
> Yes, we do it all the time when trouble shooting in the ISCS network
> security management project (http://iscs.sourceforge.net).  Simply use
> the LOG target.  What the LOG rule should look like and where it should
> be placed depends on what you want to do but that's what we generally
> use to troubleshoot problems between wire in and wire out!  Hope that
> sends you in the right direction - John
> --
> John A. Sullivan III
> Open Source Development Corporation
> Financially sustainable open source development
> http://www.opensourcedevel.com
> 
> 


-- 
Bla bla

