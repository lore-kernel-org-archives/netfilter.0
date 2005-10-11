From: Sandro Dentella <sandro@e-den.it>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 20:58:12 +0200
Message-ID: <20051011185812.GA18949@casa.e-den.it>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<434C0DED.8060203@supportivo.org>
	<1129055791.2415.79.camel@vyatka-39.cablenet.com.ni>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1129055791.2415.79.camel@vyatka-39.cablenet.com.ni>
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
To: netfilter@lists.netfilter.org

On Tue, Oct 11, 2005 at 12:36:31PM -0600, Jorge I. Davila L. wrote:
> well .. the complete rule:
> 
> iptables -A OUTPUT -p tcp -m iprange \
> --src-range 192.168.223.1-192.168.223.2 \
> -j ACCEPT
> 
> iptables: No chain/target/match by that name

i don't think this is an answer any usefull to anybody. In any case I'm not
familiar with -m iprange but your rule works for me:

root@bluff:~# iptables -v -A OUTPUT -p tcp -m iprange --src-range 192.168.223.1-192.168.223.2
  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  source IP range 192.168.223.1-192.168.223.2

So I guess your problem is not in the syntax. Some missing kernel-modules?

sandro
*:-)


-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

