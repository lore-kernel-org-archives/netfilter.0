From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can iptables do this ?
Date: Fri, 2 Jan 2004 19:19:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021919.08337.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com> <20040102114623.79028242.mgale@utilitran.com> <20040102190657.D959B1BF5F2@dtbnet02.databras.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040102190657.D959B1BF5F2@dtbnet02.databras.com.br>
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
To: netfilter@lists.netfilter.org

On Friday 02 January 2004 7:07 pm, Ramoni wrote:

> Hi,
> can iptables do a temp rule ?
> I mean, I need to create rules that will be deleted after x seconds or
> minutes. The time module does not remove the rules as it is not supposed to
> do so. Is there a module that I could say:
> iptables -I FORWARD -s a.b.c.d -j DROP -m xxxxx --minutes 2
> and the rule will be deleted after 2 minutes os something like that ?

No.

Use cron, at, or sleep.

Antony.

-- 
Your work is both good and original.  Unfortunately the parts that are good 
aren't original, and the parts that are original aren't good.

 - Samuel Johnson

                                                     Please reply to the list;
                                                           please don't CC me.


