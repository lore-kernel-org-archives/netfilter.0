From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Firewall setting
Date: Sat, 8 Sep 2007 19:25:29 +0200
Message-ID: <1814bfe70709081025o4639004dyb1fc8ab16fb42c5b@mail.gmail.com>
References: <46E28DD8.1040404@ita.org.mo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=uRv6SmU7JHVcbAZazuqkXafYxSBavg/ltj6WiyQ4wSI=;
	b=hJKHJFcJtg3AFZBPGYHPMYfB5OuOlIIVsJsi4N4URyHKy3DIuzVZTWm4939+99rZ6mgA/0wEnkN44GOaxRiGGsz3oxTa7TRH1SNhY+0o9cizTGqGZwPe2e3Ui5AYC2p0rfiNKmTXwiqn8CTzL+JLGs8/hrnXrmcYJhpqAipf4dc=
In-Reply-To: <46E28DD8.1040404@ita.org.mo>
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
Content-Type: text/plain; charset="us-ascii"
To: "edwardspl@ita.org.mo" <edwardspl@ita.org.mo>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Dear Edward,

it is not very clear what you want to make. If you want to allow ssh
connections to specific host AFAIK the below can help

#!/bin/bash

iptables -F
iptables -t nat -F
iptables -t mangle -F

iptables -X
iptables -t nat -X
iptables -t mangle -X

# Setting policies....Drop everything and later allow what you need

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp --dport 22 -j ACCEPT

Related to ftp, in the following link you will find explanation
related ( or some other source ) to how ftp works.
Link:
http://slacksite.com/other/ftp.html#active

Best wishes

Elvir Kuric

PS: what you mean by this  "  file 1 " " file 2 "




On 9/8/07, edwardspl@ita.org.mo <edwardspl@ita.org.mo> wrote:
> Dear All,
>
> For the Firewall setting, how can we use the ftp and ssh service ?
>
> For file 1 :
>
> #!/bin/bash
>
> modprobe ip_tables
> modprobe ip_nat_ftp
> modprobe ip_conntrack
> modprobe ip_conntrack_ftp
>
> iptables -F
> iptables -X
> iptables -F -t nat
> iptables -X -t nat
> iptables -F -t mangle
> iptables -X -t mangle
>
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -t nat -P OUTPUT ACCEPT
> iptables -t nat -P PREROUTING ACCEPT
> iptables -t nat -P POSTROUTING ACCEPT
> iptables -t mangle -P PREROUTING ACCEPT
> iptables -t mangle -P POSTROUTING ACCEPT
> iptables -t mangle -P INPUT ACCEPT
> iptables -t mangle -P OUTPUT ACCEPT
> iptables -t mangle -P FORWARD ACCEPT
>
> For file2
>
> iptables -P INPUT DROP
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
> iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
>
> Edward.
>
>

