From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Many not-new hits from port 80 when surfing their site
Date: Mon, 29 Dec 2003 05:20:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072693220.2044.2.camel@grendel>
References: <200312290111.30422.andy@asjohnson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312290111.30422.andy@asjohnson.com>
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
To: "Andrew S. Johnson" <andy@asjohnson.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-12-29 at 02:11, Andrew S. Johnson wrote:
> Several times now, I have seen a lot of entries in syslog which
> seem to be associated with browsing a particular site, but for
> some reason get dropped as "not-new". 

Please see the archive. This has been asked and answered about 3 times
in the last month. Short answer, its a time-out issue during session
tear down and not something to worry about. ;-)

C



