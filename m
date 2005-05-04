From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: Installing iptables 1.31
Date: Wed, 04 May 2005 15:28:46 +0200
Message-ID: <4278CE0E.6060200@danbbs.dk>
References: <000b01c5502d$ff4c0650$2101a8c0@compaq>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000b01c5502d$ff4c0650$2101a8c0@compaq>
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

Ken Hilliard wrote:
> I've got a vanilla RH9 installing with (the bundled) iptables version
> 1.27a. I would like to upgrade to the current version. Are there any
> instructions on how to do this? 

Download the sources, configure and make. If no problems so far, rpm -e 
the distro iptables, and make install your own stuff.

-- 
Kind regards,
Mogens Valentin


