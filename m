From: Tomasz Korycki <engine2@flow.mine.nu>
Subject: Re: ff:ff:ff:ff:ff:ff mac problem
Date: Sat, 26 Jun 2004 11:45:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20040626113341.0c319d30@198.52.32.246>
References: <1088063112.3839.8.camel@joel.d2visp.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088063112.3839.8.camel@joel.d2visp.com>
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
Content-Transfer-Encoding: 7bit
To: jnsolanki@d2visp.com
Cc: netfilter <netfilter@lists.netfilter.org>

At 03:45 2004-06-24, joel solanki wrote:
>Hi all,
>
>I am having problem in my linux server.
>I am using redhat 9.0 with default iptables rpm.
>I have Nat of this server.
>ff:ff:ff:ff:ff:ff This mac address is creating problem in my network.
>Coz i cant find the ip address  of this mac address device.

FF:FF:FF:FF:FF:FF is defined as an invalid MAC address. When hardware goes 
belly-up, it is (supposed to) identify itself so, so that:
1. it does not duplicate any existing MAC
2. it is obvious enough to be immediately recognised as indication of a problem

In other words: most likely You have a dead NIC on Your ethernet. 


