From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: not [!] rule is not working
Date: Tue, 14 Aug 2007 09:27:56 -0500
Message-ID: <46C1BBEC.8030102@riverviewtech.net>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/14/07 01:45, pankaj jain wrote:
> I was trying to drop arp packets such that only specific interface 
> should answer the arp requests.

I don't know if it applies to your situation or not, but have you tried
the configurations used in the Linux Virtual Server (a.k.a. LVS) to
prevent an interface from responding to ARP requests, i.e. via /proc
settings?



Grant. . . .

