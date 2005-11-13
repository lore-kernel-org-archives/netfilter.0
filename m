From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Identd requests through firewall
Date: Sun, 13 Nov 2005 11:09:05 -0600
Message-ID: <200511131109.06283.rob0@gmx.co.uk>
References: <43776DB5.8050702@rlworkman.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43776DB5.8050702@rlworkman.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Sunday 2005-November-13 10:45, Robby Workman wrote:
> What I would like to do is forward the request to one of the boxes
> behind the firewall (whichever one is attempting a connection with an
> IRC server).  I know how to forward them all to one of the individual
> machines (say box 1), but this does not help if I'm using one of the
> other boxes to connect.

Perhaps an easier solution than a patch of the IRC helper driver to 
handle auth requests: run midentd on your firewall machine.
    http://freshmeat.net/projects/midentd/
Haven't tried it, myself. You would need to ACCEPT auth at the firewall 
(INPUT chain). Probably the only way around that is the aforementioned 
patch.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

