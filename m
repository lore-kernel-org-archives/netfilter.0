From: val <verbatim.val@gmail.com>
Subject: sar interface stats
Date: Thu, 11 Sep 2008 16:03:10 -0600
Message-ID: <a508421a0809111503o28be41dbs17f29d918f191930@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=VvxL9q8gvT+/EZB6K1X8idHNu2NEWN+Y7XLWAF4zh2Y=;
        b=ELFxThTYlqDQU5SmOBAi6tqUjjssn7BGBk2TGpO0f/TVTIGFLa2TA1Q8XwVjVNgcWA
         +Isaan2Cn7kR1GE/rcEkp7TFMnHX3MZm2B4QgK08KCL4eEQHDH5u/Yr3gbZ2luv3/dPu
         XWsUkOZwS7NiHeRJhohQEY8C331L3smLk9uz4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On a RHEL5.x86_64 firewall type system (one interface
internet-exposed, the other
faces intranet), totals for received bytes/sec and transmitted bytes/sec as
reported by 'sar -n DEV' are always nearly equal for both interfaces.  This
despite the fact that for sure the external interface is kept very busy
dropping the usual internet cruft.  Do interface 'received' statistics as
maintained by the kernel NOT reflect traffic that is DENYed/DROPed/REJECTed
by netfilter (iptables) rules?   If so, any ideas why?  Or if it's not the
case that the dropped traffic isn't counted, why the near equality for total
traffic on both interfaces?  Or am I merely confused, again...

thanks,
val
