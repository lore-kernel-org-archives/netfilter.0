From: Jason Opperisano <opie@817west.com>
Subject: Re: Strange connection problems.
Date: Mon, 11 Apr 2005 18:04:08 -0400
Message-ID: <20050411220408.GA23903@bender.817west.com>
References: <B39AA5DB06510C4591C6EDDD580B0B81B5315D@mail.int.sealevel.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <B39AA5DB06510C4591C6EDDD580B0B81B5315D@mail.int.sealevel.com>
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

On Fri, Apr 08, 2005 at 05:14:09PM -0400, Ryan Belcher wrote:
> Hi All,
> 
> Below I've posted my FW config.  It's handling 3 interfaces.  ppp0, eth0, an ath0.
> It's on Linux kernel version 2.6.10.
> 
> Pretty much everything works as I expect except for a strange issue with certain websites while trying to connect from clients within my network.  For example, penny-arcade.com, americanexpress.com SSL logins, and a few others.  If you want to poke at this configuration, penny-arcade will appear to begin connection but after the SYN, ACK, then HTTP GET sequence, the HTTP response never gets here (according to Ethereal anyways).  If I try connecting from the actual firewalling box itself, it works fine.
> 
> Does anyone have any ideas?

sounds like the classic description of an MTU issue.

-j

--
"Tom Tucker: This is Tom Tucker... Tucker's evil twin Todd Tucker
 out to destroy his brother's reputation. Now I'm going to go back inside
 my motel room where I'm going to have freaky sex with my prostitute
 with whom I still have another 45 minutes."
        --Family Guy

