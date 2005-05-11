From: Pete Toscano <pete-netfilter@verisignlabs.com>
Subject: Re: SSH Brute force attacks
Date: Wed, 11 May 2005 15:04:18 -0400
Message-ID: <42825732.8010206@verisignlabs.com>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42824D1E.7040508@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: iptables <netfilter@lists.netfilter.org>

Taylor, Grant wrote:
>> iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds
>> 60 -m recent --hitcount 4 --set --name SSH -j RETURN
>>
>> this what I get back:
>> =====================
>> [root@abc root]# iptables -A SSH_Brute_Force -m recent --name SSH !
>> --rcheck --seconds 60 -m recent --hitcount 4 --set --name SSH -j RETURN
>> iptables v1.2.9: Unknown arg `4'
>> Try `iptables -h' or 'iptables --help' for more information.
>> [root@ns root]#
> 
> 
> I'm betting that you don't have the "recent" match extension compiled in
> to the kernel directly or as a module.  Try "iptables -m recent -h" to
> see if you get any output talking about recent at the bottom or if it
> complains.  I don't think that the recent extension is in the base
> kernel and thus you will have to apply some patches via p-o-m to the
> kernel and iptables and recompile your self.  Once you have support for
> the recent match extension you should be able to do what I have
> suggested.  If you need help just ask.

I get the error Brent gets above, but I do have the recent module:

From the iptables -m recent -h command you suggest:

ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.
http://snowman.net/projects/ipt_recent/

and "--hitcount" is referenced in the help:

--hitcount hits             For check and update commands above.
                                Specifies that the match will only occur
if source address seen hits times.

FWIW, I'm using iptables 1.2.11 in Fedora Core 3.

pete

