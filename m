From: Stephen CS Howe <info@fabsurplus.com>
Subject: Re: error: ip_tables.o init_module:Device or resource busy
Date: Mon, 10 Nov 2003 21:50:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068497407.5220.297.camel@twogiga.tower>
References: <3FAFCFEC.8010700@fabsurplus.com>
	 <1068491048.3652.2.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068491048.3652.2.camel@dchws.TQMcube.com>
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
To: "David C. Hart" <dch@TQMcube.com>
Cc: Iptables Mailing List <netfilter@lists.netfilter.org>

Dear All,

Okay, I have managed to fix the problem in a "no-brain" way.
The problem had probably) occurred because I installed the new version
of iptab(les from the source package, and I (stupidly) had it installed
at the same time as the old iptables package .
I got rid of all the iptables installs (and ipchains and auto-installed
firewalls) I could find on my disk, and reinstalled iptables 1.2.8-8
from an rpm.
Now everything seems to work !
Phew, I am saved from kernel compiling once again...
Thanks for everybodies' input

steve 

On Mon, 2003-11-10 at 20:04, David C. Hart wrote:
> On Mon, 2003-11-10 at 12:50, Steve wrote:
> > I'd like to preface this mail by saying that if a little knowledge is a 
> > dangerous thing, then I am very dangerous....
> > 
> > I have recently installed redhat 9.0 over the top of RH V7.3 and then I 
> > upgraded to iptables 1.2.7a with a 2.4.20-18.9 kernel using apt-get.
> > When I try to do anything with iptables, I get the following error:-
> > 
> Presumably that's a stock RH kernel. For starters, 2.4.22 is completely
> stable and offers a noticeable improvement in throughput. You might want
> to custom compile and install it yourself.
> 
>                                ---------
>             Quality Management - A Commitment to Excellence


