From: "P.Italiaander" <pc-secure@home.nl>
Subject: Re: Performance Decrease
Date: Mon, 12 May 2003 01:36:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305120136.48436.pc-secure@home.nl>
References: <001201c31411$b3ccaa40$c90c010a@TMCSHAWN>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c31411$b3ccaa40$c90c010a@TMCSHAWN>
Content-Disposition: inline
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

Op dinsdag 6 mei 2003 22:54, schreef Shawn Mall:
> I am running iptables version 1.2.2 -- This has never been an issue until I
> have begun to do some bandwidth intensive stuff. I also had a friend of
> mine point this out as well...
>
> There seems to be a huge performance decrease when using iptables. I am not
> sure where the bottleneck is occuring. My friend has a 3Mbit/sec pipe, was
> getting about 500kb/sec on average, and since implenting iptables, is only
> receiving about 50kb/sec. That is a huge decrease. Can anybody point out
> what is going wrong?
>
> Thanks,
> Shawn
 
need more info on rule-set for this.

Perhaps a faulty rule with an 'limit' and high burst max,  so instead that 
limiting from outside (like Pings of Death) , you limit your own connection.


Pascal
 

