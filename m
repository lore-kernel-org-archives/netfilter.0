From: "Franck" <franck@zoccolo.com>
Subject: RE : DNAT probs
Date: Mon, 10 Feb 2003 14:35:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002601c2d109$4ee55b40$29a2a8c0@dev.gcf.fr>
References: <200302101412.26834.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302101412.26834.roy@karlsbakk.net>
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
To: 'Roy Sigurd Karlsbakk' <roy@karlsbakk.net>, netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Roy 
> Sigurd Karlsbakk
> Sent: Monday, February 10, 2003 2:12 PM
> To: netfilter@lists.netfilter.org
> Subject: DNAT probs
>
> The firewall (netfilter/iptables) doesn't seem to be able to do 
> the dmz -> netfilter -> dmz NATing.
> 
> Any ideas?

This is not a problem, because this behaviour is documented. So this is
a feature :-)

Maybe you should have a look to the netfilter NAT howto, especially this
chapter :
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html


