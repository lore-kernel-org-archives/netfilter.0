From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: filtering at bridge
Date: Tue, 17 Feb 2004 18:20:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077038440.901.0.camel@nienna.balabit>
References: <010c01c3f5c1$0597bef0$15a02bca@Rangga>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <010c01c3f5c1$0597bef0$15a02bca@Rangga>
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
To: Kris <kristiadi_himawan@dtp.net.id>
Cc: netfilter <netfilter@lists.netfilter.org>


  Hi,

On Wed, 2004-02-18 at 02:46, Kris wrote:
> Does anyone know, iptables script for traffic blocking at a linux
> bridge.

  You have to use ebtables for this, not iptables. Take a look at
http://ebtables.sourceforge.net

-- 
 Regards,
   Krisztian KOVACS



