From: David Cannings <lists@edeca.net>
Subject: Re: Bypass transparent proxy(Squid)
Date: Wed, 31 Mar 2004 19:40:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403311940.01769.lists@edeca.net>
References: <040EAEDD7A465C4AA0350CB69A326D550C392D@backup2.GODO-2000>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <040EAEDD7A465C4AA0350CB69A326D550C392D@backup2.GODO-2000>
Content-Disposition: inline
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

On Wednesday 31 March 2004 19:29, Jerry Robles de Medina wrote:,
> I have read somewhere along the posts that it is possible to let 2 pc's
> (ip's) bypass a transparent proxy server(squid cache). I have tried it
> in the rc.firewall.up file but I cannot get it working. 

Please explain what you have tried, including the output of your chains 
from:

iptables -L -nvx; iptables -L -t nat -nvx

David

