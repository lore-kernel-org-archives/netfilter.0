From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Source and Destination port 0
Date: Tue, 15 Jul 2003 15:51:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715195114.GM24604@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF52E359A@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF52E359A@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: Geffrey Velasquez <g_netfilter@netfids.com>, netfilter@lists.netfilter.org

On Tue, Jul 15, 2003 at 12:36:16PM -0700, Daniel Chemko wrote:

> 
> How about the fact that these packets are for T/TCP aka Transactional
> TCP, not regular TCP!

Yes. There must be something about T/TCP packets that prevents it
from being matched by a regular "-p tcp" option. I don't know much about
T/TCP but reading rfc1644 might help at least block them on the firewall.

Ramin

