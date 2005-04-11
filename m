From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: netfilter Digest, Vol 9, Issue 20
Date: Mon, 11 Apr 2005 09:40:36 -0500
Message-ID: <002201c53ea4$6c84ac40$f5001eac@riverview.office>
References: <42590541.64d5ebb8.4602.ffffa2dcSMTPIN_ADDED@mx.gmail.com>
	<9927912d05041102416fd81f7b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Visham Ramsurrun <vishamr2000@gmail.com>, netfilter@lists.netfilter.org

Try looking at bonding, (Cisco calls this Ether Chanel).  I personally have
not done any thing like this but I do believe that it is possible.  Normally
you have to have a swtich that is bonding capable, but seeing as you are
using corss over cables I think you can mitigate that factor.



Grant. . . .
----- Original Message ----- 
From: "Visham Ramsurrun" <vishamr2000@gmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Monday, April 11, 2005 4:41 AM
Subject: Re: netfilter Digest, Vol 9, Issue 20


> Hi to all, can any one tell me how to build load-balanced stateful
> iptables firewall .
>
> I am using redhat 9 with an upgraded kernel of 2.6.10.
>
> I have 2 multi-homed PCs (3 NICs each) that are connected by a cross
> cable. The traffic arrives on one of the PC through one interface and
> has to be distributed over the 2 PCs equally and processed by the
> firewall.
>
> How can we do this?
>
> Pls help if you know..
>
> Regards,
> Visham
>
>


