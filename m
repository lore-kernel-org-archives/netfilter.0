From: Eric Leblond <eric@inl.fr>
Subject: RE: Authentication in a Firewall Question
Date: Wed, 25 Aug 2004 19:15:57 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093454155.3302.3.camel@coati>
References: <7C9884991ADAE0479C14F10C858BCDF56794AA@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF56794AA@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-08-25 at 19:02, Daniel Chemko wrote:
> > A firewall that rejects all traffic to everyone, except for one port.
> This one port is used to authenticate an IP address through a
> 
> pam_iptables is a nice tool, although it needs a little updating to
> assign custom rules per/user, etc.. It requires that you have an open
> out-of-band connection to a pam service on the firewall.

NuFW is a PPL solution for Linux that provide out-of-band user
authentication. More informations available at :
	http://www.nufw.org

BR,
-- 
Eric Leblond <eric@inl.fr>
INL


