From: Jason Opperisano <opie@817west.com>
Subject: Re: mails not going thru'
Date: Mon, 9 May 2005 10:34:03 -0400
Message-ID: <20050509143403.GA4931@bender.817west.com>
References: <fa0e7dfa38f4.fa38f4fa0e7d@vsnl.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <fa0e7dfa38f4.fa38f4fa0e7d@vsnl.net>
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

On Mon, May 09, 2005 at 08:53:33AM +0500, varun_saa@vsnl.net wrote:
> [varun@saamail varun]$ telnet 64.233.185.27 25
> Trying 64.233.185.27...
> 
> No response

try that from the firewall itself.  if it still doesn't work, i would
propose that your ISP blocks TCP port 25 traffic from customer IP's from
leaving it's network (mindspring used to do this, dunno if earthlink
continued the trend as i dropped them after they refused to rethink
their policy).

-j

--
"Peter: I'm looking for some toilet training books.
 Salesman: We have the popular 'everybody poops", or the less popular
 'nobody poops but you'. 
 Peter: Well, you see, we're catholic...
 Salesman: Ah, then you'll want 'you're a naughty, naughty boy, and
 that's concentrated evil coming out the back of you'."
        --Family Guy

