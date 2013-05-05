From: Alex Flex <aflexzor@gmail.com>
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 04 May 2013 19:27:55 -0600
Message-ID: <5185B59B.1070407@gmail.com>
References: <5185444B.3090602@gmail.com> <9a3b8ec43ac420e45247dd70d2a597e1.squirrel@sqrl.metu.edu.tr> <806D468E-D006-41C3-AD0B-DC24747DC05F@stevek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=q8CPDheDCAuJVyCABLhbhmc/UKQkYdFoItFwm4P8eJo=;
        b=K/kPzHYf6o03RklA+NXSnydTvQcQv5nnbUNji58qt8KFwanTgD4QzT5IUUISlf7fqC
         3weM3cM9nVWTckwPkwTFPkPdejjA62EfOeybA6/xlTBEDEwWr/jXKfQiUjCK2XKjTZNi
         Dmwn1hMSowEceYfgacj6dRNmb2TyYnz7yFNC2fhPshaoRzG4HKGDfBHsBWkQwGVF8WBX
         H5wFwLNPDgADAAOsyklByDzUb/x3cTsHmZ4gBlQ8Te+ZESY7Rwv7w5MNMOqW3Cd//QE+
         pUX6qyIziZZxgo+275Vg238qXQ0I3xuMUs/POgNbD7Q+jfkw6BOaERxiQ2EX4CI2Au69
         F+uw==
In-Reply-To: <806D468E-D006-41C3-AD0B-DC24747DC05F@stevek.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Steven,

In other words you are saying that having the following lines in my 
iptables script defeats the purpose of syn cookies?

/sbin/iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j 
ACCEPT

Just confirming.

Thanks
Alex

