From: Saad Faruque <faruque@gmail.com>
Subject: Re: netfitler against Trojans and worms
Date: Mon, 5 Jul 2004 20:46:19 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1d7da3f40407050746589209b5@mail.gmail.com>
References: <1d7da3f40407050659476384b7@mail.gmail.com> <200407051510.06470.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407051510.06470.gdh@acentral.co.uk>
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

I did think of doing  it the other way around, but again i have to
list all the internet services that are being used which is also
changing continuously. but again well known ports can cause problem as
well. wouldn't it be nice if i am being able to detect them from the
port string type, flag, protocol .. with any or any of their
combination. more like a layer 7 filtering. im just trying to find a
smarter way of doing it, which will be more effective and could be
updated easily.
Regards,
Saad

On Mon, 5 Jul 2004 15:10:06 +0100, Gavin Hamill <gdh@acentral.co.uk> wrote:
> On Monday 05 July 2004 14:59, Saad Faruque wrote:
> 
> > i did find couple of sites ex.
> > (http://www.doshelp.com/trojanports.htm) which lists some ports. but i
> > really am not sure if u simply block all these ports if it will effect
> > my clients regular internet activity. any alternative suggestions are
> > also welcome :)
> 
> My suggestion would to stop fire-fighting and instead turn the problem on its
> head.
> 
> Change your default policy from ACCEPT to DROP, and put in rules so that
> people are allowed to access port 80, 443, etc. and only the ports they
> actually NEED access to.
> 
> Cheers,
> Gavin.
> 
>

