From: Adam Young <adam@vbfx.com>
Subject: Re: how to prevent a user from accessing the inernet from my machine
Date: Tue, 7 Sep 2004 23:16:31 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040907231631.2047fc25@adrock.vbfx.com>
References: <1321.81.10.7.114.1094610544.squirrel@81.10.7.114>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1321.81.10.7.114.1094610544.squirrel@81.10.7.114>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 8 Sep 2004 05:29:04 +0300 (EEST)
alaadin@alaadin.org wrote:

> Hello,
> 
> if i have a user on my machine
> 
> and i do not want him to access the internet from my machine ..
> 
> how can this be done ?
> 
> when i do
> 
> [root@Shell iptables-1.2.11]# iptables -A OUTPUT --uid-owner
> his-number-uid -d 0/0 -j DROP
> 
> iptables v1.2.11: Unknown arg `--uid-owner'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> it gives me this error .. ?
> 
> 

Assuming you have the 'owner' module, use

iptables -A OUTPUT -m owner --uid-owner <his_uid> -d 0/0 -j DROP

that should work for you


-- 
    Adam Young	<adam_at_vbfx_dot_com>
    http://www.vbfx.com/
    GPG Key - 5B3375F8


