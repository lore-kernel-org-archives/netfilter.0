From: "Rafael Paris" <raparis@gmail.com>
Subject: DNAT Problems
Date: Wed, 28 Feb 2007 10:33:19 -0400
Message-ID: <431a83ad0702280633w2c0a88ddsa2132c44d3cbbe39@mail.gmail.com>
References: <431a83ad0702280632w5c72b1d8rec20f41424b1927c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=j7/FIVknQVrNFX+8yfqAFZrHVddQhb8UoBoYVfgbzth80TCZ3NN6X2cDCI/XsWTW8tr4MwIm9GC0fE5pYTCzT3A/j+kM90xrOuwz3igY7VgNn+w5+TfS6T/Pd98tPQb11S2aUgdjU6vCmHTdJefyjnvf8bTriItKBvCxThwG5hQ=
In-Reply-To: <431a83ad0702280632w5c72b1d8rec20f41424b1927c@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Good morning everyone...

I have been trying to have access to my internal mail server from
internet but always get connection timed out.
This is a very short set of rules being used for testing purposes with
no success:

iptables -P FORWARD ACCEPT
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT

iptables -t nat -A PREROUTING -p tcp -i ppp0 -d <external_fixed_ip>
--dport 110 -j DNAT --to-destination <internal_ip:110>
iptables -t nat -A PREROUTING -p tcp -i ppp0 -d <external_fixed_ip>
--dport 25 -j DNAT --to-destination <internal_ip:25>

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to <external_fixed_ip>

I'm using one ethernet device with my lan ip address and I can reach
the mail server from this host.
 My kernel is 2.6.19.2 with iptables 1.3.7

I also used these rules with kernel 2.4.34 and nothing.

Thanks in advanced for any comments.

Cheers,
Rafael

