From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: What is the diference between ipfw of *bsd and netfilter of
	linux?
Date: Mon, 04 Oct 2004 15:32:31 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4161B35F.5060608@pbl.ca>
References: <1096920404.658.4.camel@pretorian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096920404.658.4.camel@pretorian>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Carlos Mario Mora (c4y0) wrote:
> hi!
> 
> im looking for the diference between ipfw and iptables.   Many people
> say to ipfw is more secure of iptables, but they cant explain why that.

If ipfw is what I think it is, than only difference is better connection 
tracking (it tracks TCP window numbers).  However, Netfilter got that 
suppor recently as well (as a patch), and it seems that it will be 
standard part of Linux kernel as of 2.6.9 (at least by looking into the 
ChangeLog, I might be wrong).

Other than that, I don't see why would one be more secure than another. 
  So I'd say they are becoming about the same as security goes.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

