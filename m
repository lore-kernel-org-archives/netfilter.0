From: Jason Opperisano <opie@817west.com>
Subject: Re: (no subject)
Date: Sat, 21 May 2005 15:31:52 -0400
Message-ID: <20050521193152.GA1769@bender.817west.com>
References: <3b29fb79050520200817e1e315@mail.gmail.com>
	<20050521181637.GA1564@bender.817west.com>
	<3b29fb7905052022187076b17d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3b29fb7905052022187076b17d@mail.gmail.com>
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

On Sat, May 21, 2005 at 01:18:15AM -0400, bright true wrote:
> Hello , 
> 
> Thanks for your reply , but can you give me the link of the patch i have to 
> apply 

grab the latest snapshot of PoM available from:

  http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/

for example:

  http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/patch-o-matic-ng-20050520.tar.bz2

you need to have both the source of your running kernel available and
the source of your iptables version available and following the
instructions in the PoM README file.  basic recipe:

  - apply patches from PoM
  - recompile kernel
  - recompile iptables
  - reboot & enjoy

-j

--
"Brian: Excuse me, would you like to taste my smoked meat log?"
        --Family Guy

