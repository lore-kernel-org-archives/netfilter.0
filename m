From: Geffrey Velasquez <g_netfilter@netfids.com>
Subject: Re[2]: Source and Destination port 0
Date: Tue, 15 Jul 2003 15:04:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1579619637.20030715150430@netfids.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E359A@alderaan.smgtec.com>
 <20030715195114.GM24604@cannon.eng.us.uu.net>
Reply-To: Geffrey Velasquez <g_netfilter@netfids.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030715195114.GM24604@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

Hello Ramin and Daniel, thank you for the information, I will read the
RFC then I will try to block on the firewall, I will be giving more
information to the list.

Regards,
Geffrey


RD> On Tue, Jul 15, 2003 at 12:36:16PM -0700, Daniel Chemko wrote:

>> 
>> How about the fact that these packets are for T/TCP aka Transactional
>> TCP, not regular TCP!

RD> Yes. There must be something about T/TCP packets that prevents it
RD> from being matched by a regular "-p tcp" option. I don't know much about
RD> T/TCP but reading rfc1644 might help at least block them on the firewall.

RD> Ramin



-- 
Best regards,
 Geffrey                            mailto:g_netfilter@netfids.com


