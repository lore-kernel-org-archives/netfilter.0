From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: rules for skype
Date: Wed, 13 Jul 2005 12:53:56 +0200
Message-ID: <42D4F2C4.9020706@lopsch.com>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com>	<002401c54fb0$33cdc950$2604a8c0@ndchunk>	<1115106657.14622.62.camel@jasiiitosh.nexusmgmt.com>
	<200507130952.46615.fajarpri@arinet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507130952.46615.fajarpri@arinet.org>
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

Fajar Priyanto schrieb:
> On Tuesday 03 May 2005 14:50, John A. Sullivan III wrote:
> 
>>On Tue, 2005-05-03 at 15:17 +0800, Victor Yeo wrote:
>>
>>>>- Use *tc* to choke the skype traffic. I have a list of apps to allow
>>>>through the network. The rest go into a default pipe of 2 Kbps. This
>>>>deteriorates the performance of the application. I think text chatting
> 
> 
> I've blocked tcp 443, but it seems that skype can go through tcp 80?
> http://www.skype.com/help/guides/firewall.html
> 
> This is really annoying an unethical, don't you think?


You can send all port 80 traffic through a proxy like Squid this should 
prevent Skype from getting through port 80.

