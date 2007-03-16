From: "Ross Cameron" <ross.cameron@linuxpro.co.za>
Subject: Re: iptables as DHCPD
Date: Fri, 16 Mar 2007 08:15:40 +0200
Message-ID: <35f70db10703152315x6a19c0c1x8a1d1bdd8635beca@mail.gmail.com>
References: <001001c7672c$31034bb0$7100000a@W2KMPLOURDE>
Reply-To: ross.cameron@linuxpro.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:reply-to:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=NlqUL+4loCCFQG/yy9Q4N3v7b1CC4GgAADDACj9KM5Sn6zQGgQaseYZNTUkdlxKs4E2f4u0ZxbaB/OVKBbUhFp8OWo/gD2RHXQUlvke2TDyhSXIyj1ojr1CU6z0GpN27e5wkoBQ3y4aLP4c6PJQyoMfv50jBKDJCr1Ah8+AWF0s=
In-Reply-To: <001001c7672c$31034bb0$7100000a@W2KMPLOURDE>
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
To: Michael Plourde <mplourde@digicom.ca>
Cc: netfilter <netfilter@lists.netfilter.org>

On 15/03/07, Michael Plourde <mplourde@digicom.ca> wrote:
> Hi,
>
> is it possible to use iptables as dhcpd ? I mean:

Why would you want to do that?

The people at ISC build a VERY competant RFC compliant DHCP server
thats available under an Open Source license.

IPtables (whilst extremely flexible) is a FIREWALL and IP-filter,...
NOT a network service.
It does not and cannot broadcast information onto the network,... that
is NOT its purpose or design.

Regards,...
Ross Cameron

