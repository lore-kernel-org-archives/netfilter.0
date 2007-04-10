From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: iptables-retore very slow
Date: Tue, 10 Apr 2007 19:45:16 +0200
Message-ID: <461BCD2C.6020808@netfilter.org>
References: <45EC5CFF.5000209@rackage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45EC5CFF.5000209@rackage.com>
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
To: randles@rackage.com
Cc: netfilter@lists.netfilter.org

Rackage | Randles wrote:
> I recently noticed that one of my firewalls was taking a very long time 
> to reboot. Which was odd as its a very new  machine.
> 
> On investigation is seemed to be the iptables-restore command that was 
> adding 10+ minutes to the boot-up times.

Are you using iptables >= 1.3.x?

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of 
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

