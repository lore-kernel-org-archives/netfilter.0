From: "=?ISO-8859-2?Q?B=B3a=BFej_=A6lusarek?=" <blazej.86@gmail.com>
Subject: Re: No masquerade?
Date: Fri, 20 Jul 2007 16:27:44 +0200
Message-ID: <5de7cdb50707200727v2b2447c2k539fafc16ca5f8e6@mail.gmail.com>
References: <5de7cdb50707131701y2584d4f3q2cddbc9206e8aadb@mail.gmail.com>
	<5c6851530707190939odb6cdc5jc0bb909f80aa261a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=UPB2Xp0LkA+3SWBroeV9zIkEHZRYk+cuxuGRNMxN9apSN7Mw6BCE2HaLb8VfVzd+c2+GMhYRklxHBUI7t6umsjHnEot0H6ms/JtyFXna9Ft4pZDjyVC06QHRZi9n0n1kbZDsD86medgSh7t2YohfkImDYLBeMbgEPQNv/M6d9Ug=
In-Reply-To: <5c6851530707190939odb6cdc5jc0bb909f80aa261a@mail.gmail.com>
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

No,
sysctl -a | grep forward:
net.ipv4.conf.ra0.mc_forwarding = 0
net.ipv4.conf.ra0.forwarding = 1
net.ipv4.conf.eth0.mc_forwarding = 0
net.ipv4.conf.eth0.forwarding = 1
net.ipv4.conf.lo.mc_forwarding = 0
net.ipv4.conf.lo.forwarding = 1
net.ipv4.conf.default.mc_forwarding = 0
net.ipv4.conf.default.forwarding = 1
net.ipv4.conf.all.mc_forwarding = 0
net.ipv4.conf.all.forwarding = 1
net.ipv4.ip_forward = 1

The -s or -o options don't work either, maybe it's amd64? I am on
gentoo 2.6.19-r5.

