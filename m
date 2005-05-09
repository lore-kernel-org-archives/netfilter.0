From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Mon, 09 May 2005 00:41:16 -0500
Message-ID: <427EF7FC.40707@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C52EC.6020004@riverviewtech.net>	<200505081120.50939.Alistair@nerdnet.ca>	<1115578284.c89d25d0e91ec@webmail.harrisonburg.k12.va.us>
	<20050508225747.GQ12091@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050508225747.GQ12091@samad.com.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Alexander Samad wrote:
> How efficient is recent, I currently scan my log files for 'evil'
> activity and build up a list of around 2000s ip addresses which I place
> into a BLOCKED chain, there is about 2 lines per entry cause I TARPIT
> tcp sessions.  But I could more easily manage it with recent as I can
> just use the test of are they in the list !
> 
> I am presuming it is more efficient to use recent cause it hashes the
> address ! can any one confirm this ?
> 
> A

I'm not sure how ""efficient the recent match extension is as I have not pushed it this far.  Give it a try and let us know.  I know that I personally can now write a lot of code (be it because of lack of trying or other reasons) but I do know that I can help the various developers by using and testing and trying to break their code.  Oh, wait a moment, isn't that what the OSS community is about?  ;)

You might want to check out SnowMan's web page at http://snowman.net/projects/ipt_recent/ on the IPTables recent match.  I'm sure he would be happy to try to answer your question(s) there.  If you do contact SnowMan (via his "About" page, be sure to congratulate him on his (new) baby.)

