From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: How to block particular port based on src IP ?
Date: Fri, 16 Apr 2010 10:46:36 +0100
Message-ID: <r2h56378e321004160246rd9958653p7fa5605e8240589a@mail.gmail.com>
References: <4BC4147D.1060802@infoservices.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type;
        bh=7iJOG8ygrQQbEZatfmbPUvl/sJ1q72v4k3Qq7nSWQTU=;
        b=Viz4GtjLtCOf54KyDG0Pe7ZuMujFf/dJPo3s1ysp8yhGJaMKgxC/Yfr/AZF3ilE1We
         bZMmSmU8leGqdEcHQXt2l8kScUaa8xwRenJ3aNGAFuleVZeyH3WRXNZyDxrupO2KpfeR
         VrjmvhGfh37NXvq99mNq7xVtjlisvhNHQOWDk=
In-Reply-To: <4BC4147D.1060802@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>, netfilter@vger.kernel.org

On 13 April 2010 07:51, J. Bakshi <joydeep@infoservices.in> wrote:


> I am trying to make an arrangement that rather blocking the IP,; only
> the access to the ssh port will be blocked from that IP. So the other
> services i.e. imap, apache will be still accessible from the IP
> excluding ssh. Is it possible ?


Yes. All you need do is change your drop rule to the following:
iptables -A INPUT -p tcp --dport ssh -m mark --mark 0x1 -m recent
--set --name sshoverflow
--rsource -j DROP

The way the rule works is effectively a logical and so its say if the
destination is the ssh port and the ip address is in the recent list
then drop the packet. This way only ssh is denied to the bad guy
rather than everything... might be better to use, for instance,
iptables -A INPUT -p tcp -m multiport  --dports ssh -m mark --mark 0x1
-m recent --set --name sshoverflow
--rsource -j DROP

You can then add other services prone to brute force attacks to the drop list...

(Taken me a while to reply as I've been preoccupied with work and
broken cheekbone thanks to some drunk chavs :()


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://www.topcashback.co.uk/ref/rhorton
