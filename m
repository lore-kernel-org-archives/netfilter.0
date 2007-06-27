From: "Ross Cameron" <ross.cameron@linuxpro.co.za>
Subject: icmp-type question
Date: Wed, 27 Jun 2007 18:27:59 +0200
Message-ID: <35f70db10706270927j3e15b87anc134c458a621b146@mail.gmail.com>
References: <35f70db10706270926u708cc4f4ta0a962ca219ce91e@mail.gmail.com>
Reply-To: ross.cameron@linuxpro.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:reply-to:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=frA+OGsqd/G/8CHz4693tlY2koBlDnpkNrDiVpBFVsvmTGzl5jJMw4nooDGBo876LdpbozDIT5oB9nGTluWPoJMfECClNL7m4065oohTjxGXc7zYNZJoNGJAWYZDMCCD34V94tZW0WTJA5s5UdAp5OWqT4QUe347xtr13rpDJAE=
In-Reply-To: <35f70db10706270926u708cc4f4ta0a962ca219ce91e@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi there list,...

I need to block all
     timestamp-request      and
     timestamp-reply

On eth0 (Inet facing fast ethernet segment on a multi homed Linux
router) but not on eth1 (LAN facing range).

Ive played with it a bit but cant get it to behave,.. I can
selectively filter all other ICMP correctly.
Its been 4weeks of playing and googling and im at my wits end! Plz help.

Ciao ciao and many thanks
Ross

