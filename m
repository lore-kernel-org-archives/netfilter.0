From: Askar <askarali@gmail.com>
Subject: Re: howto stop who has xxx.xxx.xxx tell xxx.xxx.xxx.x
Date: Fri, 11 Mar 2005 16:51:14 +0500
Message-ID: <a0f69e505031103515a9e317@mail.gmail.com>
References: <a0f69e505031103393d70419@mail.gmail.com>
	<011501c5262f$a93cf530$1251960a@rsirbu2kp>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <011501c5262f$a93cf530$1251960a@rsirbu2kp>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

what if my box has public ip ?



On Fri, 11 Mar 2005 13:44:18 +0200, Alex Sirbu <alex@as.ro> wrote:
> You shouldn't stop that.
> Those are ARP requests that are sent to the broadcast . Without them your
> subnet will not be functional any more.
> 
> 
> -Alex Sirbu-
> alex@as.ro
> 
> ----- Original Message -----
> From: "Askar" <askarali@gmail.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Friday, March 11, 2005 1:39 PM
> Subject: howto stop who has xxx.xxx.xxx tell xxx.xxx.xxx.x
> 
> > hi list,
> >
> >
> > when i check #tcpdump -n -i eth0, even though im not browsing in can
> > see none stopping lines for ...
> >
> > arp who-has xxx.xxx.xxx.xxx tell xxx.xxx.xxx.x
> > .
> > .
> > .
> > .
> > howto stop this with iptables, yep I know tcpdump shows packets before
> > "iptables" do, and also like to undertand why so many arp is
> > generating on our network ?
> >
> > regards
> >
> > --
> > I love deadlines. I like the whooshing sound they make as they fly by.
> > Douglas Adams
> >
> 
> 


-- 
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

