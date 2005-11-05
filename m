From: Matt Domsch <matt@domsch.com>
Subject: Re: pptp & NAT
Date: Sat, 5 Nov 2005 08:22:07 -0600
Message-ID: <20051105142207.GA29131@domsch.com>
References: <436ADB4C.7070800@exse.net> <436ADCFB.6070201@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <436ADCFB.6070201@snapgear.com>
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
To: Philip Craig <philipc@snapgear.com>, laforge@netfilter.org
Cc: netfilter@lists.netfilter.org

On Fri, Nov 04, 2005 at 02:00:59PM +1000, Philip Craig wrote:
> Please try the attached patch.  It has fixed a problem for someone else,
> and I think this problem may be the same, but I'm not sure.

With this patch applied, it's working for me.

 
> > - I am unable to estabish two pptp connections from one client, I can 
> > connect to one pptp server and I can connect to a second pptp server, 
> > but the second connection never accepts any traffic, when I stop the 
> > first connection, the second connection begins to work. Is this a bug or 
> > a known missing feature ?
> 
> This is intended to work.  I haven't personally tested it in
> 2.6.14 though.

Using the endian fix patch and this patch (both are attached to bug
397), this is working for me on a 2.6.14 kernel (really, git HEAD from
yesterday plus these two patches).  I've got 2 clients, one WindowsXP,
one Fedora Core 4, hitting the same PPTP server at the same time.
Sincere thanks to both you and Harald for this effort!

Thanks,
Matt

