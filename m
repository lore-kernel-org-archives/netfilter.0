From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: ftp connection tracking on multiple ports
Date: Sun, 31 Oct 2004 09:34:49 +0200
Message-ID: <1403218a041031003423417908@mail.gmail.com>
References: <1403218a0410280318a6ed55b@mail.gmail.com>
	<1098967289.3029.3.camel@hubcap.ljm.dom>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098967289.3029.3.camel@hubcap.ljm.dom>
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
To: netfilter <netfilter@lists.netfilter.org>

Well, I did that before posting to the list.
Now I doubt it is a networking problem !!! there are reasons to doubt.


On Thu, 28 Oct 2004 08:41:29 -0400, Jason Opperisano <opie@817west.com> wrote:
> On Thu, 2004-10-28 at 06:18, Mohamed Eldesoky wrote:
> 
> 
> > Dear all,
> >
> > I have a server that runs FTP on two ports, port 21 and port 45 (for
> > strange reasons)
> > Now, i want conntrack to track the connections of both ports and their
> > data ports !!
> >
> > I did that in my firewall script
> > /sbin/modprobe ip_conntrack_ftp ports=21,45
> > $IPTABLES -A linweb_chain -p tcp -m multiport --destination-port
> > 80,21,45 -j ACCEPT
> >
> > Is that all I need ??
> 
> iptables -A linweb_chain -m helper --helper ftp -j ACCEPT
> 
> -j
> 
> --
> Jason Opperisano <opie@817west.com>
> 
> 


-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

