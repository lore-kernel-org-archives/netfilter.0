From: Sebastien Tricaud <sebastien.tricaud@wengo.fr>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 13:43:49 +0200
Message-ID: <449FC875.50000@wengo.fr>
References: <200606260702.57739.tyche@ica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: tyche <tyche@ica.net>
Cc: netfilter@lists.netfilter.org

Netfilter doesn't know about authentication success of failure. Linux
PAM is what you are looking for.
You can simply modify your PAM configuration and use the pam_access
and/or pam_tally module.

You can read documentation about it there :
http://www.kernel.org/pub/linux/libs/pam/Linux-PAM-html/pam-6.html



tyche wrote:
> over the last few days, my server has been attacked. i would 
> like to limit remote logon attempts by address so that if 
> someone tries to logon from an ip address and fails 3 times, 
> my computer will ignore repeated attempts from that ip 
> address. any idea how to make a rule for this?
>
> tia
>
> tyche
>   


