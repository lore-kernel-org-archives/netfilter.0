From: "Tim Evans" <tkevans@tkevans.com>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 08:29:12 -0400
Message-ID: <20060626122912.M54717@tkevans.com>
References: <200606260702.57739.tyche@ica.net>
Reply-To: tkevans@tkevans.com
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200606260702.57739.tyche@ica.net>
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
To: tyche <tyche@ica.net>, netfilter@lists.netfilter.org

On Mon, 26 Jun 2006 07:02:57 -0400, tyche wrote
> over the last few days, my server has been attacked. i would 
> like to limit remote logon attempts by address so that if 
> someone tries to logon from an ip address and fails 3 times, 
> my computer will ignore repeated attempts from that ip 
> address. any idea how to make a rule for this?

For blocking ssh logins, see http://denyhosts.sourceforge.net/
--
Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
tkevans@tkevans.com             |    Owings Mills, MD 21117
http://www.tkevans.com/         |    443-394-3864
http://www.come-here.com/News/  |    


