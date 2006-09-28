From: Burak Ozgoren <BOzgoren@gunessigorta.com.tr>
Subject: Re: how to write different ip sources on a single rule
Date: Thu, 28 Sep 2006 15:22:36 +0300
Message-ID: <OF19100943.C82981C2-ONC22571F7.00439BBB-C22571F7.004445A5@gunessigorta.com.tr>
References: <51300.193.173.147.3.1159443754.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51300.193.173.147.3.1159443754.squirrel@webmail.sterenborg.info>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> On Thu, September 28, 2006 13:35, Burak Ozgoren wrote:
> > Hi,
> >
> >
> > I know i can write source ip within a ip range or with a network mask. 
For
> > example: 192.168.0.5-192.168.0.15 or 192.168.0.0/24
> >
> >
> > Can i write it for single ip. Like 192.168.0.5 and 192.168.0.9
> 
> You can use the second notation (192.168.0.0/24), but for the first you 
need
> the iprange match.
> 
> 
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-iprange
> 
> 
> 
> Grts,
> Rob
> 

I know about range, and mask but need a rule like for example:

Accept port 22 connections from 192.168.0.5, 10.10.60.163, 212.12.X.X

Now i am writing 3 different rules for these.

Thanks for the reply.


