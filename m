From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Download/upload speeds sluggish behind iptables firewall
Date: Fri, 7 May 2004 21:30:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040507203044.GA27959@acentral.co.uk>
References: <20040507201248.78D3F3961@sitemail.everyone.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040507201248.78D3F3961@sitemail.everyone.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 07, 2004 at 01:12:48PM -0700, Joe Riley wrote:
> Dear mailing list,
> 
> I am having a problem with iptables. I have a very simple setup,
> 192.168.0.1 is the interface to the internet - receives speeds upward
> to 150kb/sec - and 192.168.0.2 is my windows xp computer, which is
> getting very crippled speeds of about 10-50kb/sec

My first suggestion is to go back to first principles - you may simply 
have an issue with the crossover connection to your XP box - it may not 
have set the duplex settings correctly.. So, remove your Internet 
connection, and then completely clear the firewall with

$ iptables -F
$ iptables -t nat -F

Now perform some simple tests by FTP'ing files in both directions 
between your Linux box and XP box. If you get slow speeds doing this, 
then netfilter/iptables is not the cause of your grief.

Use 'mii-tool'or 'ethtool' to set/reset/re-negotiate/force the 
speed and duplex parameters for the Linux box :)

Good luck!
Cheers,
Gavin.


