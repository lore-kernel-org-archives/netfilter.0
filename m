From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Newbie question about having multiple destination addresses in
 a chain entry
Date: Sun, 05 Jan 2003 14:28:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1832F1.2060302@fugmann.dhs.org>
References: <3E181977.4020204@aut.ac.nz> <20030105124531.GJ16581@miggy.org> <3E182F8E.3090601@fugmann.dhs.org> <3E183111.8090504@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E183111.8090504@aut.ac.nz>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ian Batterbee <ian.batterbee@aut.ac.nz>
Cc: netfilter@lists.netfilter.org

Ian Batterbee wrote:
> One thing though - I see you've use the mangle table - how does it 
> differ from the nat table ?

My fault. It should have been the nat table, as DNAT rules are not 
allowed in the mangle table. Sorry for the confusion.

Regards
Anders Fugmann

-- 
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org


